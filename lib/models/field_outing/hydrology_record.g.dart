// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hydrology_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HydrologyRecordImpl _$$HydrologyRecordImplFromJson(
  Map<String, dynamic> json,
) => _$HydrologyRecordImpl(
  id: (json['id'] as num?)?.toInt(),
  localId: json['localId'] as String?,
  serverId: (json['serverId'] as num?)?.toInt(),
  outingId: (json['outingId'] as num).toInt(),
  areaTreatment: json['areaTreatment'] as String?,
  wlrType: json['wlrType'] as String?,
  serialNumber: json['serialNumber'] as String?,
  elevationWaypointType: json['elevationWaypointType'] as String,
  waypointNumber: (json['waypointNumber'] as num).toInt(),
  rtkElevationNavd88M: (json['rtkElevationNavd88M'] as num).toInt(),
  timeWaterElevationTaken: json['timeWaterElevationTaken'] as String?,
  waterAboveBelowNutM: (json['waterAboveBelowNutM'] as num?)?.toDouble(),
  wellRimToWaterM: (json['wellRimToWaterM'] as num?)?.toDouble(),
  wellRimToMarshM: (json['wellRimToMarshM'] as num?)?.toDouble(),
  wellRimToSensorM: (json['wellRimToSensorM'] as num?)?.toDouble(),
  wellLengthM: (json['wellLengthM'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  syncStatus: json['syncStatus'] as String? ?? 'pending',
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$HydrologyRecordImplToJson(
  _$HydrologyRecordImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'localId': instance.localId,
  'serverId': instance.serverId,
  'outingId': instance.outingId,
  'areaTreatment': instance.areaTreatment,
  'wlrType': instance.wlrType,
  'serialNumber': instance.serialNumber,
  'elevationWaypointType': instance.elevationWaypointType,
  'waypointNumber': instance.waypointNumber,
  'rtkElevationNavd88M': instance.rtkElevationNavd88M,
  'timeWaterElevationTaken': instance.timeWaterElevationTaken,
  'waterAboveBelowNutM': instance.waterAboveBelowNutM,
  'wellRimToWaterM': instance.wellRimToWaterM,
  'wellRimToMarshM': instance.wellRimToMarshM,
  'wellRimToSensorM': instance.wellRimToSensorM,
  'wellLengthM': instance.wellLengthM,
  'notes': instance.notes,
  'syncStatus': instance.syncStatus,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
