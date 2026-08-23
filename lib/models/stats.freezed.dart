// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GlobalStats {

 int get totalProducts; int get totalCustomers; int get totalOrdersAllTime; int get totalOrdersThisMonth; num get totalProfitAllTime; num get totalProfitThisMonth; num get totalOutstandingDebt;
/// Create a copy of GlobalStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GlobalStatsCopyWith<GlobalStats> get copyWith => _$GlobalStatsCopyWithImpl<GlobalStats>(this as GlobalStats, _$identity);

  /// Serializes this GlobalStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GlobalStats&&(identical(other.totalProducts, totalProducts) || other.totalProducts == totalProducts)&&(identical(other.totalCustomers, totalCustomers) || other.totalCustomers == totalCustomers)&&(identical(other.totalOrdersAllTime, totalOrdersAllTime) || other.totalOrdersAllTime == totalOrdersAllTime)&&(identical(other.totalOrdersThisMonth, totalOrdersThisMonth) || other.totalOrdersThisMonth == totalOrdersThisMonth)&&(identical(other.totalProfitAllTime, totalProfitAllTime) || other.totalProfitAllTime == totalProfitAllTime)&&(identical(other.totalProfitThisMonth, totalProfitThisMonth) || other.totalProfitThisMonth == totalProfitThisMonth)&&(identical(other.totalOutstandingDebt, totalOutstandingDebt) || other.totalOutstandingDebt == totalOutstandingDebt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalProducts,totalCustomers,totalOrdersAllTime,totalOrdersThisMonth,totalProfitAllTime,totalProfitThisMonth,totalOutstandingDebt);

@override
String toString() {
  return 'GlobalStats(totalProducts: $totalProducts, totalCustomers: $totalCustomers, totalOrdersAllTime: $totalOrdersAllTime, totalOrdersThisMonth: $totalOrdersThisMonth, totalProfitAllTime: $totalProfitAllTime, totalProfitThisMonth: $totalProfitThisMonth, totalOutstandingDebt: $totalOutstandingDebt)';
}


}

