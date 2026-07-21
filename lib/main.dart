import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'services/background_sync_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeBackgroundSync();

  // Initialize app
  runApp(
    const ProviderScope(
      child: MassMarshApp(),
    ),
  );
}
