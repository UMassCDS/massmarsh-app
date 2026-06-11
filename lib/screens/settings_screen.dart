import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          // ── Appearance section ─────────────────────────────────────────
          _SectionHeader(label: 'Appearance'),
          const SizedBox(height: 8),
          Card(
            child: RadioGroup<ThemeMode>(
              groupValue: themeMode,
              onChanged: (v) {
                if (v != null) ref.read(themeModeProvider.notifier).set(v);
              },
              child: Column(
                children: [
                  _ThemeOptionTile(
                    value: ThemeMode.system,
                    icon: Icons.brightness_auto_outlined,
                    label: 'System default',
                    subtitle: 'Follows your device theme',
                    accentColor: colorScheme.primary,
                    isFirst: true,
                  ),
                  Divider(
                    height: 1,
                    indent: 16,
                    endIndent: 16,
                    color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                  ),
                  _ThemeOptionTile(
                    value: ThemeMode.light,
                    icon: Icons.light_mode_outlined,
                    label: 'Light',
                    subtitle: 'Always use light theme',
                    accentColor: const Color(0xFFFFB300),
                  ),
                  Divider(
                    height: 1,
                    indent: 16,
                    endIndent: 16,
                    color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                  ),
                  _ThemeOptionTile(
                    value: ThemeMode.dark,
                    icon: Icons.dark_mode_outlined,
                    label: 'Dark',
                    subtitle: 'Always use dark theme',
                    accentColor: const Color(0xFF5C6BC0),
                    isLast: true,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 28),

          // ── About section ──────────────────────────────────────────────
          _SectionHeader(label: 'About'),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Icon(Icons.water,
                        size: 20, color: colorScheme.onPrimaryContainer),
                  ),
                  title: Text('Salt Marsh Data',
                      style: textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  subtitle: Text('Salt Marsh Data Collection',
                      style: textTheme.bodySmall?.copyWith(
                          color:
                              colorScheme.onSurface.withValues(alpha: 0.55))),
                  trailing: Text('v1.0.0',
                      style: textTheme.labelSmall?.copyWith(
                          color:
                              colorScheme.onSurface.withValues(alpha: 0.45))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Sub-widgets ─────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String label;
  const _SectionHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            letterSpacing: 1.1,
            fontWeight: FontWeight.w700,
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.5),
          ),
    );
  }
}

class _ThemeOptionTile extends StatelessWidget {
  final ThemeMode value;
  final IconData icon;
  final String label;
  final String subtitle;
  final Color accentColor;
  final bool isFirst;
  final bool isLast;

  const _ThemeOptionTile({
    required this.value,
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.accentColor,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return RadioListTile<ThemeMode>(
      value: value,
      title: Text(label,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.55),
              )),
      secondary: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: accentColor.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Icon(icon, color: accentColor, size: 20),
      ),
    );
  }
}
