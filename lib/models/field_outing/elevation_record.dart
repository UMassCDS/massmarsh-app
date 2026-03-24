import 'package:freezed_annotation/freezed_annotation.dart';

part 'elevation_record.freezed.dart';
part 'elevation_record.g.dart';

@freezed
class ElevationRecord with _$ElevationRecord {
  const factory ElevationRecord({
    int? id,
    String? localId,
    int? serverId,
    required int outingId,
    required String transectId,
    required int pointNumber,
    required double latitude,
    required double longitude,
    required double elevationNavd88M,
    String? featureType,
    String? notes,
    @Default('pending') String syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ElevationRecord;

  factory ElevationRecord.fromJson(Map<String, dynamic> json) =>
      _$ElevationRecordFromJson(json);
}
