// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vegetation_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VegetationRecordImpl _$$VegetationRecordImplFromJson(
  Map<String, dynamic> json,
) => _$VegetationRecordImpl(
  id: (json['id'] as num?)?.toInt(),
  localId: json['localId'] as String?,
  serverId: (json['serverId'] as num?)?.toInt(),
  outingId: (json['outingId'] as num).toInt(),
  transectId: json['transectId'] as String,
  plotNumber: (json['plotNumber'] as num).toInt(),
  habitatType: json['habitatType'] as String,
  distanceAlongTransectM: (json['distanceAlongTransectM'] as num).toDouble(),
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  elevationM: (json['elevationM'] as num?)?.toDouble(),
  accuracyM: (json['accuracyM'] as num?)?.toDouble(),
  canopyHeightM: (json['canopyHeightM'] as num).toDouble(),
  thatchHeightM: (json['thatchHeightM'] as num).toDouble(),
  speciesObservations: (json['speciesObservations'] as List<dynamic>)
      .map((e) => SpeciesObservation.fromJson(e as Map<String, dynamic>))
      .toList(),
  photoLocalPath: json['photoLocalPath'] as String?,
  photoFilename: json['photoFilename'] as String?,
  notes: json['notes'] as String?,
  syncStatus: json['syncStatus'] as String? ?? 'pending',
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$VegetationRecordImplToJson(
  _$VegetationRecordImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'localId': instance.localId,
  'serverId': instance.serverId,
  'outingId': instance.outingId,
  'transectId': instance.transectId,
  'plotNumber': instance.plotNumber,
  'habitatType': instance.habitatType,
  'distanceAlongTransectM': instance.distanceAlongTransectM,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'elevationM': instance.elevationM,
  'accuracyM': instance.accuracyM,
  'canopyHeightM': instance.canopyHeightM,
  'thatchHeightM': instance.thatchHeightM,
  'speciesObservations': instance.speciesObservations,
  'photoLocalPath': instance.photoLocalPath,
  'photoFilename': instance.photoFilename,
  'notes': instance.notes,
  'syncStatus': instance.syncStatus,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

_$SpeciesObservationImpl _$$SpeciesObservationImplFromJson(
  Map<String, dynamic> json,
) => _$SpeciesObservationImpl(
  id: json['id'] as String?,
  speciesCode: json['speciesCode'] as String,
  percentageCover: (json['percentageCover'] as num).toInt(),
);

Map<String, dynamic> _$$SpeciesObservationImplToJson(
  _$SpeciesObservationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'speciesCode': instance.speciesCode,
  'percentageCover': instance.percentageCover,
};
