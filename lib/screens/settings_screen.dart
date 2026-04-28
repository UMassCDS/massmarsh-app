import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Text(
              'Appearance',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          RadioGroup<ThemeMode>(
            groupValue: themeMode,
            onChanged: (v) {
              if (v != null) ref.read(themeModeProvider.notifier).set(v);
            },
            child: Column(
              children: [
                RadioListTile<ThemeMode>(
                  title: const Text('System default'),
                  subtitle: const Text('Follows your device theme'),
                  secondary: const Icon(Icons.brightness_auto),
                  value: ThemeMode.system,
                ),
                RadioListTile<ThemeMode>(
                  title: const Text('Light'),
                  secondary: const Icon(Icons.light_mode),
                  value: ThemeMode.light,
                ),
                RadioListTile<ThemeMode>(
                  title: const Text('Dark'),
                  secondary: const Icon(Icons.dark_mode),
                  value: ThemeMode.dark,
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
