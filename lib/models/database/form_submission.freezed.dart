// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_submission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FormSubmission _$FormSubmissionFromJson(Map<String, dynamic> json) {
  return _FormSubmission.fromJson(json);
}

/// @nodoc
mixin _$FormSubmission {
  int? get id => throw _privateConstructorUsedError;
  int get orgId => throw _privateConstructorUsedError;
  String get formType =>
      throw _privateConstructorUsedError; // 'common', 'vegetation', 'hydrology', 'elevation'
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get synced => throw _privateConstructorUsedError;
  DateTime? get syncedAt => throw _privateConstructorUsedError;

  /// Serializes this FormSubmission to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FormSubmission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormSubmissionCopyWith<FormSubmission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormSubmissionCopyWith<$Res> {
  factory $FormSubmissionCopyWith(
    FormSubmission value,
    $Res Function(FormSubmission) then,
  ) = _$FormSubmissionCopyWithImpl<$Res, FormSubmission>;
  @useResult
  $Res call({
    int? id,
    int orgId,
    String formType,
    Map<String, dynamic> data,
    DateTime createdAt,
    DateTime updatedAt,
    bool synced,
    DateTime? syncedAt,
  });
}

/// @nodoc
class _$FormSubmissionCopyWithImpl<$Res, $Val extends FormSubmission>
    implements $FormSubmissionCopyWith<$Res> {
  _$FormSubmissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormSubmission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orgId = null,
    Object? formType = null,
    Object? data = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? synced = null,
    Object? syncedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            orgId: null == orgId
                ? _value.orgId
                : orgId // ignore: cast_nullable_to_non_nullable
                      as int,
            formType: null == formType
                ? _value.formType
                : formType // ignore: cast_nullable_to_non_nullable
                      as String,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            synced: null == synced
                ? _value.synced
                : synced // ignore: cast_nullable_to_non_nullable
                      as bool,
            syncedAt: freezed == syncedAt
                ? _value.syncedAt
                : syncedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FormSubmissionImplCopyWith<$Res>
    implements $FormSubmissionCopyWith<$Res> {
  factory _$$FormSubmissionImplCopyWith(
    _$FormSubmissionImpl value,
    $Res Function(_$FormSubmissionImpl) then,
  ) = __$$FormSubmissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    int orgId,
    String formType,
    Map<String, dynamic> data,
    DateTime createdAt,
    DateTime updatedAt,
    bool synced,
    DateTime? syncedAt,
  });
}

/// @nodoc
class __$$FormSubmissionImplCopyWithImpl<$Res>
    extends _$FormSubmissionCopyWithImpl<$Res, _$FormSubmissionImpl>
    implements _$$FormSubmissionImplCopyWith<$Res> {
  __$$FormSubmissionImplCopyWithImpl(
    _$FormSubmissionImpl _value,
    $Res Function(_$FormSubmissionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormSubmission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orgId = null,
    Object? formType = null,
    Object? data = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? synced = null,
    Object? syncedAt = freezed,
  }) {
    return _then(
      _$FormSubmissionImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        orgId: null == orgId
            ? _value.orgId
            : orgId // ignore: cast_nullable_to_non_nullable
                  as int,
        formType: null == formType
            ? _value.formType
            : formType // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        synced: null == synced
            ? _value.synced
            : synced // ignore: cast_nullable_to_non_nullable
                  as bool,
        syncedAt: freezed == syncedAt
            ? _value.syncedAt
            : syncedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FormSubmissionImpl implements _FormSubmission {
  const _$FormSubmissionImpl({
    required this.id,
    required this.orgId,
    required this.formType,
    required final Map<String, dynamic> data,
    required this.createdAt,
    required this.updatedAt,
    this.synced = false,
    this.syncedAt,
  }) : _data = data;

  factory _$FormSubmissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormSubmissionImplFromJson(json);

  @override
  final int? id;
  @override
  final int orgId;
  @override
  final String formType;
  // 'common', 'vegetation', 'hydrology', 'elevation'
  final Map<String, dynamic> _data;
  // 'common', 'vegetation', 'hydrology', 'elevation'
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final bool synced;
  @override
  final DateTime? syncedAt;

  @override
  String toString() {
    return 'FormSubmission(id: $id, orgId: $orgId, formType: $formType, data: $data, createdAt: $createdAt, updatedAt: $updatedAt, synced: $synced, syncedAt: $syncedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormSubmissionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.formType, formType) ||
                other.formType == formType) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.synced, synced) || other.synced == synced) &&
            (identical(other.syncedAt, syncedAt) ||
                other.syncedAt == syncedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orgId,
    formType,
    const DeepCollectionEquality().hash(_data),
    createdAt,
    updatedAt,
    synced,
    syncedAt,
  );

  /// Create a copy of FormSubmission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormSubmissionImplCopyWith<_$FormSubmissionImpl> get copyWith =>
      __$$FormSubmissionImplCopyWithImpl<_$FormSubmissionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FormSubmissionImplToJson(this);
  }
}

abstract class _FormSubmission implements FormSubmission {
  const factory _FormSubmission({
    required final int? id,
    required final int orgId,
    required final String formType,
    required final Map<String, dynamic> data,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool synced,
    final DateTime? syncedAt,
  }) = _$FormSubmissionImpl;

  factory _FormSubmission.fromJson(Map<String, dynamic> json) =
      _$FormSubmissionImpl.fromJson;

  @override
  int? get id;
  @override
  int get orgId;
  @override
  String get formType; // 'common', 'vegetation', 'hydrology', 'elevation'
  @override
  Map<String, dynamic> get data;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  bool get synced;
  @override
  DateTime? get syncedAt;

  /// Create a copy of FormSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormSubmissionImplCopyWith<_$FormSubmissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