/// @nodoc
abstract mixin class $GlobalStatsCopyWith<$Res>  {
  factory $GlobalStatsCopyWith(GlobalStats value, $Res Function(GlobalStats) _then) = _$GlobalStatsCopyWithImpl;
@useResult
$Res call({
 int totalProducts, int totalCustomers, int totalOrdersAllTime, int totalOrdersThisMonth, num totalProfitAllTime, num totalProfitThisMonth, num totalOutstandingDebt
});




}
/// @nodoc
class _$GlobalStatsCopyWithImpl<$Res>
    implements $GlobalStatsCopyWith<$Res> {
  _$GlobalStatsCopyWithImpl(this._self, this._then);

  final GlobalStats _self;
  final $Res Function(GlobalStats) _then;

/// Create a copy of GlobalStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalProducts = null,Object? totalCustomers = null,Object? totalOrdersAllTime = null,Object? totalOrdersThisMonth = null,Object? totalProfitAllTime = null,Object? totalProfitThisMonth = null,Object? totalOutstandingDebt = null,}) {
  return _then(GlobalStats(
totalProducts: null == totalProducts ? _self.totalProducts : totalProducts // ignore: cast_nullable_to_non_nullable
as int,totalCustomers: null == totalCustomers ? _self.totalCustomers : totalCustomers // ignore: cast_nullable_to_non_nullable
as int,totalOrdersAllTime: null == totalOrdersAllTime ? _self.totalOrdersAllTime : totalOrdersAllTime // ignore: cast_nullable_to_non_nullable
as int,totalOrdersThisMonth: null == totalOrdersThisMonth ? _self.totalOrdersThisMonth : totalOrdersThisMonth // ignore: cast_nullable_to_non_nullable
as int,totalProfitAllTime: null == totalProfitAllTime ? _self.totalProfitAllTime : totalProfitAllTime // ignore: cast_nullable_to_non_nullable
as num,totalProfitThisMonth: null == totalProfitThisMonth ? _self.totalProfitThisMonth : totalProfitThisMonth // ignore: cast_nullable_to_non_nullable
as num,totalOutstandingDebt: null == totalOutstandingDebt ? _self.totalOutstandingDebt : totalOutstandingDebt // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [GlobalStats].
extension GlobalStatsPatterns on GlobalStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GlobalStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GlobalStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GlobalStats value)  $default,){
final _that = this;
switch (_that) {
case _GlobalStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GlobalStats value)?  $default,){
final _that = this;
switch (_that) {
case _GlobalStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalProducts,  int totalCustomers,  int totalOrdersAllTime,  int totalOrdersThisMonth,  num totalProfitAllTime,  num totalProfitThisMonth,  num totalOutstandingDebt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GlobalStats() when $default != null:
return $default(_that.totalProducts,_that.totalCustomers,_that.totalOrdersAllTime,_that.totalOrdersThisMonth,_that.totalProfitAllTime,_that.totalProfitThisMonth,_that.totalOutstandingDebt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalProducts,  int totalCustomers,  int totalOrdersAllTime,  int totalOrdersThisMonth,  num totalProfitAllTime,  num totalProfitThisMonth,  num totalOutstandingDebt)  $default,) {final _that = this;
switch (_that) {
case _GlobalStats():
return $default(_that.totalProducts,_that.totalCustomers,_that.totalOrdersAllTime,_that.totalOrdersThisMonth,_that.totalProfitAllTime,_that.totalProfitThisMonth,_that.totalOutstandingDebt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalProducts,  int totalCustomers,  int totalOrdersAllTime,  int totalOrdersThisMonth,  num totalProfitAllTime,  num totalProfitThisMonth,  num totalOutstandingDebt)?  $default,) {final _that = this;
switch (_that) {
case _GlobalStats() when $default != null:
return $default(_that.totalProducts,_that.totalCustomers,_that.totalOrdersAllTime,_that.totalOrdersThisMonth,_that.totalProfitAllTime,_that.totalProfitThisMonth,_that.totalOutstandingDebt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GlobalStats implements GlobalStats {
  const _GlobalStats({this.totalProducts = 0, this.totalCustomers = 0, this.totalOrdersAllTime = 0, this.totalOrdersThisMonth = 0, this.totalProfitAllTime = 0, this.totalProfitThisMonth = 0, this.totalOutstandingDebt = 0});
  factory _GlobalStats.fromJson(Map<String, dynamic> json) => _$GlobalStatsFromJson(json);

@override@JsonKey() final  int totalProducts;
@override@JsonKey() final  int totalCustomers;
@override@JsonKey() final  int totalOrdersAllTime;
@override@JsonKey() final  int totalOrdersThisMonth;
@override@JsonKey() final  num totalProfitAllTime;
@override@JsonKey() final  num totalProfitThisMonth;
@override@JsonKey() final  num totalOutstandingDebt;

/// Create a copy of GlobalStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GlobalStatsCopyWith<_GlobalStats> get copyWith => __$GlobalStatsCopyWithImpl<_GlobalStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GlobalStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GlobalStats&&(identical(other.totalProducts, totalProducts) || other.totalProducts == totalProducts)&&(identical(other.totalCustomers, totalCustomers) || other.totalCustomers == totalCustomers)&&(identical(other.totalOrdersAllTime, totalOrdersAllTime) || other.totalOrdersAllTime == totalOrdersAllTime)&&(identical(other.totalOrdersThisMonth, totalOrdersThisMonth) || other.totalOrdersThisMonth == totalOrdersThisMonth)&&(identical(other.totalProfitAllTime, totalProfitAllTime) || other.totalProfitAllTime == totalProfitAllTime)&&(identical(other.totalProfitThisMonth, totalProfitThisMonth) || other.totalProfitThisMonth == totalProfitThisMonth)&&(identical(other.totalOutstandingDebt, totalOutstandingDebt) || other.totalOutstandingDebt == totalOutstandingDebt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalProducts,totalCustomers,totalOrdersAllTime,totalOrdersThisMonth,totalProfitAllTime,totalProfitThisMonth,totalOutstandingDebt);

@override
String toString() {
  return 'GlobalStats(totalProducts: $totalProducts, totalCustomers: $totalCustomers, totalOrdersAllTime: $totalOrdersAllTime, totalOrdersThisMonth: $totalOrdersThisMonth, totalProfitAllTime: $totalProfitAllTime, totalProfitThisMonth: $totalProfitThisMonth, totalOutstandingDebt: $totalOutstandingDebt)';
}


}

/// @nodoc
abstract mixin class _$GlobalStatsCopyWith<$Res> implements $GlobalStatsCopyWith<$Res> {
  factory _$GlobalStatsCopyWith(_GlobalStats value, $Res Function(_GlobalStats) _then) = __$GlobalStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalProducts, int totalCustomers, int totalOrdersAllTime, int totalOrdersThisMonth, num totalProfitAllTime, num totalProfitThisMonth, num totalOutstandingDebt
});




}
/// @nodoc
class __$GlobalStatsCopyWithImpl<$Res>
    implements _$GlobalStatsCopyWith<$Res> {
  __$GlobalStatsCopyWithImpl(this._self, this._then);

  final _GlobalStats _self;
  final $Res Function(_GlobalStats) _then;

/// Create a copy of GlobalStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalProducts = null,Object? totalCustomers = null,Object? totalOrdersAllTime = null,Object? totalOrdersThisMonth = null,Object? totalProfitAllTime = null,Object? totalProfitThisMonth = null,Object? totalOutstandingDebt = null,}) {
  return _then(_GlobalStats(
totalProducts: null == totalProducts ? _self.totalProducts : totalProducts // ignore: cast_nullable_to_non_nullable
as int,totalCustomers: null == totalCustomers ? _self.totalCustomers : totalCustomers // ignore: cast_nullable_to_non_nullable
as int,totalOrdersAllTime: null == totalOrdersAllTime ? _self.totalOrdersAllTime : totalOrdersAllTime // ignore: cast_nullable_to_non_nullable
as int,totalOrdersThisMonth: null == totalOrdersThisMonth ? _self.totalOrdersThisMonth : totalOrdersThisMonth // ignore: cast_nullable_to_non_nullable
as int,totalProfitAllTime: null == totalProfitAllTime ? _self.totalProfitAllTime : totalProfitAllTime // ignore: cast_nullable_to_non_nullable
as num,totalProfitThisMonth: null == totalProfitThisMonth ? _self.totalProfitThisMonth : totalProfitThisMonth // ignore: cast_nullable_to_non_nullable
as num,totalOutstandingDebt: null == totalOutstandingDebt ? _self.totalOutstandingDebt : totalOutstandingDebt // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}


/// @nodoc
mixin _$MonthlyProfit {

 String get monthKey; num get totalProfit; int get totalOrders; num get totalRevenue;
/// Create a copy of MonthlyProfit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthlyProfitCopyWith<MonthlyProfit> get copyWith => _$MonthlyProfitCopyWithImpl<MonthlyProfit>(this as MonthlyProfit, _$identity);

  /// Serializes this MonthlyProfit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthlyProfit&&(identical(other.monthKey, monthKey) || other.monthKey == monthKey)&&(identical(other.totalProfit, totalProfit) || other.totalProfit == totalProfit)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,monthKey,totalProfit,totalOrders,totalRevenue);

@override
String toString() {
  return 'MonthlyProfit(monthKey: $monthKey, totalProfit: $totalProfit, totalOrders: $totalOrders, totalRevenue: $totalRevenue)';
}


}

/// @nodoc
abstract mixin class $MonthlyProfitCopyWith<$Res>  {
  factory $MonthlyProfitCopyWith(MonthlyProfit value, $Res Function(MonthlyProfit) _then) = _$MonthlyProfitCopyWithImpl;
@useResult
$Res call({
 String monthKey, num totalProfit, int totalOrders, num totalRevenue
});




}
/// @nodoc
class _$MonthlyProfitCopyWithImpl<$Res>
    implements $MonthlyProfitCopyWith<$Res> {
  _$MonthlyProfitCopyWithImpl(this._self, this._then);

  final MonthlyProfit _self;
  final $Res Function(MonthlyProfit) _then;

/// Create a copy of MonthlyProfit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? monthKey = null,Object? totalProfit = null,Object? totalOrders = null,Object? totalRevenue = null,}) {
  return _then(MonthlyProfit(
monthKey: null == monthKey ? _self.monthKey : monthKey // ignore: cast_nullable_to_non_nullable
as String,totalProfit: null == totalProfit ? _self.totalProfit : totalProfit // ignore: cast_nullable_to_non_nullable
as num,totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [MonthlyProfit].
extension MonthlyProfitPatterns on MonthlyProfit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthlyProfit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthlyProfit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthlyProfit value)  $default,){
final _that = this;
switch (_that) {
case _MonthlyProfit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthlyProfit value)?  $default,){
final _that = this;
switch (_that) {
case _MonthlyProfit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String monthKey,  num totalProfit,  int totalOrders,  num totalRevenue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthlyProfit() when $default != null:
return $default(_that.monthKey,_that.totalProfit,_that.totalOrders,_that.totalRevenue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String monthKey,  num totalProfit,  int totalOrders,  num totalRevenue)  $default,) {final _that = this;
switch (_that) {
case _MonthlyProfit():
return $default(_that.monthKey,_that.totalProfit,_that.totalOrders,_that.totalRevenue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String monthKey,  num totalProfit,  int totalOrders,  num totalRevenue)?  $default,) {final _that = this;
switch (_that) {
case _MonthlyProfit() when $default != null:
return $default(_that.monthKey,_that.totalProfit,_that.totalOrders,_that.totalRevenue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MonthlyProfit implements MonthlyProfit {
  const _MonthlyProfit({required this.monthKey, this.totalProfit = 0, this.totalOrders = 0, this.totalRevenue = 0});
  factory _MonthlyProfit.fromJson(Map<String, dynamic> json) => _$MonthlyProfitFromJson(json);

@override final  String monthKey;
@override@JsonKey() final  num totalProfit;
@override@JsonKey() final  int totalOrders;
@override@JsonKey() final  num totalRevenue;

/// Create a copy of MonthlyProfit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthlyProfitCopyWith<_MonthlyProfit> get copyWith => __$MonthlyProfitCopyWithImpl<_MonthlyProfit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonthlyProfitToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthlyProfit&&(identical(other.monthKey, monthKey) || other.monthKey == monthKey)&&(identical(other.totalProfit, totalProfit) || other.totalProfit == totalProfit)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,monthKey,totalProfit,totalOrders,totalRevenue);

@override
String toString() {
  return 'MonthlyProfit(monthKey: $monthKey, totalProfit: $totalProfit, totalOrders: $totalOrders, totalRevenue: $totalRevenue)';
}


}

/// @nodoc
abstract mixin class _$MonthlyProfitCopyWith<$Res> implements $MonthlyProfitCopyWith<$Res> {
  factory _$MonthlyProfitCopyWith(_MonthlyProfit value, $Res Function(_MonthlyProfit) _then) = __$MonthlyProfitCopyWithImpl;
@override @useResult
$Res call({
 String monthKey, num totalProfit, int totalOrders, num totalRevenue
});




}
/// @nodoc
class __$MonthlyProfitCopyWithImpl<$Res>
    implements _$MonthlyProfitCopyWith<$Res> {
  __$MonthlyProfitCopyWithImpl(this._self, this._then);

  final _MonthlyProfit _self;
  final $Res Function(_MonthlyProfit) _then;

/// Create a copy of MonthlyProfit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? monthKey = null,Object? totalProfit = null,Object? totalOrders = null,Object? totalRevenue = null,}) {
  return _then(_MonthlyProfit(
monthKey: null == monthKey ? _self.monthKey : monthKey // ignore: cast_nullable_to_non_nullable
as String,totalProfit: null == totalProfit ? _self.totalProfit : totalProfit // ignore: cast_nullable_to_non_nullable
as num,totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}

// dart format on
