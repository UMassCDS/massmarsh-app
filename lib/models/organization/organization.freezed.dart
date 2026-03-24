// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return _Organization.fromJson(json);
}

/// @nodoc
mixin _$Organization {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get contactEmail => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String get userRole =>
      throw _privateConstructorUsedError; // viewer, contributor, manager, owner
  int? get memberCount => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Organization to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Organization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrganizationCopyWith<Organization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationCopyWith<$Res> {
  factory $OrganizationCopyWith(
    Organization value,
    $Res Function(Organization) then,
  ) = _$OrganizationCopyWithImpl<$Res, Organization>;
  @useResult
  $Res call({
    int id,
    String name,
    String slug,
    String? description,
    String? contactEmail,
    bool isActive,
    String userRole,
    int? memberCount,
    DateTime? createdAt,
  });
}

/// @nodoc
class _$OrganizationCopyWithImpl<$Res, $Val extends Organization>
    implements $OrganizationCopyWith<$Res> {
  _$OrganizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Organization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? description = freezed,
    Object? contactEmail = freezed,
    Object? isActive = null,
    Object? userRole = null,
    Object? memberCount = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            slug: null == slug
                ? _value.slug
                : slug // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            contactEmail: freezed == contactEmail
                ? _value.contactEmail
                : contactEmail // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            userRole: null == userRole
                ? _value.userRole
                : userRole // ignore: cast_nullable_to_non_nullable
                      as String,
            memberCount: freezed == memberCount
                ? _value.memberCount
                : memberCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrganizationImplCopyWith<$Res>
    implements $OrganizationCopyWith<$Res> {
  factory _$$OrganizationImplCopyWith(
    _$OrganizationImpl value,
    $Res Function(_$OrganizationImpl) then,
  ) = __$$OrganizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String slug,
    String? description,
    String? contactEmail,
    bool isActive,
    String userRole,
    int? memberCount,
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$OrganizationImplCopyWithImpl<$Res>
    extends _$OrganizationCopyWithImpl<$Res, _$OrganizationImpl>
    implements _$$OrganizationImplCopyWith<$Res> {
  __$$OrganizationImplCopyWithImpl(
    _$OrganizationImpl _value,
    $Res Function(_$OrganizationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Organization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? description = freezed,
    Object? contactEmail = freezed,
    Object? isActive = null,
    Object? userRole = null,
    Object? memberCount = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$OrganizationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        slug: null == slug
            ? _value.slug
            : slug // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        contactEmail: freezed == contactEmail
            ? _value.contactEmail
            : contactEmail // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        userRole: null == userRole
            ? _value.userRole
            : userRole // ignore: cast_nullable_to_non_nullable
                  as String,
        memberCount: freezed == memberCount
            ? _value.memberCount
            : memberCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrganizationImpl implements _Organization {
  const _$OrganizationImpl({
    required this.id,
    required this.name,
    required this.slug,
    this.description,
    this.contactEmail,
    this.isActive = true,
    required this.userRole,
    this.memberCount,
    this.createdAt,
  });

  factory _$OrganizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganizationImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String? description;
  @override
  final String? contactEmail;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final String userRole;
  // viewer, contributor, manager, owner
  @override
  final int? memberCount;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Organization(id: $id, name: $name, slug: $slug, description: $description, contactEmail: $contactEmail, isActive: $isActive, userRole: $userRole, memberCount: $memberCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.userRole, userRole) ||
                other.userRole == userRole) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    slug,
    description,
    contactEmail,
    isActive,
    userRole,
    memberCount,
    createdAt,
  );

  /// Create a copy of Organization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizationImplCopyWith<_$OrganizationImpl> get copyWith =>
      __$$OrganizationImplCopyWithImpl<_$OrganizationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganizationImplToJson(this);
  }
}

abstract class _Organization implements Organization {
  const factory _Organization({
    required final int id,
    required final String name,
    required final String slug,
    final String? description,
    final String? contactEmail,
    final bool isActive,
    required final String userRole,
    final int? memberCount,
    final DateTime? createdAt,
  }) = _$OrganizationImpl;

  factory _Organization.fromJson(Map<String, dynamic> json) =
      _$OrganizationImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  String? get description;
  @override
  String? get contactEmail;
  @override
  bool get isActive;
  @override
  String get userRole; // viewer, contributor, manager, owner
  @override
  int? get memberCount;
  @override
  DateTime? get createdAt;

  /// Create a copy of Organization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrganizationImplCopyWith<_$OrganizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
