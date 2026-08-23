// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoctorStats {

 int get totalOrders; num get totalSpent; num get totalDebt;@TimestampConverter() DateTime? get lastOrderAt;
/// Create a copy of DoctorStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorStatsCopyWith<DoctorStats> get copyWith => _$DoctorStatsCopyWithImpl<DoctorStats>(this as DoctorStats, _$identity);

  /// Serializes this DoctorStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorStats&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.totalSpent, totalSpent) || other.totalSpent == totalSpent)&&(identical(other.totalDebt, totalDebt) || other.totalDebt == totalDebt)&&(identical(other.lastOrderAt, lastOrderAt) || other.lastOrderAt == lastOrderAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalOrders,totalSpent,totalDebt,lastOrderAt);

@override
String toString() {
  return 'DoctorStats(totalOrders: $totalOrders, totalSpent: $totalSpent, totalDebt: $totalDebt, lastOrderAt: $lastOrderAt)';
}


}

/// @nodoc
abstract mixin class $DoctorStatsCopyWith<$Res>  {
  factory $DoctorStatsCopyWith(DoctorStats value, $Res Function(DoctorStats) _then) = _$DoctorStatsCopyWithImpl;
@useResult
$Res call({
 int totalOrders, num totalSpent, num totalDebt,@TimestampConverter() DateTime? lastOrderAt
});




}
/// @nodoc
class _$DoctorStatsCopyWithImpl<$Res>
    implements $DoctorStatsCopyWith<$Res> {
  _$DoctorStatsCopyWithImpl(this._self, this._then);

  final DoctorStats _self;
  final $Res Function(DoctorStats) _then;

/// Create a copy of DoctorStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalOrders = null,Object? totalSpent = null,Object? totalDebt = null,Object? lastOrderAt = freezed,}) {
  return _then(DoctorStats(
totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,totalSpent: null == totalSpent ? _self.totalSpent : totalSpent // ignore: cast_nullable_to_non_nullable
as num,totalDebt: null == totalDebt ? _self.totalDebt : totalDebt // ignore: cast_nullable_to_non_nullable
as num,lastOrderAt: freezed == lastOrderAt ? _self.lastOrderAt : lastOrderAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorStats].
extension DoctorStatsPatterns on DoctorStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorStats value)  $default,){
final _that = this;
switch (_that) {
case _DoctorStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorStats value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalOrders,  num totalSpent,  num totalDebt, @TimestampConverter()  DateTime? lastOrderAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorStats() when $default != null:
return $default(_that.totalOrders,_that.totalSpent,_that.totalDebt,_that.lastOrderAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalOrders,  num totalSpent,  num totalDebt, @TimestampConverter()  DateTime? lastOrderAt)  $default,) {final _that = this;
switch (_that) {
case _DoctorStats():
return $default(_that.totalOrders,_that.totalSpent,_that.totalDebt,_that.lastOrderAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalOrders,  num totalSpent,  num totalDebt, @TimestampConverter()  DateTime? lastOrderAt)?  $default,) {final _that = this;
switch (_that) {
case _DoctorStats() when $default != null:
return $default(_that.totalOrders,_that.totalSpent,_that.totalDebt,_that.lastOrderAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorStats implements DoctorStats {
  const _DoctorStats({this.totalOrders = 0, this.totalSpent = 0, this.totalDebt = 0, @TimestampConverter() this.lastOrderAt});
  factory _DoctorStats.fromJson(Map<String, dynamic> json) => _$DoctorStatsFromJson(json);

@override@JsonKey() final  int totalOrders;
@override@JsonKey() final  num totalSpent;
@override@JsonKey() final  num totalDebt;
@override@TimestampConverter() final  DateTime? lastOrderAt;

/// Create a copy of DoctorStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorStatsCopyWith<_DoctorStats> get copyWith => __$DoctorStatsCopyWithImpl<_DoctorStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorStats&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.totalSpent, totalSpent) || other.totalSpent == totalSpent)&&(identical(other.totalDebt, totalDebt) || other.totalDebt == totalDebt)&&(identical(other.lastOrderAt, lastOrderAt) || other.lastOrderAt == lastOrderAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalOrders,totalSpent,totalDebt,lastOrderAt);

@override
String toString() {
  return 'DoctorStats(totalOrders: $totalOrders, totalSpent: $totalSpent, totalDebt: $totalDebt, lastOrderAt: $lastOrderAt)';
}


}

/// @nodoc
abstract mixin class _$DoctorStatsCopyWith<$Res> implements $DoctorStatsCopyWith<$Res> {
  factory _$DoctorStatsCopyWith(_DoctorStats value, $Res Function(_DoctorStats) _then) = __$DoctorStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalOrders, num totalSpent, num totalDebt,@TimestampConverter() DateTime? lastOrderAt
});




}
/// @nodoc
class __$DoctorStatsCopyWithImpl<$Res>
    implements _$DoctorStatsCopyWith<$Res> {
  __$DoctorStatsCopyWithImpl(this._self, this._then);

  final _DoctorStats _self;
  final $Res Function(_DoctorStats) _then;

/// Create a copy of DoctorStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalOrders = null,Object? totalSpent = null,Object? totalDebt = null,Object? lastOrderAt = freezed,}) {
  return _then(_DoctorStats(
totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,totalSpent: null == totalSpent ? _self.totalSpent : totalSpent // ignore: cast_nullable_to_non_nullable
as num,totalDebt: null == totalDebt ? _self.totalDebt : totalDebt // ignore: cast_nullable_to_non_nullable
as num,lastOrderAt: freezed == lastOrderAt ? _self.lastOrderAt : lastOrderAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
