import 'package:freezed_annotation/freezed_annotation.dart';

part 'vegetation_record.freezed.dart';
part 'vegetation_record.g.dart';

@freezed
class VegetationRecord with _$VegetationRecord {
  const factory VegetationRecord({
    int? id,
    String? localId,
    int? serverId,
    required int outingId,
    @Default('') String transectId,
    required int plotNumber,
    @Default('') String habitatType,
    @Default(0.0) double distanceAlongTransectM,
    required double latitude,
    required double longitude,
    double? elevationM,
    double? accuracyM,
    @Default(0.0) double canopyHeightM,
    @Default(0.0) double thatchHeightM,
    required List<SpeciesObservation> speciesObservations,
    String? photoLocalPath,
    String? photoFilename,
    String? notes,
    // Protocol-specific fields
    String? protocolCode,
    String? subclass,
    String? rtkPointNumber,
    @Default('pending') String syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VegetationRecord;

  factory VegetationRecord.fromJson(Map<String, dynamic> json) =>
      _$VegetationRecordFromJson(json);
}

@freezed
class SpeciesObservation with _$SpeciesObservation {
  const factory SpeciesObservation({
    String? id,
    required String speciesCode,
    required int percentageCover,
  }) = _SpeciesObservation;

  factory SpeciesObservation.fromJson(Map<String, dynamic> json) =>
      _$SpeciesObservationFromJson(json);
}
