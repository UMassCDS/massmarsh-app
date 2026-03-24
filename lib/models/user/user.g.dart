// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  fullName: json['fullName'] as String,
  isActive: json['isActive'] as bool? ?? true,
  isSuperadmin: json['isSuperadmin'] as bool? ?? false,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  lastLogin: json['lastLogin'] == null
      ? null
      : DateTime.parse(json['lastLogin'] as String),
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'isActive': instance.isActive,
      'isSuperadmin': instance.isSuperadmin,
      'createdAt': instance.createdAt?.toIso8601String(),
      'lastLogin': instance.lastLogin?.toIso8601String(),
    };
