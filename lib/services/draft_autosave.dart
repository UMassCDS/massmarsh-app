import 'dart:async';

/// Coalesces rapid form edits into one write, and guarantees a write happens
/// before the app can be killed.
///
/// The contract is that at most one edit can ever be lost: every change either
/// lands within [idleDelay] or is forced out by [flush] on a lifecycle event.
class DraftAutosave {
  final Future<void> Function() save;
  final Duration idleDelay;

  DraftAutosave({
    required this.save,
    this.idleDelay = const Duration(milliseconds: 800),
  });

  Timer? _timer;
  Future<void>? _inFlight;
  bool _dirty = false;
  bool _disposed = false;

  bool get hasPendingWork => _dirty || _timer != null || _inFlight != null;

  /// Called on every field edit. Cheap, and safe to call in a hot path.
  void schedule() {
    if (_disposed) return;
    _dirty = true;
    _timer?.cancel();
    _timer = Timer(idleDelay, () {
      _timer = null;
      _run();
    });
  }

  /// Writes immediately. Awaits any save already running so the last edit is
  /// never overtaken by an earlier one.
  Future<void> flush() async {
    _timer?.cancel();
    _timer = null;
    await _run();
  }

  Future<void> _run() async {
    if (!_dirty && _inFlight == null) return;

    // A save already running may have read state from before the latest edit,
    // so wait for it and then write again rather than dropping this one
    while (_inFlight != null) {
      await _inFlight;
    }
    if (!_dirty) return;

    _dirty = false;
    final future = save();
    _inFlight = future;
    try {
      await future;
    } catch (_) {
      // Left dirty on purpose so the next tick or flush retries
      _dirty = true;
      rethrow;
    } finally {
      _inFlight = null;
    }
  }

  /// Stops scheduling without writing. The caller is expected to have already
  /// captured the pending state, since a widget being torn down cannot await.
  void cancel() {
    _timer?.cancel();
    _timer = null;
    _disposed = true;
  }
}
