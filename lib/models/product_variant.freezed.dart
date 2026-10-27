// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductVariant {

 String get id; String get label; num get sellPrice; int get quantity; int get totalSold; String get imageUrl; String get imagePath; num? get diameterMm; num? get totalLengthMm; String get roughness; String get productName;@TimestampConverter() DateTime? get createdAt;@TimestampConverter() DateTime? get updatedAt;
/// Create a copy of ProductVariant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductVariantCopyWith<ProductVariant> get copyWith => _$ProductVariantCopyWithImpl<ProductVariant>(this as ProductVariant, _$identity);

  /// Serializes this ProductVariant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.sellPrice, sellPrice) || other.sellPrice == sellPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalSold, totalSold) || other.totalSold == totalSold)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.diameterMm, diameterMm) || other.diameterMm == diameterMm)&&(identical(other.totalLengthMm, totalLengthMm) || other.totalLengthMm == totalLengthMm)&&(identical(other.roughness, roughness) || other.roughness == roughness)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,sellPrice,quantity,totalSold,imageUrl,imagePath,diameterMm,totalLengthMm,roughness,productName,createdAt,updatedAt);

@override
String toString() {
  return 'ProductVariant(id: $id, label: $label, sellPrice: $sellPrice, quantity: $quantity, totalSold: $totalSold, imageUrl: $imageUrl, imagePath: $imagePath, diameterMm: $diameterMm, totalLengthMm: $totalLengthMm, roughness: $roughness, productName: $productName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProductVariantCopyWith<$Res>  {
  factory $ProductVariantCopyWith(ProductVariant value, $Res Function(ProductVariant) _then) = _$ProductVariantCopyWithImpl;
@useResult
$Res call({
 String id, String label, num sellPrice, int quantity, int totalSold, String imageUrl, String imagePath, num? diameterMm, num? totalLengthMm, String roughness, String productName,@TimestampConverter() DateTime? createdAt,@TimestampConverter() DateTime? updatedAt
});




}
/// @nodoc
class _$ProductVariantCopyWithImpl<$Res>
    implements $ProductVariantCopyWith<$Res> {
  _$ProductVariantCopyWithImpl(this._self, this._then);

  final ProductVariant _self;
  final $Res Function(ProductVariant) _then;

/// Create a copy of ProductVariant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? sellPrice = null,Object? quantity = null,Object? totalSold = null,Object? imageUrl = null,Object? imagePath = null,Object? diameterMm = freezed,Object? totalLengthMm = freezed,Object? roughness = null,Object? productName = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(ProductVariant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,sellPrice: null == sellPrice ? _self.sellPrice : sellPrice // ignore: cast_nullable_to_non_nullable
as num,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,totalSold: null == totalSold ? _self.totalSold : totalSold // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,diameterMm: freezed == diameterMm ? _self.diameterMm : diameterMm // ignore: cast_nullable_to_non_nullable
as num?,totalLengthMm: freezed == totalLengthMm ? _self.totalLengthMm : totalLengthMm // ignore: cast_nullable_to_non_nullable
as num?,roughness: null == roughness ? _self.roughness : roughness // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductVariant].
extension ProductVariantPatterns on ProductVariant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductVariant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductVariant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductVariant value)  $default,){
final _that = this;
switch (_that) {
case _ProductVariant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductVariant value)?  $default,){
final _that = this;
switch (_that) {
case _ProductVariant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  num sellPrice,  int quantity,  int totalSold,  String imageUrl,  String imagePath,  num? diameterMm,  num? totalLengthMm,  String roughness,  String productName, @TimestampConverter()  DateTime? createdAt, @TimestampConverter()  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductVariant() when $default != null:
return $default(_that.id,_that.label,_that.sellPrice,_that.quantity,_that.totalSold,_that.imageUrl,_that.imagePath,_that.diameterMm,_that.totalLengthMm,_that.roughness,_that.productName,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  num sellPrice,  int quantity,  int totalSold,  String imageUrl,  String imagePath,  num? diameterMm,  num? totalLengthMm,  String roughness,  String productName, @TimestampConverter()  DateTime? createdAt, @TimestampConverter()  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProductVariant():
return $default(_that.id,_that.label,_that.sellPrice,_that.quantity,_that.totalSold,_that.imageUrl,_that.imagePath,_that.diameterMm,_that.totalLengthMm,_that.roughness,_that.productName,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  num sellPrice,  int quantity,  int totalSold,  String imageUrl,  String imagePath,  num? diameterMm,  num? totalLengthMm,  String roughness,  String productName, @TimestampConverter()  DateTime? createdAt, @TimestampConverter()  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProductVariant() when $default != null:
return $default(_that.id,_that.label,_that.sellPrice,_that.quantity,_that.totalSold,_that.imageUrl,_that.imagePath,_that.diameterMm,_that.totalLengthMm,_that.roughness,_that.productName,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductVariant implements ProductVariant {
  const _ProductVariant({required this.id, required this.label, required this.sellPrice, this.quantity = 0, this.totalSold = 0, this.imageUrl = '', this.imagePath = '', this.diameterMm, this.totalLengthMm, this.roughness = '', this.productName = '', @TimestampConverter() this.createdAt, @TimestampConverter() this.updatedAt});
  factory _ProductVariant.fromJson(Map<String, dynamic> json) => _$ProductVariantFromJson(json);

@override final  String id;
@override final  String label;
@override final  num sellPrice;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  int totalSold;
@override@JsonKey() final  String imageUrl;
@override@JsonKey() final  String imagePath;
@override final  num? diameterMm;
@override final  num? totalLengthMm;
@override@JsonKey() final  String roughness;
@override@JsonKey() final  String productName;
@override@TimestampConverter() final  DateTime? createdAt;
@override@TimestampConverter() final  DateTime? updatedAt;

/// Create a copy of ProductVariant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductVariantCopyWith<_ProductVariant> get copyWith => __$ProductVariantCopyWithImpl<_ProductVariant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductVariantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.sellPrice, sellPrice) || other.sellPrice == sellPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalSold, totalSold) || other.totalSold == totalSold)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.diameterMm, diameterMm) || other.diameterMm == diameterMm)&&(identical(other.totalLengthMm, totalLengthMm) || other.totalLengthMm == totalLengthMm)&&(identical(other.roughness, roughness) || other.roughness == roughness)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,sellPrice,quantity,totalSold,imageUrl,imagePath,diameterMm,totalLengthMm,roughness,productName,createdAt,updatedAt);

@override
String toString() {
  return 'ProductVariant(id: $id, label: $label, sellPrice: $sellPrice, quantity: $quantity, totalSold: $totalSold, imageUrl: $imageUrl, imagePath: $imagePath, diameterMm: $diameterMm, totalLengthMm: $totalLengthMm, roughness: $roughness, productName: $productName, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProductVariantCopyWith<$Res> implements $ProductVariantCopyWith<$Res> {
  factory _$ProductVariantCopyWith(_ProductVariant value, $Res Function(_ProductVariant) _then) = __$ProductVariantCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, num sellPrice, int quantity, int totalSold, String imageUrl, String imagePath, num? diameterMm, num? totalLengthMm, String roughness, String productName,@TimestampConverter() DateTime? createdAt,@TimestampConverter() DateTime? updatedAt
});




}
/// @nodoc
class __$ProductVariantCopyWithImpl<$Res>
    implements _$ProductVariantCopyWith<$Res> {
  __$ProductVariantCopyWithImpl(this._self, this._then);

  final _ProductVariant _self;
  final $Res Function(_ProductVariant) _then;

/// Create a copy of ProductVariant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? sellPrice = null,Object? quantity = null,Object? totalSold = null,Object? imageUrl = null,Object? imagePath = null,Object? diameterMm = freezed,Object? totalLengthMm = freezed,Object? roughness = null,Object? productName = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ProductVariant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,sellPrice: null == sellPrice ? _self.sellPrice : sellPrice // ignore: cast_nullable_to_non_nullable
as num,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,totalSold: null == totalSold ? _self.totalSold : totalSold // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,diameterMm: freezed == diameterMm ? _self.diameterMm : diameterMm // ignore: cast_nullable_to_non_nullable
as num?,totalLengthMm: freezed == totalLengthMm ? _self.totalLengthMm : totalLengthMm // ignore: cast_nullable_to_non_nullable
as num?,roughness: null == roughness ? _self.roughness : roughness // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$VariantSummary {

 String get variantId; String get label; num get sellPrice; int get quantity; num? get diameterMm; num? get totalLengthMm; String get roughness;
/// Create a copy of VariantSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariantSummaryCopyWith<VariantSummary> get copyWith => _$VariantSummaryCopyWithImpl<VariantSummary>(this as VariantSummary, _$identity);

  /// Serializes this VariantSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VariantSummary&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.label, label) || other.label == label)&&(identical(other.sellPrice, sellPrice) || other.sellPrice == sellPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.diameterMm, diameterMm) || other.diameterMm == diameterMm)&&(identical(other.totalLengthMm, totalLengthMm) || other.totalLengthMm == totalLengthMm)&&(identical(other.roughness, roughness) || other.roughness == roughness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variantId,label,sellPrice,quantity,diameterMm,totalLengthMm,roughness);

@override
String toString() {
  return 'VariantSummary(variantId: $variantId, label: $label, sellPrice: $sellPrice, quantity: $quantity, diameterMm: $diameterMm, totalLengthMm: $totalLengthMm, roughness: $roughness)';
}


}

/// @nodoc
abstract mixin class $VariantSummaryCopyWith<$Res>  {
  factory $VariantSummaryCopyWith(VariantSummary value, $Res Function(VariantSummary) _then) = _$VariantSummaryCopyWithImpl;
@useResult
$Res call({
 String variantId, String label, num sellPrice, int quantity, num? diameterMm, num? totalLengthMm, String roughness
});




}
/// @nodoc
class _$VariantSummaryCopyWithImpl<$Res>
    implements $VariantSummaryCopyWith<$Res> {
  _$VariantSummaryCopyWithImpl(this._self, this._then);

  final VariantSummary _self;
  final $Res Function(VariantSummary) _then;

/// Create a copy of VariantSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variantId = null,Object? label = null,Object? sellPrice = null,Object? quantity = null,Object? diameterMm = freezed,Object? totalLengthMm = freezed,Object? roughness = null,}) {
  return _then(VariantSummary(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,sellPrice: null == sellPrice ? _self.sellPrice : sellPrice // ignore: cast_nullable_to_non_nullable
as num,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,diameterMm: freezed == diameterMm ? _self.diameterMm : diameterMm // ignore: cast_nullable_to_non_nullable
as num?,totalLengthMm: freezed == totalLengthMm ? _self.totalLengthMm : totalLengthMm // ignore: cast_nullable_to_non_nullable
as num?,roughness: null == roughness ? _self.roughness : roughness // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VariantSummary].
extension VariantSummaryPatterns on VariantSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VariantSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VariantSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VariantSummary value)  $default,){
final _that = this;
switch (_that) {
case _VariantSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VariantSummary value)?  $default,){
final _that = this;
switch (_that) {
case _VariantSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String variantId,  String label,  num sellPrice,  int quantity,  num? diameterMm,  num? totalLengthMm,  String roughness)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VariantSummary() when $default != null:
return $default(_that.variantId,_that.label,_that.sellPrice,_that.quantity,_that.diameterMm,_that.totalLengthMm,_that.roughness);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String variantId,  String label,  num sellPrice,  int quantity,  num? diameterMm,  num? totalLengthMm,  String roughness)  $default,) {final _that = this;
switch (_that) {
case _VariantSummary():
return $default(_that.variantId,_that.label,_that.sellPrice,_that.quantity,_that.diameterMm,_that.totalLengthMm,_that.roughness);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String variantId,  String label,  num sellPrice,  int quantity,  num? diameterMm,  num? totalLengthMm,  String roughness)?  $default,) {final _that = this;
switch (_that) {
case _VariantSummary() when $default != null:
return $default(_that.variantId,_that.label,_that.sellPrice,_that.quantity,_that.diameterMm,_that.totalLengthMm,_that.roughness);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VariantSummary implements VariantSummary {
  const _VariantSummary({required this.variantId, required this.label, required this.sellPrice, this.quantity = 0, this.diameterMm, this.totalLengthMm, this.roughness = ''});
  factory _VariantSummary.fromJson(Map<String, dynamic> json) => _$VariantSummaryFromJson(json);

@override final  String variantId;
@override final  String label;
@override final  num sellPrice;
@override@JsonKey() final  int quantity;
@override final  num? diameterMm;
@override final  num? totalLengthMm;
@override@JsonKey() final  String roughness;

/// Create a copy of VariantSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariantSummaryCopyWith<_VariantSummary> get copyWith => __$VariantSummaryCopyWithImpl<_VariantSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VariantSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VariantSummary&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.label, label) || other.label == label)&&(identical(other.sellPrice, sellPrice) || other.sellPrice == sellPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.diameterMm, diameterMm) || other.diameterMm == diameterMm)&&(identical(other.totalLengthMm, totalLengthMm) || other.totalLengthMm == totalLengthMm)&&(identical(other.roughness, roughness) || other.roughness == roughness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variantId,label,sellPrice,quantity,diameterMm,totalLengthMm,roughness);

@override
String toString() {
  return 'VariantSummary(variantId: $variantId, label: $label, sellPrice: $sellPrice, quantity: $quantity, diameterMm: $diameterMm, totalLengthMm: $totalLengthMm, roughness: $roughness)';
}


}

/// @nodoc
abstract mixin class _$VariantSummaryCopyWith<$Res> implements $VariantSummaryCopyWith<$Res> {
  factory _$VariantSummaryCopyWith(_VariantSummary value, $Res Function(_VariantSummary) _then) = __$VariantSummaryCopyWithImpl;
@override @useResult
$Res call({
 String variantId, String label, num sellPrice, int quantity, num? diameterMm, num? totalLengthMm, String roughness
});




}
/// @nodoc
class __$VariantSummaryCopyWithImpl<$Res>
    implements _$VariantSummaryCopyWith<$Res> {
  __$VariantSummaryCopyWithImpl(this._self, this._then);

  final _VariantSummary _self;
  final $Res Function(_VariantSummary) _then;

/// Create a copy of VariantSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variantId = null,Object? label = null,Object? sellPrice = null,Object? quantity = null,Object? diameterMm = freezed,Object? totalLengthMm = freezed,Object? roughness = null,}) {
  return _then(_VariantSummary(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,sellPrice: null == sellPrice ? _self.sellPrice : sellPrice // ignore: cast_nullable_to_non_nullable
as num,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,diameterMm: freezed == diameterMm ? _self.diameterMm : diameterMm // ignore: cast_nullable_to_non_nullable
as num?,totalLengthMm: freezed == totalLengthMm ? _self.totalLengthMm : totalLengthMm // ignore: cast_nullable_to_non_nullable
as num?,roughness: null == roughness ? _self.roughness : roughness // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProductVariantCost {

 num get costPrice;
/// Create a copy of ProductVariantCost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductVariantCostCopyWith<ProductVariantCost> get copyWith => _$ProductVariantCostCopyWithImpl<ProductVariantCost>(this as ProductVariantCost, _$identity);

  /// Serializes this ProductVariantCost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductVariantCost&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,costPrice);

@override
String toString() {
  return 'ProductVariantCost(costPrice: $costPrice)';
}


}

/// @nodoc
abstract mixin class $ProductVariantCostCopyWith<$Res>  {
  factory $ProductVariantCostCopyWith(ProductVariantCost value, $Res Function(ProductVariantCost) _then) = _$ProductVariantCostCopyWithImpl;
@useResult
$Res call({
 num costPrice
});




}
/// @nodoc
class _$ProductVariantCostCopyWithImpl<$Res>
    implements $ProductVariantCostCopyWith<$Res> {
  _$ProductVariantCostCopyWithImpl(this._self, this._then);

  final ProductVariantCost _self;
  final $Res Function(ProductVariantCost) _then;

/// Create a copy of ProductVariantCost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? costPrice = null,}) {
  return _then(ProductVariantCost(
costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductVariantCost].
extension ProductVariantCostPatterns on ProductVariantCost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductVariantCost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductVariantCost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductVariantCost value)  $default,){
final _that = this;
switch (_that) {
case _ProductVariantCost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductVariantCost value)?  $default,){
final _that = this;
switch (_that) {
case _ProductVariantCost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( num costPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductVariantCost() when $default != null:
return $default(_that.costPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( num costPrice)  $default,) {final _that = this;
switch (_that) {
case _ProductVariantCost():
return $default(_that.costPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( num costPrice)?  $default,) {final _that = this;
switch (_that) {
case _ProductVariantCost() when $default != null:
return $default(_that.costPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductVariantCost implements ProductVariantCost {
  const _ProductVariantCost({required this.costPrice});
  factory _ProductVariantCost.fromJson(Map<String, dynamic> json) => _$ProductVariantCostFromJson(json);

@override final  num costPrice;

/// Create a copy of ProductVariantCost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductVariantCostCopyWith<_ProductVariantCost> get copyWith => __$ProductVariantCostCopyWithImpl<_ProductVariantCost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductVariantCostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductVariantCost&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,costPrice);

@override
String toString() {
  return 'ProductVariantCost(costPrice: $costPrice)';
}


}

/// @nodoc
abstract mixin class _$ProductVariantCostCopyWith<$Res> implements $ProductVariantCostCopyWith<$Res> {
  factory _$ProductVariantCostCopyWith(_ProductVariantCost value, $Res Function(_ProductVariantCost) _then) = __$ProductVariantCostCopyWithImpl;
@override @useResult
$Res call({
 num costPrice
});




}
/// @nodoc
class __$ProductVariantCostCopyWithImpl<$Res>
    implements _$ProductVariantCostCopyWith<$Res> {
  __$ProductVariantCostCopyWithImpl(this._self, this._then);

  final _ProductVariantCost _self;
  final $Res Function(_ProductVariantCost) _then;

/// Create a copy of ProductVariantCost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? costPrice = null,}) {
  return _then(_ProductVariantCost(
costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}

// dart format on
