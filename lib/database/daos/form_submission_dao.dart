import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import '../../models/form/form_submission.dart';

/// Data Access Object for form submissions and their records
class FormSubmissionDAO {
  final Database _db;
  final _uuid = const Uuid();

  FormSubmissionDAO(this._db);

  // ============================================================================
  // CREATE
  // ============================================================================

  /// Create a new form submission with its records (transactional)
  Future<String> createSubmission(FormSubmission submission) async {
    final localId = submission.localId.isEmpty ? _uuid.v4() : submission.localId;

    await _db.transaction((txn) async {
      // Insert the main submission
      final submissionId = await txn.insert(
        'form_submissions',
        {
          'local_id': localId,
          'org_id': submission.orgId,
          'template_id': submission.templateId,
          'outing_id': submission.outingId,
          'form_version': submission.formVersion,
          'header_data_json': jsonEncode(submission.headerData),
          'sync_status': submission.syncStatus,
          'created_by_user_id': submission.createdByUserId,
        },
      );

      // Insert all records
      for (final record in submission.records) {
        await txn.insert(
          'form_submission_records',
          {
            'local_id': record.localId.isEmpty ? _uuid.v4() : record.localId,
            'submission_id': submissionId,
            'group_id': record.groupId,
            'record_index': record.recordIndex,
            'data_json': jsonEncode(record.data),
          },
        );
      }
    });

    return localId;
  }

  // ============================================================================
  // READ
  // ============================================================================

  /// Get a submission by its local ID (includes records)
  Future<FormSubmission?> getByLocalId(String localId) async {
    final rows = await _db.query(
      'form_submissions',
      where: 'local_id = ?',
      whereArgs: [localId],
    );
    if (rows.isEmpty) return null;
    return _mapRowToSubmission(rows.first);
  }

