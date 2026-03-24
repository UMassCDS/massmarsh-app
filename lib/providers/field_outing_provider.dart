import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/app_database.dart';
import '../models/field_outing/field_outing.dart';
import '../services/sync_service.dart';

// Provide access to the database
final appDatabaseProvider = FutureProvider<AppDatabase>((ref) async {
  final db = AppDatabase.instance;
  await db.database; // Ensure it's initialized
  return db;
});

// Refresh trigger for outings - using a simple counter that can be incremented
class _RefreshNotifier {
  int _counter = 0;

  int get value => _counter;

  void increment() {
    _counter++;
  }
}

final _refreshNotifier = _RefreshNotifier();

final fieldOutingRefreshProvider = FutureProvider<int>((ref) async {
  return _refreshNotifier.value;
});

// Get all field outings for an organization
final fieldOutingsProvider = FutureProvider.family<List<FieldOuting>, int>((ref, orgId) async {
  // Watch refresh provider to trigger rebuilds
  ref.watch(fieldOutingRefreshProvider);

  final db = await ref.watch(appDatabaseProvider.future);
  return db.fieldOutingDao.getByOrgId(orgId);
});

// Get draft outings
final draftOutingsProvider = FutureProvider.family<List<FieldOuting>, int>((ref, orgId) async {
  ref.watch(fieldOutingRefreshProvider);

  final db = await ref.watch(appDatabaseProvider.future);
  return db.fieldOutingDao.getDraftsByOrgId(orgId);
});

// Get synced outings
final syncedOutingsProvider = FutureProvider.family<List<FieldOuting>, int>((ref, orgId) async {
  ref.watch(fieldOutingRefreshProvider);

  final db = await ref.watch(appDatabaseProvider.future);
  return db.fieldOutingDao.getSyncedByOrgId(orgId);
});

class FieldOutingService {
  final Ref ref;

  FieldOutingService(this.ref);

  Future<String> saveFieldOuting(FieldOuting outing) async {
    final db = await ref.read(appDatabaseProvider.future);
    final localId = await db.fieldOutingDao.createFieldOuting(outing);

    // Trigger a refresh
    _refreshNotifier.increment();

    // Trigger background sync (don't await - let it happen in background)
    // Get the database ID for the just-created outing
    final database = await db.database;
    final result = await database.query(
      'field_outings',
      columns: ['id'],
      where: 'local_id = ?',
      whereArgs: [localId],
      limit: 1,
    );

    if (result.isNotEmpty) {
      final dbId = result.first['id'] as int;
      SyncService.instance.uploadFieldOuting(dbId).then((serverId) {
        if (serverId != null) {
          // Refresh again to show sync status
          _refreshNotifier.increment();
        }
      }).catchError((error) {
        // Sync failed - record will stay as pending and retry later
      });
    }

    return localId;
  }

  Future<String> saveFieldOutingWithChildren(
    FieldOuting outing,
    List<Map<String, dynamic>> childRecords,
    String childTable,
  ) async {
    final db = await ref.read(appDatabaseProvider.future);
    final localId = await db.fieldOutingDao.createFieldOuting(outing);
    _refreshNotifier.increment();

    final database = await db.database;
    final result = await database.query(
      'field_outings',
      columns: ['id'],
      where: 'local_id = ?',
      whereArgs: [localId],
      limit: 1,
    );

    if (result.isNotEmpty) {
      final dbId = result.first['id'] as int;

      for (final record in childRecords) {
        await database.insert(childTable, {
          ...record,
          'outing_id': dbId,
        });
      }

      SyncService.instance.uploadFieldOuting(dbId).then((serverId) {
        if (serverId != null) {
          _refreshNotifier.increment();
        }
      }).catchError((_) {});
    }

    return localId;
  }

  Future<void> updateFieldOuting(FieldOuting outing) async {
    final db = await ref.read(appDatabaseProvider.future);
    await db.fieldOutingDao.updateFieldOuting(outing);
    // Trigger a refresh
    _refreshNotifier.increment();
  }

  Future<void> deleteFieldOuting(int id) async {
    final db = await ref.read(appDatabaseProvider.future);
    await db.fieldOutingDao.deleteFieldOuting(id);
    // Trigger a refresh
    _refreshNotifier.increment();
  }
}

final fieldOutingServiceProvider = Provider((ref) {
  return FieldOutingService(ref);
});
