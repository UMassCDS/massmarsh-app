// Run from project root: dart run tools/generate_icon.dart
import 'dart:io';
import 'dart:math' as math;
import 'package:image/image.dart' as img;

void main() {
  const size = 1024;
  const cx = size ~/ 2; // 512

  final image = img.Image(width: size, height: size);

  // --- Background: dark forest green with subtle radial highlight ---
  for (int y = 0; y < size; y++) {
    for (int x = 0; x < size; x++) {
      final dx = (x - cx).toDouble();
      final dy = (y - cx).toDouble();
      final dist = math.sqrt(dx * dx + dy * dy);
      final factor = (1.0 - dist / (size * 0.75)).clamp(0.0, 1.0) * 40;
      final r = (27 + factor).round().clamp(0, 255);
      final g = (94 + factor).round().clamp(0, 255);
      final b = (32 + factor).round().clamp(0, 255);
      image.setPixel(x, y, img.ColorRgb8(r, g, b));
    }
  }

  final white = img.ColorRgb8(255, 255, 255);

  // --- 3 Marsh reeds (tall rectangle + round cap) ---
  const reedW = 52;
  const baseY = 710;

  _drawReed(image, cx - 145, 325, baseY, reedW, white);
  _drawReed(image, cx, 240, baseY, reedW, white);
  _drawReed(image, cx + 145, 345, baseY, reedW, white);

  // --- Water: 3 horizontal bands (narrowing, fading) ---
  img.fillRect(
      image, x1: 110, y1: baseY + 10, x2: size - 110, y2: baseY + 62,
      color: white);
  img.fillRect(
      image, x1: 155, y1: baseY + 95, x2: size - 155, y2: baseY + 137,
      color: img.ColorRgb8(200, 230, 200));
  img.fillRect(
      image, x1: 205, y1: baseY + 172, x2: size - 205, y2: baseY + 207,
      color: img.ColorRgb8(140, 190, 145));

  // Save
  final outPath = 'assets/icon.png';
  final bytes = img.encodePng(image);
  File(outPath).writeAsBytesSync(bytes);
  stdout.writeln('✅ Icon saved to $outPath (${(bytes.length / 1024).toStringAsFixed(1)} KB)');
}

void _drawReed(
    img.Image image, int cx, int topY, int baseY, int reedW, img.Color color) {
  final half = reedW ~/ 2;
  // Filled rectangle body
  img.fillRect(image,
      x1: cx - half, y1: topY, x2: cx + half, y2: baseY, color: color);
  // Filled circle cap (drawn row by row)
  _fillCircle(image, cx, topY, half, color);
}

void _fillCircle(
    img.Image image, int cx, int cy, int radius, img.Color color) {
  for (int y = cy - radius; y <= cy + radius; y++) {
    final dy = (y - cy).toDouble();
    final dx = math.sqrt((radius * radius).toDouble() - dy * dy).round();
    img.drawLine(image, x1: cx - dx, y1: y, x2: cx + dx, y2: y, color: color);
  }
}
