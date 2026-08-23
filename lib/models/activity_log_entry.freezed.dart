// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_log_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityLogEntry {

 String get id; String get type; String get actorUid; String get actorName; String get actorRole; String get message; String? get relatedOrderId; String? get relatedProductId;@TimestampConverter() DateTime? get createdAt;
/// Create a copy of ActivityLogEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityLogEntryCopyWith<ActivityLogEntry> get copyWith => _$ActivityLogEntryCopyWithImpl<ActivityLogEntry>(this as ActivityLogEntry, _$identity);

  /// Serializes this ActivityLogEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityLogEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.actorUid, actorUid) || other.actorUid == actorUid)&&(identical(other.actorName, actorName) || other.actorName == actorName)&&(identical(other.actorRole, actorRole) || other.actorRole == actorRole)&&(identical(other.message, message) || other.message == message)&&(identical(other.relatedOrderId, relatedOrderId) || other.relatedOrderId == relatedOrderId)&&(identical(other.relatedProductId, relatedProductId) || other.relatedProductId == relatedProductId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,actorUid,actorName,actorRole,message,relatedOrderId,relatedProductId,createdAt);

@override
String toString() {
  return 'ActivityLogEntry(id: $id, type: $type, actorUid: $actorUid, actorName: $actorName, actorRole: $actorRole, message: $message, relatedOrderId: $relatedOrderId, relatedProductId: $relatedProductId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ActivityLogEntryCopyWith<$Res>  {
  factory $ActivityLogEntryCopyWith(ActivityLogEntry value, $Res Function(ActivityLogEntry) _then) = _$ActivityLogEntryCopyWithImpl;
@useResult
$Res call({
 String id, String type, String actorUid, String actorName, String actorRole, String message, String? relatedOrderId, String? relatedProductId,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class _$ActivityLogEntryCopyWithImpl<$Res>
    implements $ActivityLogEntryCopyWith<$Res> {
  _$ActivityLogEntryCopyWithImpl(this._self, this._then);

  final ActivityLogEntry _self;
  final $Res Function(ActivityLogEntry) _then;

/// Create a copy of ActivityLogEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? actorUid = null,Object? actorName = null,Object? actorRole = null,Object? message = null,Object? relatedOrderId = freezed,Object? relatedProductId = freezed,Object? createdAt = freezed,}) {
  return _then(ActivityLogEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,actorUid: null == actorUid ? _self.actorUid : actorUid // ignore: cast_nullable_to_non_nullable
as String,actorName: null == actorName ? _self.actorName : actorName // ignore: cast_nullable_to_non_nullable
as String,actorRole: null == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,relatedOrderId: freezed == relatedOrderId ? _self.relatedOrderId : relatedOrderId // ignore: cast_nullable_to_non_nullable
as String?,relatedProductId: freezed == relatedProductId ? _self.relatedProductId : relatedProductId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityLogEntry].
extension ActivityLogEntryPatterns on ActivityLogEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityLogEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityLogEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityLogEntry value)  $default,){
final _that = this;
switch (_that) {
case _ActivityLogEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityLogEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityLogEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String actorUid,  String actorName,  String actorRole,  String message,  String? relatedOrderId,  String? relatedProductId, @TimestampConverter()  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityLogEntry() when $default != null:
return $default(_that.id,_that.type,_that.actorUid,_that.actorName,_that.actorRole,_that.message,_that.relatedOrderId,_that.relatedProductId,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String actorUid,  String actorName,  String actorRole,  String message,  String? relatedOrderId,  String? relatedProductId, @TimestampConverter()  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ActivityLogEntry():
return $default(_that.id,_that.type,_that.actorUid,_that.actorName,_that.actorRole,_that.message,_that.relatedOrderId,_that.relatedProductId,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String actorUid,  String actorName,  String actorRole,  String message,  String? relatedOrderId,  String? relatedProductId, @TimestampConverter()  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ActivityLogEntry() when $default != null:
return $default(_that.id,_that.type,_that.actorUid,_that.actorName,_that.actorRole,_that.message,_that.relatedOrderId,_that.relatedProductId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivityLogEntry implements ActivityLogEntry {
  const _ActivityLogEntry({required this.id, required this.type, required this.actorUid, required this.actorName, required this.actorRole, required this.message, this.relatedOrderId, this.relatedProductId, @TimestampConverter() this.createdAt});
  factory _ActivityLogEntry.fromJson(Map<String, dynamic> json) => _$ActivityLogEntryFromJson(json);

@override final  String id;
@override final  String type;
@override final  String actorUid;
@override final  String actorName;
@override final  String actorRole;
@override final  String message;
@override final  String? relatedOrderId;
@override final  String? relatedProductId;
@override@TimestampConverter() final  DateTime? createdAt;

/// Create a copy of ActivityLogEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityLogEntryCopyWith<_ActivityLogEntry> get copyWith => __$ActivityLogEntryCopyWithImpl<_ActivityLogEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityLogEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityLogEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.actorUid, actorUid) || other.actorUid == actorUid)&&(identical(other.actorName, actorName) || other.actorName == actorName)&&(identical(other.actorRole, actorRole) || other.actorRole == actorRole)&&(identical(other.message, message) || other.message == message)&&(identical(other.relatedOrderId, relatedOrderId) || other.relatedOrderId == relatedOrderId)&&(identical(other.relatedProductId, relatedProductId) || other.relatedProductId == relatedProductId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,actorUid,actorName,actorRole,message,relatedOrderId,relatedProductId,createdAt);

@override
String toString() {
  return 'ActivityLogEntry(id: $id, type: $type, actorUid: $actorUid, actorName: $actorName, actorRole: $actorRole, message: $message, relatedOrderId: $relatedOrderId, relatedProductId: $relatedProductId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ActivityLogEntryCopyWith<$Res> implements $ActivityLogEntryCopyWith<$Res> {
  factory _$ActivityLogEntryCopyWith(_ActivityLogEntry value, $Res Function(_ActivityLogEntry) _then) = __$ActivityLogEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String actorUid, String actorName, String actorRole, String message, String? relatedOrderId, String? relatedProductId,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class __$ActivityLogEntryCopyWithImpl<$Res>
    implements _$ActivityLogEntryCopyWith<$Res> {
  __$ActivityLogEntryCopyWithImpl(this._self, this._then);

  final _ActivityLogEntry _self;
  final $Res Function(_ActivityLogEntry) _then;

/// Create a copy of ActivityLogEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? actorUid = null,Object? actorName = null,Object? actorRole = null,Object? message = null,Object? relatedOrderId = freezed,Object? relatedProductId = freezed,Object? createdAt = freezed,}) {
  return _then(_ActivityLogEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,actorUid: null == actorUid ? _self.actorUid : actorUid // ignore: cast_nullable_to_non_nullable
as String,actorName: null == actorName ? _self.actorName : actorName // ignore: cast_nullable_to_non_nullable
as String,actorRole: null == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,relatedOrderId: freezed == relatedOrderId ? _self.relatedOrderId : relatedOrderId // ignore: cast_nullable_to_non_nullable
as String?,relatedProductId: freezed == relatedProductId ? _self.relatedProductId : relatedProductId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
