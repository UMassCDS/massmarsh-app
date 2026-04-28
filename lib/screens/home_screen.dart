import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../providers/org_provider.dart';
import '../test_sync_helper.dart';
import 'login_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('MassMarsh'),
            GestureDetector(
              onTap: () {
                ref.read(selectedOrgProvider.notifier).clear();
                Navigator.of(context).pushReplacementNamed('/org-select');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ref.watch(selectedOrgProvider)?.name ?? '',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(width: 2),
                  const Icon(Icons.swap_horiz, size: 14),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Creating test data and syncing...')),
          );
          final orgId = ref.read(selectedOrgIdProvider);
          await TestSyncHelper.createAndSyncTestOuting(orgId: orgId);
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('✅ Test sync complete! Check console.'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        label: const Text('TEST SYNC'),
        icon: const Icon(Icons.cloud_upload),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Welcome Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Welcome to MassMarsh',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Marsh Monitoring Data Collection',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Main Actions
            Text(
              'Start a Field Session',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),

            // Vegetation Monitoring
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('/form', arguments: 'vegetation');
              },
              icon: const Icon(Icons.eco),
              label: const Text('Vegetation Monitoring'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 12),

            // Hydrology Monitoring
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('/form', arguments: 'hydrology');
              },
              icon: const Icon(Icons.water),
              label: const Text('Hydrology Monitoring'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 12),

            // Elevation Monitoring
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('/form', arguments: 'elevation');
              },
              icon: const Icon(Icons.landscape),
              label: const Text('Elevation Monitoring'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 24),

            // Quick Links
            Text(
              'Quick Links',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.drafts, color: Colors.orange),
              title: const Text('View Drafts'),
              subtitle: const Text('Continue saved drafts'),
              onTap: () {
                Navigator.of(context).pushNamed('/drafts');
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Previous Sessions'),
              onTap: () {
                Navigator.of(context).pushNamed('/sessions');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.of(context).pushNamed('/settings'),
            ),
          ],
        ),
      ),
    );
  }
}
