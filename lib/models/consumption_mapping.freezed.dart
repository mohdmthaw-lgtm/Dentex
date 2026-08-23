// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consumption_mapping.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConsumptionMapping {

 String get id; String get treatmentType; String get productId; String get productName; String get variantId; String get variantLabel; num get quantityPerTreatment; String get createdByUid;@TimestampConverter() DateTime? get createdAt;
/// Create a copy of ConsumptionMapping
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsumptionMappingCopyWith<ConsumptionMapping> get copyWith => _$ConsumptionMappingCopyWithImpl<ConsumptionMapping>(this as ConsumptionMapping, _$identity);

  /// Serializes this ConsumptionMapping to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsumptionMapping&&(identical(other.id, id) || other.id == id)&&(identical(other.treatmentType, treatmentType) || other.treatmentType == treatmentType)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.variantLabel, variantLabel) || other.variantLabel == variantLabel)&&(identical(other.quantityPerTreatment, quantityPerTreatment) || other.quantityPerTreatment == quantityPerTreatment)&&(identical(other.createdByUid, createdByUid) || other.createdByUid == createdByUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,treatmentType,productId,productName,variantId,variantLabel,quantityPerTreatment,createdByUid,createdAt);

@override
String toString() {
  return 'ConsumptionMapping(id: $id, treatmentType: $treatmentType, productId: $productId, productName: $productName, variantId: $variantId, variantLabel: $variantLabel, quantityPerTreatment: $quantityPerTreatment, createdByUid: $createdByUid, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ConsumptionMappingCopyWith<$Res>  {
  factory $ConsumptionMappingCopyWith(ConsumptionMapping value, $Res Function(ConsumptionMapping) _then) = _$ConsumptionMappingCopyWithImpl;
@useResult
$Res call({
 String id, String treatmentType, String productId, String productName, String variantId, String variantLabel, num quantityPerTreatment, String createdByUid,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class _$ConsumptionMappingCopyWithImpl<$Res>
    implements $ConsumptionMappingCopyWith<$Res> {
  _$ConsumptionMappingCopyWithImpl(this._self, this._then);

  final ConsumptionMapping _self;
  final $Res Function(ConsumptionMapping) _then;

/// Create a copy of ConsumptionMapping
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? treatmentType = null,Object? productId = null,Object? productName = null,Object? variantId = null,Object? variantLabel = null,Object? quantityPerTreatment = null,Object? createdByUid = null,Object? createdAt = freezed,}) {
  return _then(ConsumptionMapping(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,treatmentType: null == treatmentType ? _self.treatmentType : treatmentType // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,quantityPerTreatment: null == quantityPerTreatment ? _self.quantityPerTreatment : quantityPerTreatment // ignore: cast_nullable_to_non_nullable
as num,createdByUid: null == createdByUid ? _self.createdByUid : createdByUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsumptionMapping].
extension ConsumptionMappingPatterns on ConsumptionMapping {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsumptionMapping value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsumptionMapping() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsumptionMapping value)  $default,){
final _that = this;
switch (_that) {
case _ConsumptionMapping():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsumptionMapping value)?  $default,){
final _that = this;
switch (_that) {
case _ConsumptionMapping() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String treatmentType,  String productId,  String productName,  String variantId,  String variantLabel,  num quantityPerTreatment,  String createdByUid, @TimestampConverter()  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsumptionMapping() when $default != null:
return $default(_that.id,_that.treatmentType,_that.productId,_that.productName,_that.variantId,_that.variantLabel,_that.quantityPerTreatment,_that.createdByUid,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String treatmentType,  String productId,  String productName,  String variantId,  String variantLabel,  num quantityPerTreatment,  String createdByUid, @TimestampConverter()  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ConsumptionMapping():
return $default(_that.id,_that.treatmentType,_that.productId,_that.productName,_that.variantId,_that.variantLabel,_that.quantityPerTreatment,_that.createdByUid,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String treatmentType,  String productId,  String productName,  String variantId,  String variantLabel,  num quantityPerTreatment,  String createdByUid, @TimestampConverter()  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ConsumptionMapping() when $default != null:
return $default(_that.id,_that.treatmentType,_that.productId,_that.productName,_that.variantId,_that.variantLabel,_that.quantityPerTreatment,_that.createdByUid,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsumptionMapping implements ConsumptionMapping {
  const _ConsumptionMapping({required this.id, required this.treatmentType, required this.productId, required this.productName, required this.variantId, required this.variantLabel, this.quantityPerTreatment = 1, required this.createdByUid, @TimestampConverter() this.createdAt});
  factory _ConsumptionMapping.fromJson(Map<String, dynamic> json) => _$ConsumptionMappingFromJson(json);

@override final  String id;
@override final  String treatmentType;
@override final  String productId;
@override final  String productName;
@override final  String variantId;
@override final  String variantLabel;
@override@JsonKey() final  num quantityPerTreatment;
@override final  String createdByUid;
@override@TimestampConverter() final  DateTime? createdAt;

/// Create a copy of ConsumptionMapping
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsumptionMappingCopyWith<_ConsumptionMapping> get copyWith => __$ConsumptionMappingCopyWithImpl<_ConsumptionMapping>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsumptionMappingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsumptionMapping&&(identical(other.id, id) || other.id == id)&&(identical(other.treatmentType, treatmentType) || other.treatmentType == treatmentType)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.variantLabel, variantLabel) || other.variantLabel == variantLabel)&&(identical(other.quantityPerTreatment, quantityPerTreatment) || other.quantityPerTreatment == quantityPerTreatment)&&(identical(other.createdByUid, createdByUid) || other.createdByUid == createdByUid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,treatmentType,productId,productName,variantId,variantLabel,quantityPerTreatment,createdByUid,createdAt);

@override
String toString() {
  return 'ConsumptionMapping(id: $id, treatmentType: $treatmentType, productId: $productId, productName: $productName, variantId: $variantId, variantLabel: $variantLabel, quantityPerTreatment: $quantityPerTreatment, createdByUid: $createdByUid, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ConsumptionMappingCopyWith<$Res> implements $ConsumptionMappingCopyWith<$Res> {
  factory _$ConsumptionMappingCopyWith(_ConsumptionMapping value, $Res Function(_ConsumptionMapping) _then) = __$ConsumptionMappingCopyWithImpl;
@override @useResult
$Res call({
 String id, String treatmentType, String productId, String productName, String variantId, String variantLabel, num quantityPerTreatment, String createdByUid,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class __$ConsumptionMappingCopyWithImpl<$Res>
    implements _$ConsumptionMappingCopyWith<$Res> {
  __$ConsumptionMappingCopyWithImpl(this._self, this._then);

  final _ConsumptionMapping _self;
  final $Res Function(_ConsumptionMapping) _then;

/// Create a copy of ConsumptionMapping
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? treatmentType = null,Object? productId = null,Object? productName = null,Object? variantId = null,Object? variantLabel = null,Object? quantityPerTreatment = null,Object? createdByUid = null,Object? createdAt = freezed,}) {
  return _then(_ConsumptionMapping(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,treatmentType: null == treatmentType ? _self.treatmentType : treatmentType // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,quantityPerTreatment: null == quantityPerTreatment ? _self.quantityPerTreatment : quantityPerTreatment // ignore: cast_nullable_to_non_nullable
as num,createdByUid: null == createdByUid ? _self.createdByUid : createdByUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
