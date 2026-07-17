// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_log_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivityLogEntry _$ActivityLogEntryFromJson(Map<String, dynamic> json) {
  return _ActivityLogEntry.fromJson(json);
}

/// @nodoc
mixin _$ActivityLogEntry {
  String get id => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // see ActivityType constants
  String get actorUid => throw _privateConstructorUsedError;
  String get actorName => throw _privateConstructorUsedError;
  String get actorRole => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get relatedOrderId => throw _privateConstructorUsedError;
  String? get relatedProductId => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ActivityLogEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivityLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityLogEntryCopyWith<ActivityLogEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityLogEntryCopyWith<$Res> {
  factory $ActivityLogEntryCopyWith(
          ActivityLogEntry value, $Res Function(ActivityLogEntry) then) =
      _$ActivityLogEntryCopyWithImpl<$Res, ActivityLogEntry>;
  @useResult
  $Res call(
      {String id,
      String type,
      String actorUid,
      String actorName,
      String actorRole,
      String message,
      String? relatedOrderId,
      String? relatedProductId,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$ActivityLogEntryCopyWithImpl<$Res, $Val extends ActivityLogEntry>
    implements $ActivityLogEntryCopyWith<$Res> {
  _$ActivityLogEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? actorUid = null,
    Object? actorName = null,
    Object? actorRole = null,
    Object? message = null,
    Object? relatedOrderId = freezed,
    Object? relatedProductId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      actorUid: null == actorUid
          ? _value.actorUid
          : actorUid // ignore: cast_nullable_to_non_nullable
              as String,
      actorName: null == actorName
          ? _value.actorName
          : actorName // ignore: cast_nullable_to_non_nullable
              as String,
      actorRole: null == actorRole
          ? _value.actorRole
          : actorRole // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      relatedOrderId: freezed == relatedOrderId
          ? _value.relatedOrderId
          : relatedOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedProductId: freezed == relatedProductId
          ? _value.relatedProductId
          : relatedProductId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityLogEntryImplCopyWith<$Res>
    implements $ActivityLogEntryCopyWith<$Res> {
  factory _$$ActivityLogEntryImplCopyWith(_$ActivityLogEntryImpl value,
          $Res Function(_$ActivityLogEntryImpl) then) =
      __$$ActivityLogEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String actorUid,
      String actorName,
      String actorRole,
      String message,
      String? relatedOrderId,
      String? relatedProductId,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$$ActivityLogEntryImplCopyWithImpl<$Res>
    extends _$ActivityLogEntryCopyWithImpl<$Res, _$ActivityLogEntryImpl>
    implements _$$ActivityLogEntryImplCopyWith<$Res> {
  __$$ActivityLogEntryImplCopyWithImpl(_$ActivityLogEntryImpl _value,
      $Res Function(_$ActivityLogEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? actorUid = null,
    Object? actorName = null,
    Object? actorRole = null,
    Object? message = null,
    Object? relatedOrderId = freezed,
    Object? relatedProductId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ActivityLogEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      actorUid: null == actorUid
          ? _value.actorUid
          : actorUid // ignore: cast_nullable_to_non_nullable
              as String,
      actorName: null == actorName
          ? _value.actorName
          : actorName // ignore: cast_nullable_to_non_nullable
              as String,
      actorRole: null == actorRole
          ? _value.actorRole
          : actorRole // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      relatedOrderId: freezed == relatedOrderId
          ? _value.relatedOrderId
          : relatedOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedProductId: freezed == relatedProductId
          ? _value.relatedProductId
          : relatedProductId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityLogEntryImpl implements _ActivityLogEntry {
  const _$ActivityLogEntryImpl(
      {required this.id,
      required this.type,
      required this.actorUid,
      required this.actorName,
      required this.actorRole,
      required this.message,
      this.relatedOrderId,
      this.relatedProductId,
      @TimestampConverter() this.createdAt});

  factory _$ActivityLogEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityLogEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
// see ActivityType constants
  @override
  final String actorUid;
  @override
  final String actorName;
  @override
  final String actorRole;
  @override
  final String message;
  @override
  final String? relatedOrderId;
  @override
  final String? relatedProductId;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ActivityLogEntry(id: $id, type: $type, actorUid: $actorUid, actorName: $actorName, actorRole: $actorRole, message: $message, relatedOrderId: $relatedOrderId, relatedProductId: $relatedProductId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityLogEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.actorUid, actorUid) ||
                other.actorUid == actorUid) &&
            (identical(other.actorName, actorName) ||
                other.actorName == actorName) &&
            (identical(other.actorRole, actorRole) ||
                other.actorRole == actorRole) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.relatedOrderId, relatedOrderId) ||
                other.relatedOrderId == relatedOrderId) &&
            (identical(other.relatedProductId, relatedProductId) ||
                other.relatedProductId == relatedProductId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, actorUid, actorName,
      actorRole, message, relatedOrderId, relatedProductId, createdAt);

  /// Create a copy of ActivityLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityLogEntryImplCopyWith<_$ActivityLogEntryImpl> get copyWith =>
      __$$ActivityLogEntryImplCopyWithImpl<_$ActivityLogEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityLogEntryImplToJson(
      this,
    );
  }
}

abstract class _ActivityLogEntry implements ActivityLogEntry {
  const factory _ActivityLogEntry(
          {required final String id,
          required final String type,
          required final String actorUid,
          required final String actorName,
          required final String actorRole,
          required final String message,
          final String? relatedOrderId,
          final String? relatedProductId,
          @TimestampConverter() final DateTime? createdAt}) =
      _$ActivityLogEntryImpl;

  factory _ActivityLogEntry.fromJson(Map<String, dynamic> json) =
      _$ActivityLogEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get type; // see ActivityType constants
  @override
  String get actorUid;
  @override
  String get actorName;
  @override
  String get actorRole;
  @override
  String get message;
  @override
  String? get relatedOrderId;
  @override
  String? get relatedProductId;
  @override
  @TimestampConverter()
  DateTime? get createdAt;

  /// Create a copy of ActivityLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityLogEntryImplCopyWith<_$ActivityLogEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
