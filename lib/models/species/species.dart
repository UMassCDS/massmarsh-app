import 'package:freezed_annotation/freezed_annotation.dart';

part 'species.freezed.dart';
part 'species.g.dart';

@freezed
class Species with _$Species {
  const factory Species({
    required String code,
    String? commonName,
    String? scientificName,
    String? family,
    String? growthForm,
    String? nativeStatus,
    @Default(true) bool active,
  }) = _Species;

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);

  const Species._();

  String get displayName => '$code - ${commonName ?? scientificName ?? 'Unknown'}';
}
