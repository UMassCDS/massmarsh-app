import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sqflite/sqflite.dart';

import '../database/app_database.dart';

class OutingSummary {
  final int? id;
  final String? localId;
  final int orgId;
  final int? createdByUserId;
  final String siteName;
  final String monitoringType;
  final bool isDraft;
  final String? syncStatus;
  final String? createdAt;
  final int recordCount;

  const OutingSummary({
    required this.id,
    required this.localId,
    required this.orgId,
    required this.createdByUserId,
    required this.siteName,
    required this.monitoringType,
    required this.isDraft,
    required this.syncStatus,
    required this.createdAt,
    required this.recordCount,
  });
}

class RecoverySummary {
  final Map<String, int> tableCounts;
  final List<OutingSummary> outings;
  final int photoFileCount;
  final int photoReferencedCount;
  final int photoOrphanCount;
  final int photoBytes;

  const RecoverySummary({
    required this.tableCounts,
    required this.outings,
    required this.photoFileCount,
    required this.photoReferencedCount,
    required this.photoOrphanCount,
    required this.photoBytes,
  });

  int get draftCount => outings.where((o) => o.isDraft).length;

  int get totalRecordCount => outings.fold(0, (sum, o) => sum + o.recordCount);
}

class DatabaseExportHelper {
  static Future<Directory> _photosDirectory() async {
    final docsDir = await getApplicationDocumentsDirectory();
    return Directory(p.join(docsDir.path, 'photos'));
  }

  // Best-effort per table: a recovery export must still run against a database
  // that is missing or has corrupted one of them
  static Future<Map<String, int>> _tableCounts(Database db) async {
    const tables = [
      'users',
      'organizations',
      'field_outings',
      'vegetation_records',
      'hydrology_records',
      'elevation_records',
      'sync_queue',
      'pending_uploads',
    ];

    final counts = <String, int>{};
    for (final table in tables) {
      try {
        counts[table] = Sqflite.firstIntValue(
              await db.rawQuery('SELECT COUNT(*) FROM $table'),
            ) ??
            0;
      } catch (_) {
        counts[table] = -1;
      }
    }
    return counts;
  }

  /// Deliberately unscoped by user and org - this is the view that shows rows
  /// the normal screens filter out.
  static Future<RecoverySummary> inspect() async {
    final db = await AppDatabase.instance.database;
    final tableCounts = await _tableCounts(db);

    final rows = await db.rawQuery('''
      SELECT o.id, o.local_id, o.org_id, o.created_by_user_id, o.site_name,
             o.monitoring_type, o.is_draft, o.sync_status, o.created_at,
             (SELECT COUNT(*) FROM vegetation_records v WHERE v.outing_id = o.id) AS veg,
             (SELECT COUNT(*) FROM hydrology_records h WHERE h.outing_id = o.id) AS hyd,
             (SELECT COUNT(*) FROM elevation_records e WHERE e.outing_id = o.id) AS elev
      FROM field_outings o
      ORDER BY o.created_at DESC
    ''');

    final outings = rows.map((row) {
      final recordCount = const ['veg', 'hyd', 'elev']
          .map((key) => (row[key] as int?) ?? 0)
          .fold(0, (a, b) => a + b);
      return OutingSummary(
        id: row['id'] as int?,
        localId: row['local_id'] as String?,
        orgId: (row['org_id'] as int?) ?? 0,
        createdByUserId: row['created_by_user_id'] as int?,
        siteName: (row['site_name'] as String?) ?? '',
        monitoringType: (row['monitoring_type'] as String?) ?? '',
        isDraft: (row['is_draft'] as int?) == 1,
        syncStatus: row['sync_status'] as String?,
        createdAt: row['created_at'] as String?,
        recordCount: recordCount,
      );
    }).toList();

    final referenced = <String>{};
    final photoRows = await db.query(
      'vegetation_records',
      columns: ['photo_local_path'],
      where: 'photo_local_path IS NOT NULL',
    );
    for (final row in photoRows) {
      final path = row['photo_local_path'] as String?;
      if (path != null && path.isNotEmpty) referenced.add(p.basename(path));
    }

    var fileCount = 0;
    var orphanCount = 0;
    var bytes = 0;
    final photosDir = await _photosDirectory();
    if (await photosDir.exists()) {
      await for (final entity in photosDir.list()) {
        if (entity is! File) continue;
        fileCount++;
        bytes += await entity.length();
        if (!referenced.contains(p.basename(entity.path))) orphanCount++;
      }
    }

    return RecoverySummary(
      tableCounts: tableCounts,
      outings: outings,
      photoFileCount: fileCount,
      photoReferencedCount: referenced.length,
      photoOrphanCount: orphanCount,
      photoBytes: bytes,
    );
  }

