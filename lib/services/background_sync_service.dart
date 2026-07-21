import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:workmanager/workmanager.dart';
import 'sync_service.dart';

const _syncTaskName = 'com.saltmarshdata.app.sync';

// Must match AuthNotifier's _tokenKey in auth_provider.dart
const _authTokenKey = 'auth_token';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: _authTokenKey);
    if (token == null) return true;

    SyncService.instance.setAuthToken(token);
    await SyncService.instance.uploadAllPendingOutings();
    return true;
  });
}

Future<void> initializeBackgroundSync() async {
  await Workmanager().initialize(callbackDispatcher);
  await Workmanager().registerPeriodicTask(
    _syncTaskName,
    _syncTaskName,
    frequency: const Duration(minutes: 15),
    constraints: Constraints(networkType: NetworkType.connected),
    existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
  );
}
