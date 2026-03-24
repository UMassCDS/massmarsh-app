// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpeciesImpl _$$SpeciesImplFromJson(Map<String, dynamic> json) =>
    _$SpeciesImpl(
      code: json['code'] as String,
      commonName: json['commonName'] as String?,
      scientificName: json['scientificName'] as String?,
      family: json['family'] as String?,
      growthForm: json['growthForm'] as String?,
      nativeStatus: json['nativeStatus'] as String?,
      active: json['active'] as bool? ?? true,
    );

Map<String, dynamic> _$$SpeciesImplToJson(_$SpeciesImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'commonName': instance.commonName,
      'scientificName': instance.scientificName,
      'family': instance.family,
      'growthForm': instance.growthForm,
      'nativeStatus': instance.nativeStatus,
      'active': instance.active,
    };
