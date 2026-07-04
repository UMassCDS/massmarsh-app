import 'package:flutter_test/flutter_test.dart';
import 'package:mass_marsh_app/utils/id_utils.dart';

void main() {
  group('incrementTrailingNumber', () {
    const cases = <String, String?>{
      // arbitrary prefixes with padded trailing numbers
      'plotHELLO_001': 'plotHELLO_002',
      'plot01': 'plot02',
      'gps_4Jul2026_001': 'gps_4Jul2026_002',
      // padding preserved across digit boundaries
      'gps_4Jul2026_009': 'gps_4Jul2026_010',
      'plot09': 'plot10',
      'plot_9': 'plot_10',
      // number grows past its padding width
      'plot99': 'plot100',
      'site_099': 'site_100',
      // only the trailing digit run increments; earlier numbers untouched
      'gps_4Jul2026_010': 'gps_4Jul2026_011',
      'T2026B7': 'T2026B8',
      // plain numbers (RTK point style)
      '1': '2',
      '007': '008',
      '10': '11',
      // no separator between prefix and number
      'A1': 'A2',
      // surrounding whitespace ignored
      ' plot_004 ': 'plot_005',
      // no trailing digits -> null so callers can fall back
      'plot': null,
      'plotA': null,
      '': null,
      '2026site': null,
    };

    cases.forEach((input, expected) {
      test('"$input" -> ${expected ?? 'null'}', () {
        expect(incrementTrailingNumber(input), expected);
      });
    });

    test('repeated increments stay consistent across the 009/010 boundary', () {
      var id = 'gps_4Jul2026_008';
      final seq = <String>[];
      for (var i = 0; i < 4; i++) {
        id = incrementTrailingNumber(id)!;
        seq.add(id);
      }
      expect(seq, [
        'gps_4Jul2026_009',
        'gps_4Jul2026_010',
        'gps_4Jul2026_011',
        'gps_4Jul2026_012',
      ]);
    });
  });
}
