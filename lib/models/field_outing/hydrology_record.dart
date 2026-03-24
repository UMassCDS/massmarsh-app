import 'package:freezed_annotation/freezed_annotation.dart';

part 'hydrology_record.freezed.dart';
part 'hydrology_record.g.dart';

@freezed
class HydrologyRecord with _$HydrologyRecord {
  const factory HydrologyRecord({
    int? id,
    String? localId,
    int? serverId,
    required int outingId,
    String? areaTreatment,
    String? wlrType,
    String? serialNumber,
    required String elevationWaypointType, // RTK or GTS
    required int waypointNumber,
    required int rtkElevationNavd88M,
    String? timeWaterElevationTaken,
    double? waterAboveBelowNutM,
    double? wellRimToWaterM,
    double? wellRimToMarshM,
    double? wellRimToSensorM,
    double? wellLengthM,
    String? notes,
    @Default('pending') String syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _HydrologyRecord;

  factory HydrologyRecord.fromJson(Map<String, dynamic> json) =>
      _$HydrologyRecordFromJson(json);
}
