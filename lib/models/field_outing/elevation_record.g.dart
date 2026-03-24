// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elevation_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ElevationRecordImpl _$$ElevationRecordImplFromJson(
  Map<String, dynamic> json,
) => _$ElevationRecordImpl(
  id: (json['id'] as num?)?.toInt(),
  localId: json['localId'] as String?,
  serverId: (json['serverId'] as num?)?.toInt(),
  outingId: (json['outingId'] as num).toInt(),
  transectId: json['transectId'] as String,
  pointNumber: (json['pointNumber'] as num).toInt(),
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  elevationNavd88M: (json['elevationNavd88M'] as num).toDouble(),
  featureType: json['featureType'] as String?,
  notes: json['notes'] as String?,
  syncStatus: json['syncStatus'] as String? ?? 'pending',
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$ElevationRecordImplToJson(
  _$ElevationRecordImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'localId': instance.localId,
  'serverId': instance.serverId,
  'outingId': instance.outingId,
  'transectId': instance.transectId,
  'pointNumber': instance.pointNumber,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'elevationNavd88M': instance.elevationNavd88M,
  'featureType': instance.featureType,
  'notes': instance.notes,
  'syncStatus': instance.syncStatus,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
