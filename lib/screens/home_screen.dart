import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../providers/org_provider.dart';
import '../services/protocol_service.dart';
import '../services/species_service.dart';
import 'login_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final org = ref.read(selectedOrgProvider);
      if (org != null) {
        ProtocolService.instance.fetchAndCache(org.id);
        SpeciesService.instance.fetchAndCache();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final orgName = ref.watch(selectedOrgProvider)?.name ?? '';
    // Cache the blended banner end-colour so it isn't recomputed on every
    // scroll frame (Color.lerp allocates a new object each call).
    final bannerEnd =
        Color.lerp(colorScheme.primaryContainer, colorScheme.secondaryContainer, 0.5)!;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('Salt Marsh Data'),
            GestureDetector(
              onTap: () {
                ref.read(selectedOrgProvider.notifier).clear();
                Navigator.of(context).pushReplacementNamed('/org-select');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    orgName,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: colorScheme.onSurface.withValues(alpha: 0.65),
                    ),
                  ),
                  const SizedBox(width: 2),
                  Icon(
                    Icons.swap_horiz,
                    size: 14,
                    color: colorScheme.onSurface.withValues(alpha: 0.65),
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sign out',
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Sign out'),
                  content: const Text('Are you sure you want to sign out?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(false),
                      child: const Text('Cancel'),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.of(ctx).pop(true),
                      child: const Text('Sign out'),
                    ),
                  ],
                ),
              );
              if (confirmed == true && context.mounted) {
                ref.read(selectedOrgProvider.notifier).clear();
                await ref.read(authProvider.notifier).logout();
                if (context.mounted) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                }
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Hero banner ──────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 28),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.primaryContainer,
                    bannerEnd,
                  ],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Field Data Collection',
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Select a monitoring type below to start a new field session.',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onPrimaryContainer.withValues(alpha: 0.75),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.water,
                      size: 32,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Start a session ──────────────────────────────────
                  _SectionHeader(label: 'Start a Field Session'),
                  const SizedBox(height: 12),

                  _MonitoringCard(
                    label: 'Vegetation Monitoring',
                    description: 'Record plant species, coverage & plot data',
                    icon: Icons.eco,
                    accentColor: const Color(0xFF2E7D32),
                    onTap: () => Navigator.of(context)
                        .pushNamed('/form', arguments: 'vegetation'),
                  ),
                  const SizedBox(height: 10),

                  _MonitoringCard(
                    label: 'Hydrology Monitoring',
                    description: 'Log water levels, well rim & RTK elevation',
                    icon: Icons.water_drop,
                    accentColor: const Color(0xFF0277BD),
                    onTap: () => Navigator.of(context)
                        .pushNamed('/form', arguments: 'hydrology'),
                  ),
                  const SizedBox(height: 10),

                  _MonitoringCard(
                    label: 'Elevation Monitoring',
                    description: 'Capture transect points & NAVD88 elevations',
                    icon: Icons.landscape,
                    accentColor: const Color(0xFF6A3F00),
                    onTap: () => Navigator.of(context)
                        .pushNamed('/form', arguments: 'elevation'),
                  ),

                  // ── Quick links ──────────────────────────────────────
                  const SizedBox(height: 28),
                  _SectionHeader(label: 'Quick Links'),
                  const SizedBox(height: 8),

                  _QuickLinkTile(
                    icon: Icons.drafts_outlined,
                    label: 'View Drafts',
                    subtitle: 'Continue saved drafts',
                    iconColor: Colors.orange.shade700,
                    onTap: () => Navigator.of(context).pushNamed('/drafts'),
                  ),
                  _QuickLinkTile(
                    icon: Icons.history,
                    label: 'Previous Sessions',
                    subtitle: 'Browse submitted & drafted sessions',
                    iconColor: colorScheme.primary,
                    onTap: () => Navigator.of(context).pushNamed('/sessions'),
                  ),
                  _QuickLinkTile(
                    icon: Icons.settings_outlined,
                    label: 'Settings',
                    subtitle: 'Theme and preferences',
                    iconColor: colorScheme.secondary,
                    onTap: () => Navigator.of(context).pushNamed('/settings'),
                  ),

                  SizedBox(height: 88 + MediaQuery.paddingOf(context).bottom),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Reusable sub-widgets ────────────────────────────────────────────────────

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
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
          ),
    );
  }
}

class _MonitoringCard extends StatelessWidget {
  final String label;
  final String description;
  final IconData icon;
  final Color accentColor;
  final VoidCallback onTap;

  const _MonitoringCard({
    required this.label,
    required this.description,
    required this.icon,
    required this.accentColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: accentColor, size: 26),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        )),
                    const SizedBox(height: 2),
                    Text(description,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                        )),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: colorScheme.onSurface.withValues(alpha: 0.35)),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickLinkTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final Color iconColor;
  final VoidCallback onTap;

  const _QuickLinkTile({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(label,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle,
          style: textTheme.bodySmall
              ?.copyWith(color: colorScheme.onSurface.withValues(alpha: 0.55))),
      trailing: Icon(Icons.chevron_right,
          color: colorScheme.onSurface.withValues(alpha: 0.35)),
    );
  }
}
