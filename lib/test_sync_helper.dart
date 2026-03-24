import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'database/app_database.dart';
import 'services/sync_service.dart';

/// Helper to quickly create test data and test sync
class TestSyncHelper {
  static const _uuid = Uuid();

  /// Create a test field outing with vegetation records and sync it
  static Future<void> createAndSyncTestOuting() async {
    final db = await AppDatabase.instance.database;

    // Generate IDs
    final outingLocalId = 'test_${DateTime.now().millisecondsSinceEpoch}';
    final vegLocalId1 = 'veg_${_uuid.v4()}';
    final vegLocalId2 = 'veg_${_uuid.v4()}';

    print('Creating test field outing: $outingLocalId');

    // 1. Create field outing
    final outingId = await db.insert('field_outings', {
      'local_id': outingLocalId,
      'org_id': 1,
      'crew_leader': 'Test Crew Leader',
      'site_name': 'Test Site - Crane Estate',
      'other_members': 'Test Member 1, Test Member 2',
      'monitoring_type': 'vegetation',
      'start_time': DateTime.now().toIso8601String(),
      'end_time': DateTime.now().add(Duration(hours: 2)).toIso8601String(),
      'submission_time': DateTime.now().toIso8601String(),
      'latitude': 42.683305,
      'longitude': -70.766705,
      'sync_status': 'pending',
      'is_draft': 0,
      'approval_status': 'pending',
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    });

    print('Created field outing with DB ID: $outingId');

    // 2. Create vegetation record 1 (with the specified lat/long)
    final vegId1 = await db.insert('vegetation_records', {
      'local_id': vegLocalId1,
      'outing_id': outingId,
      'transect_id': 'T1',
      'plot_number': 1,
      'habitat_type': 'Low Marsh',
      'distance_along_transect_m': 0.0,
      'latitude': 42.683305,  // User's specified coordinates
      'longitude': -70.766705,
      'elevation_m': 0.45,
      'canopy_height_m': 0.73,
      'thatch_height_m': 0.12,
      'species_observations': jsonEncode([
        {'species_code': 'SPALT', 'percentage_cover': 75},
        {'species_code': 'SPPAT', 'percentage_cover': 15},
        {'species_code': 'DISP', 'percentage_cover': 10},
      ]),
      'notes': 'Test plot 1 - Dense Spartina coverage',
      'sync_status': 'pending',
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    });

    print('Created vegetation record 1 with DB ID: $vegId1');

    // 3. Create vegetation record 2
    final vegId2 = await db.insert('vegetation_records', {
      'local_id': vegLocalId2,
      'outing_id': outingId,
      'transect_id': 'T1',
      'plot_number': 2,
      'habitat_type': 'High Marsh',
      'distance_along_transect_m': 10.0,
      'latitude': 42.683400,
      'longitude': -70.766800,
      'elevation_m': 0.65,
      'canopy_height_m': 0.45,
      'thatch_height_m': 0.08,
      'species_observations': jsonEncode([
        {'species_code': 'SPPAT', 'percentage_cover': 60},
        {'species_code': 'DISP', 'percentage_cover': 20},
        {'species_code': 'LINAS', 'percentage_cover': 10},
        {'species_code': 'BARE', 'percentage_cover': 10},
      ]),
      'notes': 'Test plot 2 - Mixed species',
      'sync_status': 'pending',
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    });

    print('Created vegetation record 2 with DB ID: $vegId2');

    // 4. Trigger sync
    print('Triggering sync for outing ID: $outingId');
    final serverId = await SyncService.instance.uploadFieldOuting(outingId);

    if (serverId != null) {
      print('✅ SUCCESS! Synced to server with ID: $serverId');
      print('Check your web UI for field outing #$serverId');
    } else {
      print('❌ FAILED to sync. Check logs above for errors.');
    }
  }

  /// Check what's in the local database
  static Future<void> checkLocalData() async {
    final db = await AppDatabase.instance.database;

    final outings = await db.query('field_outings',
      orderBy: 'created_at DESC',
      limit: 5
    );
    print('\n=== Recent Field Outings ===');
    for (final outing in outings) {
      print('ID: ${outing['id']}, Local ID: ${outing['local_id']}, '
            'Sync: ${outing['sync_status']}, Server ID: ${outing['server_id']}');
    }

    final vegRecords = await db.query('vegetation_records',
      orderBy: 'created_at DESC',
      limit: 10
    );
    print('\n=== Recent Vegetation Records ===');
    for (final veg in vegRecords) {
      print('ID: ${veg['id']}, Outing ID: ${veg['outing_id']}, '
            'Transect: ${veg['transect_id']}, Plot: ${veg['plot_number']}');
    }
  }
}