/// Increments the trailing run of digits in [previous], preserving the prefix
/// and zero-padding, so any user-entered format continues naturally:
/// plotHELLO_001 -> plotHELLO_002, plot09 -> plot10, gps_4Jul2026_009 ->
/// gps_4Jul2026_010, plot99 -> plot100, 7 -> 8.
///
/// Returns null when [previous] has no trailing digits (nothing to continue).
String? incrementTrailingNumber(String previous) {
  final match = RegExp(r'^(.*?)(\d+)$').firstMatch(previous.trim());
  if (match == null) return null;
  final prefix = match.group(1)!;
  final digits = match.group(2)!;
  final value = int.tryParse(digits);
  if (value == null) return null; // digit run too long to represent
  return '$prefix${(value + 1).toString().padLeft(digits.length, '0')}';
}
