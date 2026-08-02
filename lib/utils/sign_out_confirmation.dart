import 'package:flutter/material.dart';
import '../services/sync_service.dart';

// Warns harder when offline: signing back in needs the server, so a crew
// that signs out with no signal cannot record again until it returns
Future<bool> confirmSignOut(BuildContext context) async {
  final online = await SyncService.instance.hasConnectivity();
  if (!context.mounted) return false;

  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(online ? 'Sign out?' : 'Sign out with no connection?'),
      content: Text(online
          ? 'You\'ll need to sign in again to access the app.'
          : 'You are offline. Signing in again needs an internet connection, '
              'so you will not be able to record any more data until you are '
              'back online. Anything already saved stays on this device.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(ctx).pop(true),
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(ctx).colorScheme.error,
          ),
          child: const Text('Sign out'),
        ),
      ],
    ),
  );
  return confirmed == true;
}
