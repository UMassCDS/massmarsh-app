import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/organization/organization.dart';
import '../providers/org_provider.dart';
import '../providers/auth_provider.dart';

class OrgSelectionScreen extends ConsumerWidget {
  const OrgSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orgsAsync = ref.watch(myOrgsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Organization'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sign out',
            onPressed: () async {
              await ref.read(authProvider.notifier).logout();
              ref.read(selectedOrgProvider.notifier).clear();
            },
          ),
        ],
      ),
      body: orgsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 12),
              Text(
                'Failed to load organizations',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                err.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => ref.invalidate(myOrgsProvider),
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (orgs) {
          if (orgs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.group_off, size: 48),
                  const SizedBox(height: 12),
                  Text(
                    'You are not a member of any organization.',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () => ref.invalidate(myOrgsProvider),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Refresh'),
                  ),
                ],
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'Choose the organization you are collecting data for:',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              ...orgs.map((org) => _OrgTile(org: org)),
            ],
          );
        },
      ),
    );
  }
}

class _OrgTile extends ConsumerWidget {
  final Organization org;

  const _OrgTile({required this.org});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Text(
            org.name.isNotEmpty ? org.name[0].toUpperCase() : '?',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(org.name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (org.description != null && org.description!.isNotEmpty)
              Text(org.description!),
            Text(
              'Role: ${org.userRole[0].toUpperCase()}${org.userRole.substring(1)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          ref.read(selectedOrgProvider.notifier).select(org);
          Navigator.of(context).pushReplacementNamed('/home');
        },
      ),
    );
  }
}
