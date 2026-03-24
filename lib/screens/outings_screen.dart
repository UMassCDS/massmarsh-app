import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/field_outing_provider.dart';
import 'outing_details_screen.dart';

class OutingsScreen extends ConsumerWidget {
  const OutingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // For now, using a hardcoded org_id of 1. In a real app, this would come from auth
    const orgId = 1;

    final outingsAsync = ref.watch(fieldOutingsProvider(orgId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Previous Outings'),
      ),
      body: outingsAsync.when(
        data: (outings) {
          if (outings.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.folder_open,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No outings yet',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Create a new field outing to get started',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: outings.length,
            itemBuilder: (context, index) {
              final outing = outings[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: ListTile(
                  title: Text(outing.siteName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        'Crew: ${outing.crewLeader}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        'Type: ${outing.monitoringType}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        'Status: ${outing.isDraft ? "Draft" : "Submitted"}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: outing.isDraft ? Colors.orange : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (outing.createdAt != null)
                        Text(
                          'Created: ${outing.createdAt!.toString().split('.')[0]}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                    ],
                  ),
                  isThreeLine: true,
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'view_details') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OutingDetailsScreen(outing: outing),
                          ),
                        );
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'view_details',
                        child: Text('View Details'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Colors.red[400],
                ),
                const SizedBox(height: 16),
                Text(
                  'Error loading outings',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
