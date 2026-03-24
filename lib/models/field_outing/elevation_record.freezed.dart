// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'elevation_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ElevationRecord _$ElevationRecordFromJson(Map<String, dynamic> json) {
  return _ElevationRecord.fromJson(json);
}

/// @nodoc
mixin _$ElevationRecord {
  int? get id => throw _privateConstructorUsedError;
  String? get localId => throw _privateConstructorUsedError;
  int? get serverId => throw _privateConstructorUsedError;
  int get outingId => throw _privateConstructorUsedError;
  String get transectId => throw _privateConstructorUsedError;
  int get pointNumber => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get elevationNavd88M => throw _privateConstructorUsedError;
  String? get featureType => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ElevationRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ElevationRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ElevationRecordCopyWith<ElevationRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElevationRecordCopyWith<$Res> {
  factory $ElevationRecordCopyWith(
    ElevationRecord value,
    $Res Function(ElevationRecord) then,
  ) = _$ElevationRecordCopyWithImpl<$Res, ElevationRecord>;
  @useResult
  $Res call({
    int? id,
    String? localId,
    int? serverId,
    int outingId,
    String transectId,
    int pointNumber,
    double latitude,
    double longitude,
    double elevationNavd88M,
    String? featureType,
    String? notes,
    String syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$ElevationRecordCopyWithImpl<$Res, $Val extends ElevationRecord>
    implements $ElevationRecordCopyWith<$Res> {
  _$ElevationRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ElevationRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? localId = freezed,
    Object? serverId = freezed,
    Object? outingId = null,
    Object? transectId = null,
    Object? pointNumber = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? elevationNavd88M = null,
    Object? featureType = freezed,
    Object? notes = freezed,
    Object? syncStatus = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            localId: freezed == localId
                ? _value.localId
                : localId // ignore: cast_nullable_to_non_nullable
                      as String?,
            serverId: freezed == serverId
                ? _value.serverId
                : serverId // ignore: cast_nullable_to_non_nullable
                      as int?,
            outingId: null == outingId
                ? _value.outingId
                : outingId // ignore: cast_nullable_to_non_nullable
                      as int,
            transectId: null == transectId
                ? _value.transectId
                : transectId // ignore: cast_nullable_to_non_nullable
                      as String,
            pointNumber: null == pointNumber
                ? _value.pointNumber
                : pointNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            elevationNavd88M: null == elevationNavd88M
                ? _value.elevationNavd88M
                : elevationNavd88M // ignore: cast_nullable_to_non_nullable
                      as double,
            featureType: freezed == featureType
                ? _value.featureType
                : featureType // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            syncStatus: null == syncStatus
                ? _value.syncStatus
                : syncStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ElevationRecordImplCopyWith<$Res>
    implements $ElevationRecordCopyWith<$Res> {
  factory _$$ElevationRecordImplCopyWith(
    _$ElevationRecordImpl value,
    $Res Function(_$ElevationRecordImpl) then,
  ) = __$$ElevationRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? localId,
    int? serverId,
    int outingId,
    String transectId,
    int pointNumber,
    double latitude,
    double longitude,
    double elevationNavd88M,
    String? featureType,
    String? notes,
    String syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$ElevationRecordImplCopyWithImpl<$Res>
    extends _$ElevationRecordCopyWithImpl<$Res, _$ElevationRecordImpl>
    implements _$$ElevationRecordImplCopyWith<$Res> {
  __$$ElevationRecordImplCopyWithImpl(
    _$ElevationRecordImpl _value,
    $Res Function(_$ElevationRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ElevationRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? localId = freezed,
    Object? serverId = freezed,
    Object? outingId = null,
    Object? transectId = null,
    Object? pointNumber = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? elevationNavd88M = null,
    Object? featureType = freezed,
    Object? notes = freezed,
    Object? syncStatus = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ElevationRecordImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        localId: freezed == localId
            ? _value.localId
            : localId // ignore: cast_nullable_to_non_nullable
                  as String?,
        serverId: freezed == serverId
            ? _value.serverId
            : serverId // ignore: cast_nullable_to_non_nullable
                  as int?,
        outingId: null == outingId
            ? _value.outingId
            : outingId // ignore: cast_nullable_to_non_nullable
                  as int,
        transectId: null == transectId
            ? _value.transectId
            : transectId // ignore: cast_nullable_to_non_nullable
                  as String,
        pointNumber: null == pointNumber
            ? _value.pointNumber
            : pointNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        elevationNavd88M: null == elevationNavd88M
            ? _value.elevationNavd88M
            : elevationNavd88M // ignore: cast_nullable_to_non_nullable
                  as double,
        featureType: freezed == featureType
            ? _value.featureType
            : featureType // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        syncStatus: null == syncStatus
            ? _value.syncStatus
            : syncStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ElevationRecordImpl implements _ElevationRecord {
  const _$ElevationRecordImpl({
    this.id,
    this.localId,
    this.serverId,
    required this.outingId,
    required this.transectId,
    required this.pointNumber,
    required this.latitude,
    required this.longitude,
    required this.elevationNavd88M,
    this.featureType,
    this.notes,
    this.syncStatus = 'pending',
    this.createdAt,
    this.updatedAt,
  });

  factory _$ElevationRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElevationRecordImplFromJson(json);

  @override
  final int? id;
  @override
  final String? localId;
  @override
  final int? serverId;
  @override
  final int outingId;
  @override
  final String transectId;
  @override
  final int pointNumber;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double elevationNavd88M;
  @override
  final String? featureType;
  @override
  final String? notes;
  @override
  @JsonKey()
  final String syncStatus;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ElevationRecord(id: $id, localId: $localId, serverId: $serverId, outingId: $outingId, transectId: $transectId, pointNumber: $pointNumber, latitude: $latitude, longitude: $longitude, elevationNavd88M: $elevationNavd88M, featureType: $featureType, notes: $notes, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElevationRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.outingId, outingId) ||
                other.outingId == outingId) &&
            (identical(other.transectId, transectId) ||
                other.transectId == transectId) &&
            (identical(other.pointNumber, pointNumber) ||
                other.pointNumber == pointNumber) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.elevationNavd88M, elevationNavd88M) ||
                other.elevationNavd88M == elevationNavd88M) &&
            (identical(other.featureType, featureType) ||
                other.featureType == featureType) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    localId,
    serverId,
    outingId,
    transectId,
    pointNumber,
    latitude,
    longitude,
    elevationNavd88M,
    featureType,
    notes,
    syncStatus,
    createdAt,
    updatedAt,
  );

  /// Create a copy of ElevationRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ElevationRecordImplCopyWith<_$ElevationRecordImpl> get copyWith =>
      __$$ElevationRecordImplCopyWithImpl<_$ElevationRecordImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ElevationRecordImplToJson(this);
  }
}

abstract class _ElevationRecord implements ElevationRecord {
  const factory _ElevationRecord({
    final int? id,
    final String? localId,
    final int? serverId,
    required final int outingId,
    required final String transectId,
    required final int pointNumber,
    required final double latitude,
    required final double longitude,
    required final double elevationNavd88M,
    final String? featureType,
    final String? notes,
    final String syncStatus,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$ElevationRecordImpl;

  factory _ElevationRecord.fromJson(Map<String, dynamic> json) =
      _$ElevationRecordImpl.fromJson;

  @override
  int? get id;
  @override
  String? get localId;
  @override
  int? get serverId;
  @override
  int get outingId;
  @override
  String get transectId;
  @override
  int get pointNumber;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get elevationNavd88M;
  @override
  String? get featureType;
  @override
  String? get notes;
  @override
  String get syncStatus;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of ElevationRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ElevationRecordImplCopyWith<_$ElevationRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
