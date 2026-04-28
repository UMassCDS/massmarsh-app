import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/auth_provider.dart';
import 'providers/org_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/form_screen.dart';
import 'screens/outings_screen.dart';
import 'screens/drafts_screen.dart';
import 'screens/org_selection_screen.dart';
import 'screens/settings_screen.dart';

/// Main app widget
class MassMarshApp extends ConsumerWidget {
  const MassMarshApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    final selectedOrg = ref.watch(selectedOrgProvider);
    final themeMode = ref.watch(themeModeProvider);

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
      themeMode: themeMode,
      home: _resolveHome(auth, selectedOrg),
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          return MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          );
        }
        if (settings.name == '/org-select') {
          return MaterialPageRoute(
            builder: (context) => const OrgSelectionScreen(),
          );
        }
        if (settings.name == '/form') {
          final monitoringType = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => FormScreen(monitoringType: monitoringType),
          );
        }
        if (settings.name == '/sessions') {
          return MaterialPageRoute(
            builder: (context) => const OutingsScreen(),
          );
        }
        if (settings.name == '/drafts') {
          return MaterialPageRoute(
            builder: (context) => const DraftsScreen(),
          );
        }
        if (settings.name == '/settings') {
          return MaterialPageRoute(
            builder: (context) => const SettingsScreen(),
          );
        }
        return null;
      },
    );
  }

  Widget _resolveHome(AuthState auth, dynamic selectedOrg) {
    if (!auth.isInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (!auth.isAuthenticated) return const LoginScreen();
    if (selectedOrg == null) return const OrgSelectionScreen();
    return const HomeScreen();
  }
}
