import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mass_marsh_app/services/draft_autosave.dart';

void main() {
  group('DraftAutosave', () {
    test('schedule() does not write before idleDelay elapses', () async {
      var saveCount = 0;
      final autosave = DraftAutosave(
        save: () async => saveCount++,
        idleDelay: const Duration(milliseconds: 50),
      );

      autosave.schedule();
      expect(saveCount, 0);

      await Future.delayed(const Duration(milliseconds: 80));
      expect(saveCount, 1);
    });

    test('rapid edits coalesce into a single write', () async {
      var saveCount = 0;
      final autosave = DraftAutosave(
        save: () async => saveCount++,
        idleDelay: const Duration(milliseconds: 50),
      );

      for (var i = 0; i < 10; i++) {
        autosave.schedule();
        await Future.delayed(const Duration(milliseconds: 5));
      }

      await Future.delayed(const Duration(milliseconds: 80));
      expect(saveCount, 1);
    });

    test('flush() writes immediately without waiting for idleDelay', () async {
      var saveCount = 0;
      final autosave = DraftAutosave(
        save: () async => saveCount++,
        idleDelay: const Duration(seconds: 30),
      );

      autosave.schedule();
      await autosave.flush();
      expect(saveCount, 1);
    });

    test('flush() with nothing scheduled is a no-op', () async {
      var saveCount = 0;
      final autosave = DraftAutosave(save: () async => saveCount++);

      await autosave.flush();
      expect(saveCount, 0);
    });

    test('an edit made during an in-flight save is not dropped', () async {
      var saveCount = 0;
      final started = <int>[];
      final autosave = DraftAutosave(
        save: () async {
          started.add(saveCount);
          await Future.delayed(const Duration(milliseconds: 30));
          saveCount++;
        },
        idleDelay: const Duration(milliseconds: 10),
      );

      autosave.schedule();
      // Overlaps the first save deliberately, simulating an edit that lands
      // while the previous write is still in flight
      await Future.delayed(const Duration(milliseconds: 20));
      autosave.schedule();

      await Future.delayed(const Duration(milliseconds: 120));
      expect(saveCount, 2, reason: 'the second edit must trigger its own write');
    });

    test('a failed save leaves the edit dirty and flush() retries it', () async {
      var attempts = 0;
      final autosave = DraftAutosave(
        save: () async {
          attempts++;
          if (attempts == 1) throw Exception('write failed');
        },
        idleDelay: const Duration(milliseconds: 500),
      );

      autosave.schedule();
      await expectLater(autosave.flush(), throwsException);
      expect(attempts, 1);

      // Retried explicitly, as the form's lifecycle-pause handler would
      await autosave.flush();
      expect(attempts, 2);
    });

    test('cancel() stops the pending timer without writing', () async {
      var saveCount = 0;
      final autosave = DraftAutosave(
        save: () async => saveCount++,
        idleDelay: const Duration(milliseconds: 30),
      );

      autosave.schedule();
      autosave.cancel();
      await Future.delayed(const Duration(milliseconds: 60));

      expect(saveCount, 0);
    });

    test('schedule() after cancel() is inert', () async {
      var saveCount = 0;
      final autosave = DraftAutosave(
        save: () async => saveCount++,
        idleDelay: const Duration(milliseconds: 10),
      );

      autosave.cancel();
      autosave.schedule();
      await Future.delayed(const Duration(milliseconds: 40));

      expect(saveCount, 0);
    });

    test('hasPendingWork reflects scheduled, in-flight and dirty-after-error states',
        () async {
      final completer = Completer<void>();
      final autosave = DraftAutosave(
        save: () => completer.future,
        idleDelay: const Duration(milliseconds: 10),
      );

      expect(autosave.hasPendingWork, isFalse);

      autosave.schedule();
      expect(autosave.hasPendingWork, isTrue);

      await Future.delayed(const Duration(milliseconds: 30));
      expect(autosave.hasPendingWork, isTrue, reason: 'save is in flight');

      completer.complete();
      await Future.delayed(Duration.zero);
      expect(autosave.hasPendingWork, isFalse);
    });
  });
}
