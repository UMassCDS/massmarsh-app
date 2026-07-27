import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import '../providers/auth_provider.dart';
import '../providers/org_provider.dart';
import '../providers/theme_provider.dart';
import '../services/sync_service.dart';
import '../utils/database_export_helper.dart';
import '../utils/snackbar_utils.dart';
import 'login_screen.dart';

final _packageInfoProvider =
    FutureProvider<PackageInfo>((ref) => PackageInfo.fromPlatform());

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _uploading = false;
  bool _photoUploading = false;
  double _uploadProgress = 0;
  int _batchesDone = 0;
  int _batchesTotal = 0;

  bool get _busy => _uploading || _photoUploading;

  static const _batchBytes = 40 * 1024 * 1024;

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    final user = ref.watch(authProvider).user;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          // ── Account section ────────────────────────────────────────────
          _SectionHeader(label: 'Account'),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: colorScheme.primaryContainer,
                        child: Text(
                          _initials(user?.fullName ?? ''),
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    user?.fullName ?? '—',
                                    style: textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                if (user?.isSuperadmin == true)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: colorScheme.tertiaryContainer,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      'Admin',
                                      style: textTheme.labelSmall?.copyWith(
                                        color: colorScheme.onTertiaryContainer,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              user?.email ?? '—',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                ),
                if (user?.createdAt != null)
                  _InfoTile(
                    icon: Icons.calendar_today_outlined,
                    label: 'Member since',
                    value: _formatDate(user!.createdAt!),
                  ),
                if (user?.lastLogin != null) ...[
                  Divider(
                    height: 1,
                    indent: 56,
                    endIndent: 16,
                    color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                  ),
                  _InfoTile(
                    icon: Icons.login_outlined,
                    label: 'Last login',
                    value: _formatDateTime(user!.lastLogin!),
                  ),
                ],
                Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                ),
                ListTile(
                  leading: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Icon(Icons.logout,
                        size: 20, color: colorScheme.onErrorContainer),
                  ),
                  title: Text('Sign out',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.error,
                        fontWeight: FontWeight.w600,
                      )),
                  onTap: () async {
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Sign out?'),
                        content: const Text(
                            'You\'ll need to sign in again to access the app.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(false),
                            child: const Text('Cancel'),
                          ),
                          FilledButton(
                            onPressed: () => Navigator.of(ctx).pop(true),
                            style: FilledButton.styleFrom(
                              backgroundColor: colorScheme.error,
                            ),
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
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()),
                          (route) => false,
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

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

          // ── Data section ───────────────────────────────────────────────
          _SectionHeader(label: 'Data'),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: _DataTileIcon(
                    icon: Icons.cloud_upload_outlined,
                    busy: _uploading,
                  ),
                  title: Text('Send all data to server',
                      style: textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  subtitle: Text(
                    _uploading
                        ? 'Uploading ${(_uploadProgress * 100).toStringAsFixed(0)}%'
                        : 'Upload this device\'s data so an admin can '
                            'download it remotely',
                    style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.55)),
                  ),
                  onTap: _busy ? null : _sendToServer,
                ),
                Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                ),
                ListTile(
                  leading: _DataTileIcon(
                    icon: Icons.photo_library_outlined,
                    busy: _photoUploading,
                  ),
                  title: Text('Send photos to server',
                      style: textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  subtitle: Text(
                    _photoUploading
                        ? 'Batch $_batchesDone of $_batchesTotal, '
                            '${(_uploadProgress * 100).toStringAsFixed(0)}%'
                        : 'Sent in small batches. Safe to stop and resume.',
                    style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.55)),
                  ),
                  onTap: _busy ? null : _sendPhotos,
                ),
              ],
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
                  trailing: Text(
                      ref.watch(_packageInfoProvider).maybeWhen(
                            data: (info) => 'v${info.version}',
                            orElse: () => '',
                          ),
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

  Future<bool?> _confirmSend() {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Send data to server?'),
        content: const Text(
          'This sends a copy of this device\'s data to the server so an admin '
          'can review it. Nothing on this device is changed or deleted.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  Future<void> _sendPhotos() async {
    final choice = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Which photos?'),
        content: const Text(
          'Photos are sent in small batches. If it is interrupted you can '
          'start it again and it carries on where it stopped.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop('cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop('all'),
            child: const Text('All photos'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop('day'),
            child: const Text('One day'),
          ),
        ],
      ),
    );

    if (choice == null || choice == 'cancel') return;
    if (!mounted) return;

    DateTime? day;
    if (choice == 'day') {
      day = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2025),
        lastDate: DateTime.now(),
        helpText: 'Photos taken on',
      );
      if (day == null) return;
    }

    await _runPhotoUpload(day);
  }

  Future<void> _runPhotoUpload(DateTime? day) async {
    setState(() {
      _photoUploading = true;
      _batchesDone = 0;
      _batchesTotal = 0;
      _uploadProgress = 0;
    });

    var sentCount = 0;
    String? failure;

    try {
      await WakelockPlus.enable();

      final all = await DatabaseExportHelper.photosForDay(day);
      final alreadySent = await DatabaseExportHelper.sentPhotoNames();
      final pending = all
          .where((f) => !alreadySent.contains(p.basename(f.path)))
          .toList();

      if (pending.isEmpty) {
        if (mounted) {
          showAppSnackBar(
            context,
            all.isEmpty
                ? 'No photos found for that day'
                : 'All ${all.length} photo(s) already sent',
            duration: const Duration(seconds: 5),
          );
        }
        return;
      }

      final batches =
          await DatabaseExportHelper.batchBySize(pending, _batchBytes);
      if (mounted) setState(() => _batchesTotal = batches.length);

      final runId = const Uuid().v4().substring(0, 8);

      for (var i = 0; i < batches.length; i++) {
        if (mounted) {
          setState(() {
            _batchesDone = i + 1;
            _uploadProgress = 0;
          });
        }

        final zip = await DatabaseExportHelper.buildPhotoBatch(
            batches[i], runId, i + 1);
        try {
          final result = await SyncService.instance.uploadRecoveryBundle(
            zip.path,
            onProgress: (sent, total) {
              if (!mounted || total <= 0) return;
              setState(() => _uploadProgress = sent / total);
            },
          );

          if (!result.success) {
            failure = result.error;
            break;
          }
        } finally {
          if (await zip.exists()) await zip.delete();
        }

        // Recorded before any mounted check so leaving the screen cannot lose
        // the fact that these photos are safely on the server
        await DatabaseExportHelper.markPhotosSent(
            batches[i].map((f) => p.basename(f.path)));
        sentCount += batches[i].length;
      }
    } catch (e) {
      failure = '$e';
    } finally {
      await WakelockPlus.disable();
      if (mounted) {
        setState(() {
          _photoUploading = false;
          _uploadProgress = 0;
        });
      }
    }

    if (!mounted) return;
    if (failure == null) {
      showAppSnackBar(
        context,
        'Sent $sentCount photo(s)',
        duration: const Duration(seconds: 6),
      );
    } else {
      showAppSnackBar(
        context,
        'Sent $sentCount photo(s), then stopped: $failure. '
        'Tap again to carry on.',
        backgroundColor: Theme.of(context).colorScheme.error,
        duration: const Duration(seconds: 8),
      );
    }
  }

  Future<void> _sendToServer() async {
    setState(() => _uploading = true);
    try {
      final summary = await DatabaseExportHelper.inspect();
      if (!mounted) return;

      if (await _confirmSend() != true) return;
      if (!mounted) return;

      final includePhotos = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Include photos?'),
          content: Text(
            'Photos are ${(summary.photoBytes / (1024 * 1024)).toStringAsFixed(0)} MB. '
            'Sending the data on its own is much faster on a weak connection, '
            'and is enough to tell whether the records survived.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text('Data only'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: const Text('Data + photos'),
            ),
          ],
        ),
      );
      if (includePhotos == null) return;

      final bundle = await DatabaseExportHelper.buildBundle(
        summary,
        includePhotos: includePhotos,
      );

      final result = await SyncService.instance.uploadRecoveryBundle(
        bundle.path,
        onProgress: (sent, total) {
          if (!mounted || total <= 0) return;
          setState(() => _uploadProgress = sent / total);
        },
      );

      if (!mounted) return;
      if (result.success) {
        showAppSnackBar(
          context,
          'Sent to server as ${result.name}',
          duration: const Duration(seconds: 6),
        );
      } else {
        showAppSnackBar(
          context,
          'Upload failed: ${result.error}. Use "Export all data" instead.',
          backgroundColor: Theme.of(context).colorScheme.error,
          duration: const Duration(seconds: 8),
        );
      }
    } catch (e) {
      if (mounted) {
        showAppSnackBar(
          context,
          'Upload failed: $e',
          backgroundColor: Theme.of(context).colorScheme.error,
          duration: const Duration(seconds: 5),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _uploading = false;
          _uploadProgress = 0;
        });
      }
    }
  }

  String _initials(String fullName) {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  String _formatDate(DateTime dt) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }

  String _formatDateTime(DateTime dt) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final minute = dt.minute.toString().padLeft(2, '0');
    final period = dt.hour < 12 ? 'AM' : 'PM';
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year} · $hour:$minute $period';
  }
}

// ── Sub-widgets ─────────────────────────────────────────────────────────────

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Icon(icon,
          size: 20, color: colorScheme.onSurface.withValues(alpha: 0.5)),
      title: Text(label,
          style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.5))),
      trailing: Text(value,
          style:
              textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500)),
    );
  }
}

class _DataTileIcon extends StatelessWidget {
  final IconData icon;
  final bool busy;

  const _DataTileIcon({required this.icon, required this.busy});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(9),
      ),
      child: busy
          ? Padding(
              padding: const EdgeInsets.all(8),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: colorScheme.onPrimaryContainer,
              ),
            )
          : Icon(icon, size: 20, color: colorScheme.onPrimaryContainer),
    );
  }
}


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
