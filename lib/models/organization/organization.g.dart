// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganizationImpl _$$OrganizationImplFromJson(Map<String, dynamic> json) =>
    _$OrganizationImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      contactEmail: json['contactEmail'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      userRole: json['userRole'] as String,
      defaultVisibility: json['defaultVisibility'] as String? ?? 'public',
      memberCount: (json['memberCount'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$OrganizationImplToJson(_$OrganizationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'contactEmail': instance.contactEmail,
      'isActive': instance.isActive,
      'userRole': instance.userRole,
      'defaultVisibility': instance.defaultVisibility,
      'memberCount': instance.memberCount,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
