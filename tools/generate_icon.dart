// Run from project root: dart run tools/generate_icon.dart
import 'dart:io';
import 'dart:math' as math;
import 'package:image/image.dart' as img;

void main() {
  const size = 1024;
  const cx = size ~/ 2;

  final image = img.Image(width: size, height: size);

  // ── Background: deep forest green, brighter radial glow from upper-centre ──
  for (int y = 0; y < size; y++) {
    for (int x = 0; x < size; x++) {
      final dx = (x - cx).toDouble();
      final dy = (y - size * 0.35).toDouble();
      final dist = math.sqrt(dx * dx + dy * dy) / size;
      final t = (1.0 - dist * 1.3).clamp(0.0, 1.0);
      final r = _lerp(12, 40, t).round().clamp(0, 255);
      final g = _lerp(52, 110, t).round().clamp(0, 255);
      final b = _lerp(20, 48, t).round().clamp(0, 255);
      image.setPixel(x, y, img.ColorRgb8(r, g, b));
    }
  }

  const baseY = 640; // ground line — raised for better centering

  // ── Marsh grass: 5 tapered blades, varying heights & lean ──
  // (bx, topY, baseWidth, tipWidth, lean)
  final blades = [
    (cx - 175, 310, 36, 8, -22),
    (cx - 72,  225, 42, 10, -10),
    (cx,       185, 48, 12, 0),
    (cx + 82,  240, 40, 9,  12),
    (cx + 185, 320, 34, 7,  24),
  ];

  final white    = img.ColorRgb8(255, 255, 255);
  final midWhite = img.ColorRgb8(210, 235, 213);
  final dimWhite = img.ColorRgb8(155, 195, 160);

  for (final b in blades) {
    _drawBlade(image, b.$1, b.$2, baseY, b.$3, b.$4, b.$5, white);
  }

  // ── Water: 3 filled arc bands below the grass line ──
  _drawArc(image, cx, baseY + 60,  300, 32, white);
  _drawArc(image, cx, baseY + 138, 228, 26, midWhite);
  _drawArc(image, cx, baseY + 208, 160, 20, dimWhite);

  final outPath = 'assets/icon.png';
  final bytes = img.encodePng(image);
  File(outPath).writeAsBytesSync(bytes);
  stdout.writeln('✅ Icon saved to $outPath  (${(bytes.length / 1024).toStringAsFixed(1)} KB)');
}

double _lerp(num a, num b, double t) => a + (b - a) * t;

/// Tapered blade: wide at [baseY], [tipWidth] at [topY], leaning by [lean] px at tip.
void _drawBlade(
    img.Image image, int bx, int topY, int baseY, int baseWidth, int tipWidth, int lean, img.Color color) {
  final height = (baseY - topY).toDouble();
  for (int y = topY; y <= baseY; y++) {
    final t = (y - topY) / height; // 0 at tip, 1 at base
    final w = (tipWidth + (baseWidth - tipWidth) * t).round();
    final lx = (lean * (1.0 - t)).round(); // lean shrinks toward base
    final x1 = bx - w ~/ 2 + lx;
    final x2 = bx + w ~/ 2 + lx;
    for (int x = x1; x <= x2; x++) {
      if (x >= 0 && x < image.width) image.setPixel(x, y, color);
    }
  }
}

/// Upward-arching arc (∩) — drawn with 5-px stroke for visibility at small sizes.
void _drawArc(img.Image image, int cx, int cy, int rx, int ry, img.Color color) {
  // Sweep from π → 2π traces left→top→right (arch shape)
  const steps = 1200;
  for (int i = 0; i <= steps; i++) {
    final angle = math.pi + (math.pi * i / steps);
    final x = (cx + rx * math.cos(angle)).round();
    final y = (cy + ry * math.sin(angle)).round();
    // 5-px wide stroke
    for (int dx = -2; dx <= 2; dx++) {
      for (int dy = -2; dy <= 2; dy++) {
        final px = x + dx;
        final py = y + dy;
        if (px >= 0 && px < image.width && py >= 0 && py < image.height) {
          image.setPixel(px, py, color);
        }
      }
    }
  }
}