  static String buildReport(RecoverySummary summary) {
    final buffer = StringBuffer()
      ..writeln('Salt Marsh Data - recovery export')
      ..writeln('Generated: ${DateTime.now().toIso8601String()}')
      ..writeln()
      ..writeln('TABLE COUNTS');
    for (final entry in summary.tableCounts.entries) {
      buffer.writeln('  ${entry.key}: ${entry.value}');
    }

    buffer
      ..writeln()
      ..writeln('PHOTOS')
      ..writeln('  files on disk: ${summary.photoFileCount}')
      ..writeln('  referenced by a record: ${summary.photoReferencedCount}')
      ..writeln('  orphaned (no record): ${summary.photoOrphanCount}')
      ..writeln('  total size: '
          '${(summary.photoBytes / (1024 * 1024)).toStringAsFixed(1)} MB')
      ..writeln()
      ..writeln('SESSIONS (every account, every org)')
      ..writeln('  ${summary.outings.length} total, '
          '${summary.draftCount} draft(s), '
          '${summary.totalRecordCount} child record(s)')
      ..writeln();

    for (final outing in summary.outings) {
      buffer.writeln(
        '  id=${outing.id} local=${outing.localId} org=${outing.orgId} '
        'user=${outing.createdByUserId} '
        '${outing.isDraft ? 'DRAFT' : outing.syncStatus ?? 'unknown'} '
        '${outing.monitoringType} records=${outing.recordCount} '
        'created=${outing.createdAt} site="${outing.siteName}"',
      );
    }

    return buffer.toString();
  }

  /// Bundles the database, a plain-text report and optionally every photo.
  /// Photos are excluded for uploads over a field hotspot, where the database
  /// alone answers whether the data survived.
  static Future<File> buildBundle(
    RecoverySummary summary, {
    bool includePhotos = true,
  }) async {
    final docsDir = await getApplicationDocumentsDirectory();
    final stamp = DateTime.now()
        .toIso8601String()
        .split('.')
        .first
        .replaceAll(RegExp(r'[:T]'), '-');

    final stagingDir = Directory(p.join(docsDir.path, 'recovery_staging'));
    if (await stagingDir.exists()) await stagingDir.delete(recursive: true);
    await stagingDir.create(recursive: true);

    try {
      await _copyDatabaseInto(stagingDir);

      final reportFile = File(p.join(stagingDir.path, 'summary.txt'));
      await reportFile.writeAsString(buildReport(summary));

      final suffix = includePhotos ? '' : '-db-only';
      final zipPath = p.join(docsDir.path, 'saltmarsh-recovery-$stamp$suffix.zip');
      final zipFile = File(zipPath);
      if (await zipFile.exists()) await zipFile.delete();

      final encoder = ZipFileEncoder();
      encoder.create(zipPath);
      try {
        await for (final entity in stagingDir.list()) {
          if (entity is File) {
            await encoder.addFile(entity, p.basename(entity.path));
          }
        }
        // Zipped straight from the live folder so a second full-size copy of
        // every photo is never written to a tablet that may be near full
        final photosDir = await _photosDirectory();
        if (includePhotos && await photosDir.exists()) {
          await encoder.addDirectory(photosDir, includeDirName: true);
        }
      } finally {
        await encoder.close();
      }

      return zipFile;
    } finally {
      if (await stagingDir.exists()) {
        await stagingDir.delete(recursive: true);
      }
    }
  }

  static Future<void> _copyDatabaseInto(Directory destination) async {
    final dbPath = await AppDatabase.instance.getDatabasePath();
    // Closing checkpoints the WAL, so the copy is not missing recent commits
    await AppDatabase.instance.close();
    try {
      final target = p.join(destination.path, p.basename(dbPath));
      await File(dbPath).copy(target);
      for (final suffix in const ['-wal', '-shm']) {
        final sidecar = File('$dbPath$suffix');
        if (await sidecar.exists()) await sidecar.copy('$target$suffix');
      }
    } finally {
      await AppDatabase.instance.database;
    }
  }

  static Future<void> share(File bundle) async {
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(bundle.path)],
        subject: 'Salt Marsh Data recovery export',
        text: 'Database, photos and summary exported '
            '${DateTime.now().toIso8601String()}',
      ),
    );
  }

  /// Replaces the current database. Caller must confirm with the user first.
  static Future<void> importDatabase() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['db'],
      dialogTitle: 'Select Salt Marsh Data database file',
    );

    final path = result?.files.single.path;
    if (path == null) throw Exception('No file selected');

    await AppDatabase.instance.importDatabase(path);
  }
}
