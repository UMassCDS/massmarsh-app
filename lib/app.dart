import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/auth_provider.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/form_screen.dart';
import 'screens/outings_screen.dart';

/// Main app widget
class MassMarshApp extends ConsumerWidget {
  const MassMarshApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    return MaterialApp(
      title: 'MassMarsh',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: _resolveHome(auth),
      onGenerateRoute: (settings) {
        if (settings.name == '/form') {
          final monitoringType = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => FormScreen(monitoringType: monitoringType),
          );
        }
        if (settings.name == '/outings') {
          return MaterialPageRoute(
            builder: (context) => const OutingsScreen(),
          );
        }
        // Add more routes as needed
        return null;
      },
    );
  }

  Widget _resolveHome(AuthState auth) {
    if (!auth.isInitialized) {
      // Waiting for session restore — show a splash/loading screen
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return auth.isAuthenticated ? const HomeScreen() : const LoginScreen();
  }
}
