import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';
import '../database/app_database.dart';

/// Service for synchronizing local database with cloud backend.
///
/// Implements an offline-first architecture where:
/// 1. All data is stored locally in SQLite
/// 2. Changes are queued when offline
/// 3. Automatic sync when connectivity is restored
/// 4. Conflict resolution for bidirectional sync
class SyncService {
  final Dio _dio;
  final AppDatabase _db;
  final Logger _logger;
  final Connectivity _connectivity;

  /// Base URL for the API (should be configured per environment)
  late final String _baseUrl;

  /// Auth token for API requests
  String? _authToken;

  static SyncService? _instance;

  /// Private constructor for singleton pattern
  SyncService._({
    required Dio dio,
    required AppDatabase db,
    required Logger logger,
    required Connectivity connectivity,
    required String baseUrl,
  })  : _dio = dio,
        _db = db,
        _logger = logger,
        _connectivity = connectivity,
        _baseUrl = baseUrl {
    _configureClient();
  }

  /// Get or create singleton instance
  static SyncService get instance {
    _instance ??= SyncService._(
      dio: Dio(),
      db: AppDatabase.instance,
      logger: Logger(),
      connectivity: Connectivity(),
      baseUrl: const String.fromEnvironment(
        'API_BASE_URL',
        // defaultValue: 'http://10.0.2.2:8000',
        defaultValue: 'https://massmarsh.azurewebsites.net',
      ),
    );
    return _instance!;
  }

