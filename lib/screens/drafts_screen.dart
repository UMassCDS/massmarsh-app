import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/field_outing_provider.dart';
import '../models/field_outing/field_outing.dart';
import 'form_screen.dart';

class DraftsScreen extends ConsumerWidget {
  const DraftsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outingService = ref.read(fieldOutingServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Drafts'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<FieldOuting>>(
        future: outingService.getDrafts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading drafts: ${snapshot.error}'),
                ],
              ),
            );
          }

          final drafts = snapshot.data ?? [];

          if (drafts.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.drafts_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No drafts saved',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Start a field session and save as draft',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: drafts.length,
            itemBuilder: (context, index) {
              final draft = drafts[index];
              return _buildDraftCard(context, ref, draft);
            },
          );
        },
      ),
    );
  }

  Widget _buildDraftCard(BuildContext context, WidgetRef ref, FieldOuting draft) {
    final monitoringTypeIcon = _getMonitoringIcon(draft.monitoringType);
    final formattedDate = _formatDate(draft.createdAt);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _openDraft(context, draft),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(monitoringTypeIcon, color: Colors.blue),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          draft.siteName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _formatMonitoringType(draft.monitoringType),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => _deleteDraft(context, ref, draft),
                    tooltip: 'Delete draft',
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.person_outline, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    draft.crewLeader,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    formattedDate,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getMonitoringIcon(String monitoringType) {
    switch (monitoringType) {
      case 'vegetation':
        return Icons.grass;
      case 'hydrology':
        return Icons.water_drop;
      case 'elevation':
        return Icons.terrain;
      default:
        return Icons.description;
    }
  }

  String _formatMonitoringType(String type) {
    return '${type[0].toUpperCase()}${type.substring(1)} Monitoring';
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Unknown date';
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays == 0) {
      if (diff.inHours == 0) {
        return '${diff.inMinutes} min ago';
      }
      return '${diff.inHours}h ago';
    } else if (diff.inDays == 1) {
      return 'Yesterday';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} days ago';
    } else {
      return '${date.month}/${date.day}/${date.year}';
    }
  }

  void _openDraft(BuildContext context, FieldOuting draft) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FormScreen(
          monitoringType: draft.monitoringType,
          draftId: draft.id,
        ),
      ),
    );
  }

  Future<void> _deleteDraft(BuildContext context, WidgetRef ref, FieldOuting draft) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Draft'),
        content: Text('Are you sure you want to delete the draft for "${draft.siteName}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      try {
        final service = ref.read(fieldOutingServiceProvider);
        await service.deleteDraft(draft.id!);
        
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Draft deleted'),
              backgroundColor: Colors.green,
            ),
          );
          // Refresh the screen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const DraftsScreen()),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error deleting draft: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}
