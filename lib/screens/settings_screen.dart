import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;
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
  double _uploadProgress = 0;
  String? _phase;

  static const _batchBytes = 40 * 1024 * 1024;

  String get _statusLine => _phase == null
      ? ''
      : '$_phase ${(_uploadProgress * 100).toStringAsFixed(0)}%';

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
                        ? _statusLine
                        : 'Everything on this device. Photos are sent in '
                            'batches you can stop and resume.',
                    style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.55)),
                  ),
                  onTap: _uploading ? null : _sendAll,
                ),
                Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                ),
                ListTile(
                  leading: _DataTileIcon(
                    icon: Icons.event_outlined,
                    busy: false,
                  ),
                  title: Text('Send data from one day',
                      style: textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  subtitle: Text(
                    'Pick a date. Much quicker when you only need one day.',
                    style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.55)),
                  ),
                  onTap: _uploading ? null : _sendOneDay,
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

  Future<void> _sendAll() => _send(null);

  Future<void> _sendOneDay() async {
    final day = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime.now(),
      helpText: 'Send data from',
    );
    if (day == null) return;
    await _send(day);
  }

  // One path for both buttons: data as one small upload, photos in batches
  Future<void> _send(DateTime? day) async {
    setState(() {
      _uploading = true;
      _uploadProgress = 0;
      _phase = 'Preparing';
    });

    try {
      await WakelockPlus.enable();

      final scope = DatabaseExportHelper.scopeLabel(day);

      final summary = await DatabaseExportHelper.inspect();
      final photos = await DatabaseExportHelper.photosForDay(day);
      final resumable = await DatabaseExportHelper.resumableFor(scope);
      final pending = photos
          .where((f) => !resumable.contains(p.basename(f.path)))
          .toList();
      if (!mounted) return;

      final withPhotos = await _askScope(day, photos, pending);
      if (withPhotos == null) return;

      setState(() => _phase = 'Sending data');
      final bundle = await DatabaseExportHelper.buildBundle(summary, scope);
      final dataResult = await SyncService.instance.uploadRecoveryBundle(
        bundle.path,
        onProgress: (sent, total) {
          if (!mounted || total <= 0) return;
          setState(() => _uploadProgress = sent / total);
        },
      );
      if (await bundle.exists()) await bundle.delete();

      if (!dataResult.success) {
        _report('Data upload failed: ${dataResult.error}', isError: true);
        return;
      }

      if (!withPhotos || photos.isEmpty) {
        _report('Data sent.');
        return;
      }

      if (pending.isEmpty) {
        // Every photo went up on a previous attempt, so the run is finished
        await DatabaseExportHelper.clearRunState();
        _report('Data sent. Photos were already finished.');
        return;
      }

      final sent = await _uploadPhotoBatches(pending, scope);
      if (sent.failure == null) {
        // Run complete: forget the progress so the next upload sends it all
        await DatabaseExportHelper.clearRunState();
        _report('Data sent, plus ${sent.count} photo(s).');
      } else {
        _report(
            'Data sent, plus ${sent.count} photo(s), then stopped: '
            '${sent.failure}. Start it again to carry on.',
            isError: true);
      }
    } catch (e) {
      _report('Upload failed: $e', isError: true);
    } finally {
      await WakelockPlus.disable();
      if (mounted) {
        setState(() {
          _uploading = false;
          _uploadProgress = 0;
          _phase = null;
        });
      }
    }
  }

  static String _humanSize(int bytes) {
    if (bytes >= 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
    }
    if (bytes >= 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    if (bytes >= 1024) return '${(bytes / 1024).toStringAsFixed(0)} KB';
    return '$bytes B';
  }

  Future<bool?> _askScope(
    DateTime? day,
    List<File> photos,
    List<File> pending,
  ) async {
    final what = day == null
        ? 'everything on this device'
        : 'the database plus photos from '
            '${day.day}/${day.month}/${day.year}';

    var totalBytes = 0;
    for (final f in photos) {
      totalBytes += await f.length();
    }
    var pendingBytes = 0;
    for (final f in pending) {
      pendingBytes += await f.length();
    }

    final resuming = pending.length < photos.length;
    String photoLine;
    if (photos.isNotEmpty) {
      photoLine = resuming
          ? '${photos.length} photo(s), ${_humanSize(totalBytes)}. '
              'Carrying on from an upload that stopped: '
              '${photos.length - pending.length} already sent, '
              '${pending.length} left (${_humanSize(pendingBytes)}).'
          : '${photos.length} photo(s), ${_humanSize(totalBytes)}.';
    } else if (day == null) {
      photoLine = 'No photos are stored on this device.';
    } else {
      // Never let an empty day read as "everything is gone" without saying how
      // many photos the device actually holds
      final onDevice = (await DatabaseExportHelper.allPhotos()).length;
      photoLine = onDevice == 0
          ? 'No photos are stored on this device at all.'
          : 'No photos from that day. This device holds $onDevice photo(s) '
              'from other dates, so try "Send all data to server" or pick a '
              'different date.';
    }

    if (!mounted) return null;
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Send to server?'),
        content: Text(
          'This sends $what so an admin can review it. Nothing on this '
          'device is changed or deleted.\n\n'
          '$photoLine\n\n'
          'Photos go in small batches. If this stops partway you can start it '
          'again and it will pick up where it left off.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(null),
            child: const Text('Cancel'),
          ),
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
  }

  Future<({int count, String? failure})> _uploadPhotoBatches(
      List<File> pending, String scope) async {
    final batches = await DatabaseExportHelper.batchBySize(pending, _batchBytes);
    var count = 0;

    for (var i = 0; i < batches.length; i++) {
      if (mounted) {
        setState(() {
          _uploadProgress = 0;
          _phase = 'Photos ${i + 1} of ${batches.length}';
        });
      }

      final zip = await DatabaseExportHelper.buildPhotoBatch(
          batches[i], scope, i + 1, batches.length);
      try {
        final result = await SyncService.instance.uploadRecoveryBundle(
          zip.path,
          onProgress: (sent, total) {
            if (!mounted || total <= 0) return;
            setState(() => _uploadProgress = sent / total);
          },
        );
        if (!result.success) return (count: count, failure: result.error);
      } finally {
        if (await zip.exists()) await zip.delete();
      }

      // Recorded before any mounted check, so leaving the screen cannot lose
      // the fact that these are safely on the server
      await DatabaseExportHelper.recordRunProgress(
          scope, batches[i].map((f) => p.basename(f.path)));
      count += batches[i].length;
    }

    return (count: count, failure: null);
  }

  void _report(String message, {bool isError = false}) {
    if (!mounted) return;
    if (isError) {
      showAppSnackBar(
        context,
        message,
        backgroundColor: Theme.of(context).colorScheme.error,
        duration: const Duration(seconds: 8),
      );
    } else {
      showAppSnackBar(context, message, duration: const Duration(seconds: 6));
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
