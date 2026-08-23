// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medical_center.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MedicalCenter {

 String get id; String get name; int get chairCount; List<String> get memberUids; Map<String, String> get memberNames; String get managerUid;@TimestampConverter() DateTime? get createdAt;
/// Create a copy of MedicalCenter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicalCenterCopyWith<MedicalCenter> get copyWith => _$MedicalCenterCopyWithImpl<MedicalCenter>(this as MedicalCenter, _$identity);

  /// Serializes this MedicalCenter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicalCenter&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.chairCount, chairCount) || other.chairCount == chairCount)&&const DeepCollectionEquality().equals(other.memberUids, memberUids)&&const DeepCollectionEquality().equals(other.memberNames, memberNames)&&(identical(other.managerUid, managerUid) || other.managerUid == managerUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,chairCount,const DeepCollectionEquality().hash(memberUids),const DeepCollectionEquality().hash(memberNames),managerUid,createdAt);

@override
String toString() {
  return 'MedicalCenter(id: $id, name: $name, chairCount: $chairCount, memberUids: $memberUids, memberNames: $memberNames, managerUid: $managerUid, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MedicalCenterCopyWith<$Res>  {
  factory $MedicalCenterCopyWith(MedicalCenter value, $Res Function(MedicalCenter) _then) = _$MedicalCenterCopyWithImpl;
@useResult
$Res call({
 String id, String name, int chairCount, List<String> memberUids, Map<String, String> memberNames, String managerUid,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class _$MedicalCenterCopyWithImpl<$Res>
    implements $MedicalCenterCopyWith<$Res> {
  _$MedicalCenterCopyWithImpl(this._self, this._then);

  final MedicalCenter _self;
  final $Res Function(MedicalCenter) _then;

/// Create a copy of MedicalCenter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? chairCount = null,Object? memberUids = null,Object? memberNames = null,Object? managerUid = null,Object? createdAt = freezed,}) {
  return _then(MedicalCenter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,chairCount: null == chairCount ? _self.chairCount : chairCount // ignore: cast_nullable_to_non_nullable
as int,memberUids: null == memberUids ? _self.memberUids : memberUids // ignore: cast_nullable_to_non_nullable
as List<String>,memberNames: null == memberNames ? _self.memberNames : memberNames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,managerUid: null == managerUid ? _self.managerUid : managerUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicalCenter].
extension MedicalCenterPatterns on MedicalCenter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicalCenter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicalCenter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicalCenter value)  $default,){
final _that = this;
switch (_that) {
case _MedicalCenter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicalCenter value)?  $default,){
final _that = this;
switch (_that) {
case _MedicalCenter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int chairCount,  List<String> memberUids,  Map<String, String> memberNames,  String managerUid, @TimestampConverter()  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicalCenter() when $default != null:
return $default(_that.id,_that.name,_that.chairCount,_that.memberUids,_that.memberNames,_that.managerUid,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int chairCount,  List<String> memberUids,  Map<String, String> memberNames,  String managerUid, @TimestampConverter()  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _MedicalCenter():
return $default(_that.id,_that.name,_that.chairCount,_that.memberUids,_that.memberNames,_that.managerUid,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int chairCount,  List<String> memberUids,  Map<String, String> memberNames,  String managerUid, @TimestampConverter()  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MedicalCenter() when $default != null:
return $default(_that.id,_that.name,_that.chairCount,_that.memberUids,_that.memberNames,_that.managerUid,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicalCenter implements MedicalCenter {
  const _MedicalCenter({required this.id, required this.name, this.chairCount = 1,  List<String> memberUids = const <String>[],  Map<String, String> memberNames = const <String, String>{}, required this.managerUid, @TimestampConverter() this.createdAt}): _memberUids = memberUids,_memberNames = memberNames;
  factory _MedicalCenter.fromJson(Map<String, dynamic> json) => _$MedicalCenterFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  int chairCount;
 final  List<String> _memberUids;
@override@JsonKey() List<String> get memberUids {
  if (_memberUids is EqualUnmodifiableListView) return _memberUids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberUids);
}

 final  Map<String, String> _memberNames;
@override@JsonKey() Map<String, String> get memberNames {
  if (_memberNames is EqualUnmodifiableMapView) return _memberNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_memberNames);
}

@override final  String managerUid;
@override@TimestampConverter() final  DateTime? createdAt;

/// Create a copy of MedicalCenter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicalCenterCopyWith<_MedicalCenter> get copyWith => __$MedicalCenterCopyWithImpl<_MedicalCenter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicalCenterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicalCenter&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.chairCount, chairCount) || other.chairCount == chairCount)&&const DeepCollectionEquality().equals(other._memberUids, _memberUids)&&const DeepCollectionEquality().equals(other._memberNames, _memberNames)&&(identical(other.managerUid, managerUid) || other.managerUid == managerUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,chairCount,const DeepCollectionEquality().hash(_memberUids),const DeepCollectionEquality().hash(_memberNames),managerUid,createdAt);

@override
String toString() {
  return 'MedicalCenter(id: $id, name: $name, chairCount: $chairCount, memberUids: $memberUids, memberNames: $memberNames, managerUid: $managerUid, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MedicalCenterCopyWith<$Res> implements $MedicalCenterCopyWith<$Res> {
  factory _$MedicalCenterCopyWith(_MedicalCenter value, $Res Function(_MedicalCenter) _then) = __$MedicalCenterCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int chairCount, List<String> memberUids, Map<String, String> memberNames, String managerUid,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class __$MedicalCenterCopyWithImpl<$Res>
    implements _$MedicalCenterCopyWith<$Res> {
  __$MedicalCenterCopyWithImpl(this._self, this._then);

  final _MedicalCenter _self;
  final $Res Function(_MedicalCenter) _then;

/// Create a copy of MedicalCenter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? chairCount = null,Object? memberUids = null,Object? memberNames = null,Object? managerUid = null,Object? createdAt = freezed,}) {
  return _then(_MedicalCenter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,chairCount: null == chairCount ? _self.chairCount : chairCount // ignore: cast_nullable_to_non_nullable
as int,memberUids: null == memberUids ? _self._memberUids : memberUids // ignore: cast_nullable_to_non_nullable
as List<String>,memberNames: null == memberNames ? _self._memberNames : memberNames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,managerUid: null == managerUid ? _self.managerUid : managerUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