  /// Configure the HTTP client
  void _configureClient() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);

    // Add interceptors for auth and logging
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_authToken != null) {
            options.headers['Authorization'] = 'Bearer $_authToken';
          }
          options.headers['Content-Type'] = 'application/json';
          _logger.d('Request: ${options.method} ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.d('Response: ${response.statusCode} ${response.requestOptions.path}');
          return handler.next(response);
        },
        onError: (error, handler) {
          _logger.e('Error: ${error.message}');
          return handler.next(error);
        },
      ),
    );
  }

  /// Upload a field outing with all child records to the server
  ///
  /// This method bundles a field outing and all its child records
  /// (vegetation, hydrology, elevation) into a single API call.
  ///
  /// Returns server-assigned ID on success, null on failure.
  Future<int?> uploadFieldOuting(int localOutingId) async {
    try {
      if (!await hasConnectivity()) {
        _logger.w('No connectivity available for field outing upload');
        return null;
      }

      final db = await _db.database;

      // Fetch field outing
      final outingRows = await db.query(
        'field_outings',
        where: 'id = ?',
        whereArgs: [localOutingId],
      );

      if (outingRows.isEmpty) {
        _logger.e('Field outing not found: $localOutingId');
        return null;
      }

      final outing = outingRows.first;

      // Build the request payload
      final payload = <String, dynamic>{
        'org_id': outing['org_id'],
        'local_id': outing['local_id'],
        'crew_leader': outing['crew_leader'],
        'site_name': outing['site_name'],
        'other_members': outing['other_members'],
        'monitoring_type': outing['monitoring_type'],
        'start_time': outing['start_time'],
        'end_time': outing['end_time'],
        'submission_time': outing['submission_time'],
        'latitude': outing['latitude'],
        'longitude': outing['longitude'],
      };

      // Fetch and add vegetation records
      final vegRecords = await db.query(
        'vegetation_records',
        where: 'outing_id = ?',
        whereArgs: [localOutingId],
      );

      print('vegRecords: $vegRecords');

      // Upload photos first, collect blob URLs keyed by local_id
      final photoUrls = <String, String>{};
      for (final veg in vegRecords) {
        final localPath = veg['photo_local_path'] as String?;
        final localId = veg['local_id'] as String? ?? '';
        if (localPath != null && localPath.isNotEmpty) {
          final url = await _uploadPhoto(localPath);
          if (url != null) photoUrls[localId] = url;
        }
      }

      payload['vegetation_records'] = vegRecords.map((veg) {
        final localId = veg['local_id'] as String? ?? '';
        return {
          'local_id': localId,
          'transect_id': veg['transect_id'],
          'plot_number': veg['plot_number'],
          'plot_id': veg['plot_id'],
          'habitat_type': veg['habitat_type'],
          'distance_along_transect_m': veg['distance_along_transect_m'],
          'latitude': veg['latitude'],
          'longitude': veg['longitude'],
          'canopy_height_m': veg['canopy_height_m'],
          'thatch_height_m': veg['thatch_height_m'],
          'species_observations': jsonDecode(veg['species_observations'] as String),
          'photo_url': photoUrls[localId],
          'notes': veg['notes'],
        };
      }).toList();

      // Fetch and add hydrology records
      final hydroRecords = await db.query(
        'hydrology_records',
        where: 'outing_id = ?',
        whereArgs: [localOutingId],
      );

      payload['hydrology_records'] = hydroRecords.map((hydro) {
        return {
          'local_id': hydro['local_id'],
          'area_treatment': hydro['area_treatment'],
          'wlr_type': hydro['wlr_type'],
          'serial_number': hydro['serial_number'],
          'elevation_waypoint_type': hydro['elevation_waypoint_type'],
          'waypoint_number': hydro['waypoint_number'],
          'rtk_elevation_navd88_m': hydro['rtk_elevation_navd88_m'],
          'time_water_elevation_taken': hydro['time_water_elevation_taken'],
          'water_above_below_nut_m': hydro['water_above_below_nut_m'],
          'well_rim_to_water_m': hydro['well_rim_to_water_m'],
          'well_rim_to_marsh_m': hydro['well_rim_to_marsh_m'],
          'well_rim_to_sensor_m': hydro['well_rim_to_sensor_m'],
          'well_length_m': hydro['well_length_m'],
          'notes': hydro['notes'],
        };
      }).toList();

      // Fetch and add elevation records
      final elevRecords = await db.query(
        'elevation_records',
        where: 'outing_id = ?',
        whereArgs: [localOutingId],
      );

      payload['elevation_records'] = elevRecords.map((elev) {
        return {
          'local_id': elev['local_id'],
          'transect_id': elev['transect_id'],
          'point_number': elev['point_number'],
          'latitude': elev['latitude'],
          'longitude': elev['longitude'],
          'elevation_navd88_m': elev['elevation_navd88_m'],
          'feature_type': elev['feature_type'],
          'notes': elev['notes'],
        };
      }).toList();

      // Upload to server
      _logger.i('Uploading field outing: ${outing['local_id']}');
      _logger.d('Base URL: $_baseUrl');
      _logger.d('Endpoint: /api/mobile/field-outings');
      _logger.d('Full URL: $_baseUrl/api/mobile/field-outings');
      _logger.d('Payload: ${payload.toString().substring(0, 200)}...');

      final response = await _dio.post(
        '/api/mobile/field-outings',
        data: payload,
      );

      _logger.d('Response status: ${response.statusCode}');

      if (response.statusCode == 201 && response.data['success'] == true) {
        final serverId = response.data['server_id'] as int;
        final childRecordIds = response.data['child_records'] as Map<String, dynamic>;

        // Update local record with server ID and sync status
        await db.update(
          'field_outings',
          {
            'sync_status': 'synced',
            'server_id': serverId,
          },
          where: 'id = ?',
          whereArgs: [localOutingId],
        );

        // Update child records with server IDs
        if (childRecordIds['vegetation'] != null) {
          final vegMap = childRecordIds['vegetation'] as Map<String, dynamic>;
          for (final entry in vegMap.entries) {
            await db.update(
              'vegetation_records',
              {
                'sync_status': 'synced',
                'server_id': entry.value,
              },
              where: 'local_id = ?',
              whereArgs: [entry.key],
            );
          }
        }

        if (childRecordIds['hydrology'] != null) {
          final hydroMap = childRecordIds['hydrology'] as Map<String, dynamic>;
          for (final entry in hydroMap.entries) {
            await db.update(
              'hydrology_records',
              {
                'sync_status': 'synced',
                'server_id': entry.value,
              },
              where: 'local_id = ?',
              whereArgs: [entry.key],
            );
          }
        }

        if (childRecordIds['elevation'] != null) {
          final elevMap = childRecordIds['elevation'] as Map<String, dynamic>;
          for (final entry in elevMap.entries) {
            await db.update(
              'elevation_records',
              {
                'sync_status': 'synced',
                'server_id': entry.value,
              },
              where: 'local_id = ?',
              whereArgs: [entry.key],
            );
          }
        }

        _logger.i('Field outing uploaded successfully. Server ID: $serverId');
        return serverId;
      } else {
        _logger.e('Upload failed: ${response.statusCode} - ${response.data}');
        return null;
      }
    } on DioException catch (e) {
      _logger.e('Network error uploading field outing: ${e.message}');
      return null;
    } catch (e) {
      _logger.e('Error uploading field outing: $e');
      return null;
    }
  }

  /// Upload all pending field outings
  ///
  /// Processes all field outings with sync_status='pending'
  /// and uploads them to the server.
  ///
  /// Returns number of successfully uploaded outings.
  Future<int> uploadAllPendingOutings() async {
    try {
      if (!await hasConnectivity()) {
        _logger.w('No connectivity for uploading pending outings');
        return 0;
      }

      final db = await _db.database;
      final pendingOutings = await db.query(
        'field_outings',
        where: 'sync_status = ? AND is_draft = ?',
        whereArgs: ['pending', 0],
        orderBy: 'created_at ASC',
      );

      if (pendingOutings.isEmpty) {
        _logger.i('No pending outings to upload');
        return 0;
      }

      int successCount = 0;

      for (final outing in pendingOutings) {
        final serverId = await uploadFieldOuting(outing['id'] as int);
        if (serverId != null) {
          successCount++;
        }
      }

      _logger.i('Uploaded $successCount/${pendingOutings.length} pending outings');
      return successCount;
    } catch (e) {
      _logger.e('Error uploading pending outings: $e');
      return 0;
    }
  }

  /// Upload a single photo file to the backend and return the blob URL.
  /// Returns null if the upload fails (outing sync will continue without the photo).
  Future<String?> _uploadPhoto(String localPath) async {
    try {
      final file = await _multipartFileFromPath(localPath);
      if (file == null) return null;

      final formData = FormData.fromMap({'file': file});

      // Temporarily remove Content-Type so Dio sets multipart boundary
      final originalContentType = _dio.options.headers['Content-Type'];
      _dio.options.headers.remove('Content-Type');

      final response = await _dio.post('/api/mobile/photos', data: formData);

      _dio.options.headers['Content-Type'] = originalContentType;

      if (response.statusCode == 200 && response.data['success'] == true) {
        return response.data['url'] as String?;
      }
    } catch (e) {
      _logger.w('Photo upload failed for $localPath: $e');
    }
    return null;
  }

  Future<MultipartFile?> _multipartFileFromPath(String path) async {
    try {
      return await MultipartFile.fromFile(path);
    } catch (e) {
      _logger.w('Could not read photo file $path: $e');
      return null;
    }
  }

  /// Set authentication token for API requests
  void setAuthToken(String token) {
    _authToken = token;
  }

  /// Clear authentication token
  void clearAuthToken() {
    _authToken = null;
  }

  /// Check if device has internet connectivity
  Future<bool> hasConnectivity() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet);
  }

  /// Perform full sync: upload pending field outings
  ///
  /// This is the main sync method that should be called periodically
  /// or when user manually triggers sync.
  ///
  /// Returns a map with sync results:
  /// - 'success': whether sync completed successfully
  /// - 'uploaded': number of items uploaded
  Future<Map<String, dynamic>> performFullSync(int orgId) async {
    _logger.i('Starting full sync for org: $orgId');

    final result = {
      'success': false,
      'uploaded': 0,
      'error': null,
    };

    try {
      if (!await hasConnectivity()) {
        result['error'] = 'No internet connectivity';
        return result;
      }

      // Upload pending field outings with all child records
      final uploadCount = await uploadAllPendingOutings();
      result['uploaded'] = uploadCount;

      // Update sync state
      await _updateSyncState(orgId);

      result['success'] = true;
      _logger.i('Full sync completed successfully');
    } catch (e) {
      _logger.e('Error during full sync: $e');
      result['error'] = e.toString();
    }

    return result;
  }

  /// Update sync state metadata
  Future<void> _updateSyncState(int orgId) async {
    final db = await _db.database;
    await db.rawUpdate('''
      UPDATE sync_state
      SET last_full_sync = ?,
          updated_at = ?
      WHERE id = 1
    ''', [
      DateTime.now().toIso8601String(),
      DateTime.now().toIso8601String(),
    ]);
  }

  /// Get count of pending field outings
  Future<int> getPendingItemsCount() async {
    final db = await _db.database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM field_outings WHERE sync_status = ? AND is_draft = ?',
      ['pending', 0],
    );
    return result.isNotEmpty ? (result.first['count'] as int? ?? 0) : 0;
  }

  /// Get last sync timestamp
  Future<DateTime?> getLastSyncTime() async {
    final db = await _db.database;
    final result = await db.query(
      'sync_state',
      columns: ['last_full_sync'],
      where: 'id = ?',
      whereArgs: [1],
      limit: 1,
    );

    if (result.isEmpty || result.first['last_full_sync'] == null) {
      return null;
    }

    return DateTime.parse(result.first['last_full_sync'] as String);
  }
}