  /// Get a submission by its database ID (includes records)
  Future<FormSubmission?> getById(int id) async {
    final rows = await _db.query(
      'form_submissions',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (rows.isEmpty) return null;
    return _mapRowToSubmission(rows.first);
  }

  /// Get all submissions for an organization
  Future<List<FormSubmission>> getByOrgId(int orgId) async {
    final rows = await _db.query(
      'form_submissions',
      where: 'org_id = ?',
      whereArgs: [orgId],
      orderBy: 'created_at DESC',
    );
    return Future.wait(rows.map(_mapRowToSubmission));
  }

  /// Get submissions by template
  Future<List<FormSubmission>> getByTemplate(int orgId, int templateId) async {
    final rows = await _db.query(
      'form_submissions',
      where: 'org_id = ? AND template_id = ?',
      whereArgs: [orgId, templateId],
      orderBy: 'created_at DESC',
    );
    return Future.wait(rows.map(_mapRowToSubmission));
  }

  /// Get submissions pending sync
  Future<List<FormSubmission>> getPendingSyncs(int orgId) async {
    final rows = await _db.query(
      'form_submissions',
      where: 'org_id = ? AND sync_status = ?',
      whereArgs: [orgId, 'pending'],
      orderBy: 'created_at ASC',
    );
    return Future.wait(rows.map(_mapRowToSubmission));
  }

  /// Get count of pending syncs
  Future<int> getPendingSyncCount(int orgId) async {
    final result = await _db.rawQuery(
      'SELECT COUNT(*) as count FROM form_submissions WHERE org_id = ? AND sync_status = ?',
      [orgId, 'pending'],
    );
    return result.first['count'] as int;
  }

  /// Get records for a submission
  Future<List<FormSubmissionRecord>> getRecordsForSubmission(
      int submissionId) async {
    final rows = await _db.query(
      'form_submission_records',
      where: 'submission_id = ?',
      whereArgs: [submissionId],
      orderBy: 'group_id, record_index',
    );
    return rows.map(_mapRowToRecord).toList();
  }

  // ============================================================================
  // UPDATE
  // ============================================================================

  /// Update a submission's header data
  Future<void> updateSubmission(FormSubmission submission) async {
    await _db.update(
      'form_submissions',
      {
        'header_data_json': jsonEncode(submission.headerData),
        'sync_status': 'pending',
        'updated_at': DateTime.now().toIso8601String(),
      },
      where: 'id = ? OR local_id = ?',
      whereArgs: [submission.id, submission.localId],
    );
  }

  /// Update submission sync status
  Future<void> updateSyncStatus(String localId, String status) async {
    await _db.update(
      'form_submissions',
      {
        'sync_status': status,
        'updated_at': DateTime.now().toIso8601String(),
      },
      where: 'local_id = ?',
      whereArgs: [localId],
    );
  }

  /// Mark a submission as synced and update server ID
  Future<void> markSynced(String localId, int serverId) async {
    await _db.update(
      'form_submissions',
      {
        'server_id': serverId,
        'sync_status': 'synced',
        'updated_at': DateTime.now().toIso8601String(),
      },
      where: 'local_id = ?',
      whereArgs: [localId],
    );
  }

  // ============================================================================
  // RECORDS MANAGEMENT
  // ============================================================================

  /// Add a record to a submission
  Future<String> addRecord(int submissionId, FormSubmissionRecord record) async {
    final localId = record.localId.isEmpty ? _uuid.v4() : record.localId;

    await _db.insert(
      'form_submission_records',
      {
        'local_id': localId,
        'submission_id': submissionId,
        'group_id': record.groupId,
        'record_index': record.recordIndex,
        'data_json': jsonEncode(record.data),
      },
    );

    // Mark submission as pending sync
    await _db.update(
      'form_submissions',
      {
        'sync_status': 'pending',
        'updated_at': DateTime.now().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [submissionId],
    );

    return localId;
  }

  /// Update a record
  Future<void> updateRecord(FormSubmissionRecord record) async {
    await _db.update(
      'form_submission_records',
      {'data_json': jsonEncode(record.data)},
      where: 'id = ? OR local_id = ?',
      whereArgs: [record.id, record.localId],
    );

    // Mark parent submission as pending sync
    if (record.submissionId != null) {
      await _db.update(
        'form_submissions',
        {
          'sync_status': 'pending',
          'updated_at': DateTime.now().toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [record.submissionId],
      );
    }
  }

  /// Remove a record
  Future<void> removeRecord(int recordId) async {
    // Get submission ID first
    final rows = await _db.query(
      'form_submission_records',
      columns: ['submission_id'],
      where: 'id = ?',
      whereArgs: [recordId],
    );

    await _db.delete(
      'form_submission_records',
      where: 'id = ?',
      whereArgs: [recordId],
    );

    // Mark parent submission as pending sync
    if (rows.isNotEmpty) {
      final submissionId = rows.first['submission_id'] as int;
      await _db.update(
        'form_submissions',
        {
          'sync_status': 'pending',
          'updated_at': DateTime.now().toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [submissionId],
      );
    }
  }

  /// Reindex records in a group after deletion
  Future<void> reindexRecords(int submissionId, String groupId) async {
    final rows = await _db.query(
      'form_submission_records',
      where: 'submission_id = ? AND group_id = ?',
      whereArgs: [submissionId, groupId],
      orderBy: 'record_index',
    );

    for (var i = 0; i < rows.length; i++) {
      await _db.update(
        'form_submission_records',
        {'record_index': i},
        where: 'id = ?',
        whereArgs: [rows[i]['id']],
      );
    }
  }

  // ============================================================================
  // DELETE
  // ============================================================================

  /// Delete a submission and all its records (cascade)
  Future<void> deleteSubmission(int id) async {
    await _db.delete(
      'form_submissions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Delete a submission by local ID
  Future<void> deleteSubmissionByLocalId(String localId) async {
    await _db.delete(
      'form_submissions',
      where: 'local_id = ?',
      whereArgs: [localId],
    );
  }

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  Future<FormSubmission> _mapRowToSubmission(Map<String, dynamic> row) async {
    final id = row['id'] as int;
    final records = await getRecordsForSubmission(id);

    return FormSubmission(
      id: id,
      localId: row['local_id'] as String,
      serverId: row['server_id'] as int?,
      orgId: row['org_id'] as int,
      templateId: row['template_id'] as int,
      outingId: row['outing_id'] as int?,
      formVersion: row['form_version'] as int? ?? 1,
      headerData:
          jsonDecode(row['header_data_json'] as String) as Map<String, dynamic>,
      records: records,
      createdByUserId: row['created_by_user_id'] as int?,
      syncStatus: row['sync_status'] as String? ?? 'pending',
      createdAt: row['created_at'] != null
          ? DateTime.parse(row['created_at'] as String)
          : null,
      updatedAt: row['updated_at'] != null
          ? DateTime.parse(row['updated_at'] as String)
          : null,
    );
  }

  FormSubmissionRecord _mapRowToRecord(Map<String, dynamic> row) {
    return FormSubmissionRecord(
      id: row['id'] as int?,
      localId: row['local_id'] as String,
      submissionId: row['submission_id'] as int?,
      groupId: row['group_id'] as String,
      recordIndex: row['record_index'] as int,
      data: jsonDecode(row['data_json'] as String) as Map<String, dynamic>,
      createdAt: row['created_at'] != null
          ? DateTime.parse(row['created_at'] as String)
          : null,
    );
  }
}
