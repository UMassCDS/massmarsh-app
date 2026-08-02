import 'package:logger/logger.dart';

final _ringBuffer = MemoryOutput(bufferSize: 100, secondOutput: ConsoleOutput());

// One shared logger so the ring buffer captures everything, not just
// whichever service happened to have its own private Logger()
final appLogger = Logger(output: _ringBuffer);

String dumpRecentLogs() {
  final buffer = StringBuffer();
  for (final event in _ringBuffer.buffer) {
    final time = event.origin.time.toIso8601String();
    final level = event.level.name.toUpperCase();
    for (final line in event.lines) {
      buffer.writeln('$time [$level] $line');
    }
  }
  return buffer.isEmpty ? 'No log entries captured this session.' : buffer.toString();
}
