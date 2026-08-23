// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatientStats {

 num get totalPaid; num get totalDebt;
/// Create a copy of PatientStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientStatsCopyWith<PatientStats> get copyWith => _$PatientStatsCopyWithImpl<PatientStats>(this as PatientStats, _$identity);

  /// Serializes this PatientStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientStats&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalDebt, totalDebt) || other.totalDebt == totalDebt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalPaid,totalDebt);

@override
String toString() {
  return 'PatientStats(totalPaid: $totalPaid, totalDebt: $totalDebt)';
}


}

/// @nodoc
abstract mixin class $PatientStatsCopyWith<$Res>  {
  factory $PatientStatsCopyWith(PatientStats value, $Res Function(PatientStats) _then) = _$PatientStatsCopyWithImpl;
@useResult
$Res call({
 num totalPaid, num totalDebt
});




}
/// @nodoc
class _$PatientStatsCopyWithImpl<$Res>
    implements $PatientStatsCopyWith<$Res> {
  _$PatientStatsCopyWithImpl(this._self, this._then);

  final PatientStats _self;
  final $Res Function(PatientStats) _then;

/// Create a copy of PatientStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalPaid = null,Object? totalDebt = null,}) {
  return _then(PatientStats(
totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as num,totalDebt: null == totalDebt ? _self.totalDebt : totalDebt // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [PatientStats].
extension PatientStatsPatterns on PatientStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientStats value)  $default,){
final _that = this;
switch (_that) {
case _PatientStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientStats value)?  $default,){
final _that = this;
switch (_that) {
case _PatientStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( num totalPaid,  num totalDebt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientStats() when $default != null:
return $default(_that.totalPaid,_that.totalDebt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( num totalPaid,  num totalDebt)  $default,) {final _that = this;
switch (_that) {
case _PatientStats():
return $default(_that.totalPaid,_that.totalDebt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( num totalPaid,  num totalDebt)?  $default,) {final _that = this;
switch (_that) {
case _PatientStats() when $default != null:
return $default(_that.totalPaid,_that.totalDebt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatientStats implements PatientStats {
  const _PatientStats({this.totalPaid = 0, this.totalDebt = 0});
  factory _PatientStats.fromJson(Map<String, dynamic> json) => _$PatientStatsFromJson(json);

@override@JsonKey() final  num totalPaid;
@override@JsonKey() final  num totalDebt;

/// Create a copy of PatientStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientStatsCopyWith<_PatientStats> get copyWith => __$PatientStatsCopyWithImpl<_PatientStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientStats&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalDebt, totalDebt) || other.totalDebt == totalDebt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalPaid,totalDebt);

@override
String toString() {
  return 'PatientStats(totalPaid: $totalPaid, totalDebt: $totalDebt)';
}


}

/// @nodoc
abstract mixin class _$PatientStatsCopyWith<$Res> implements $PatientStatsCopyWith<$Res> {
  factory _$PatientStatsCopyWith(_PatientStats value, $Res Function(_PatientStats) _then) = __$PatientStatsCopyWithImpl;
@override @useResult
$Res call({
 num totalPaid, num totalDebt
});




}
/// @nodoc
class __$PatientStatsCopyWithImpl<$Res>
    implements _$PatientStatsCopyWith<$Res> {
  __$PatientStatsCopyWithImpl(this._self, this._then);

  final _PatientStats _self;
  final $Res Function(_PatientStats) _then;

/// Create a copy of PatientStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalPaid = null,Object? totalDebt = null,}) {
  return _then(_PatientStats(
totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as num,totalDebt: null == totalDebt ? _self.totalDebt : totalDebt // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}

// dart format on
