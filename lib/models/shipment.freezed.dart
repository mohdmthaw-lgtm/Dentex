// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShipmentItem {

 String get productName; String get manufacturer; int get quantity; int get cartonCount; num get purchasePrice;
/// Create a copy of ShipmentItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShipmentItemCopyWith<ShipmentItem> get copyWith => _$ShipmentItemCopyWithImpl<ShipmentItem>(this as ShipmentItem, _$identity);

  /// Serializes this ShipmentItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShipmentItem&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.cartonCount, cartonCount) || other.cartonCount == cartonCount)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,manufacturer,quantity,cartonCount,purchasePrice);

@override
String toString() {
  return 'ShipmentItem(productName: $productName, manufacturer: $manufacturer, quantity: $quantity, cartonCount: $cartonCount, purchasePrice: $purchasePrice)';
}


}

/// @nodoc
abstract mixin class $ShipmentItemCopyWith<$Res>  {
  factory $ShipmentItemCopyWith(ShipmentItem value, $Res Function(ShipmentItem) _then) = _$ShipmentItemCopyWithImpl;
@useResult
$Res call({
 String productName, String manufacturer, int quantity, int cartonCount, num purchasePrice
});




}
/// @nodoc
class _$ShipmentItemCopyWithImpl<$Res>
    implements $ShipmentItemCopyWith<$Res> {
  _$ShipmentItemCopyWithImpl(this._self, this._then);

  final ShipmentItem _self;
  final $Res Function(ShipmentItem) _then;

/// Create a copy of ShipmentItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productName = null,Object? manufacturer = null,Object? quantity = null,Object? cartonCount = null,Object? purchasePrice = null,}) {
  return _then(ShipmentItem(
productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,manufacturer: null == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,cartonCount: null == cartonCount ? _self.cartonCount : cartonCount // ignore: cast_nullable_to_non_nullable
as int,purchasePrice: null == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [ShipmentItem].
extension ShipmentItemPatterns on ShipmentItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShipmentItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShipmentItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShipmentItem value)  $default,){
final _that = this;
switch (_that) {
case _ShipmentItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShipmentItem value)?  $default,){
final _that = this;
switch (_that) {
case _ShipmentItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productName,  String manufacturer,  int quantity,  int cartonCount,  num purchasePrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShipmentItem() when $default != null:
return $default(_that.productName,_that.manufacturer,_that.quantity,_that.cartonCount,_that.purchasePrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productName,  String manufacturer,  int quantity,  int cartonCount,  num purchasePrice)  $default,) {final _that = this;
switch (_that) {
case _ShipmentItem():
return $default(_that.productName,_that.manufacturer,_that.quantity,_that.cartonCount,_that.purchasePrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productName,  String manufacturer,  int quantity,  int cartonCount,  num purchasePrice)?  $default,) {final _that = this;
switch (_that) {
case _ShipmentItem() when $default != null:
return $default(_that.productName,_that.manufacturer,_that.quantity,_that.cartonCount,_that.purchasePrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShipmentItem extends ShipmentItem {
  const _ShipmentItem({required this.productName, this.manufacturer = '', this.quantity = 0, this.cartonCount = 0, this.purchasePrice = 0}): super._();
  factory _ShipmentItem.fromJson(Map<String, dynamic> json) => _$ShipmentItemFromJson(json);

@override final  String productName;
@override@JsonKey() final  String manufacturer;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  int cartonCount;
@override@JsonKey() final  num purchasePrice;

/// Create a copy of ShipmentItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShipmentItemCopyWith<_ShipmentItem> get copyWith => __$ShipmentItemCopyWithImpl<_ShipmentItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShipmentItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShipmentItem&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.cartonCount, cartonCount) || other.cartonCount == cartonCount)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,manufacturer,quantity,cartonCount,purchasePrice);

@override
String toString() {
  return 'ShipmentItem(productName: $productName, manufacturer: $manufacturer, quantity: $quantity, cartonCount: $cartonCount, purchasePrice: $purchasePrice)';
}


}

/// @nodoc
abstract mixin class _$ShipmentItemCopyWith<$Res> implements $ShipmentItemCopyWith<$Res> {
  factory _$ShipmentItemCopyWith(_ShipmentItem value, $Res Function(_ShipmentItem) _then) = __$ShipmentItemCopyWithImpl;
@override @useResult
$Res call({
 String productName, String manufacturer, int quantity, int cartonCount, num purchasePrice
});




}
/// @nodoc
class __$ShipmentItemCopyWithImpl<$Res>
    implements _$ShipmentItemCopyWith<$Res> {
  __$ShipmentItemCopyWithImpl(this._self, this._then);

  final _ShipmentItem _self;
  final $Res Function(_ShipmentItem) _then;

/// Create a copy of ShipmentItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productName = null,Object? manufacturer = null,Object? quantity = null,Object? cartonCount = null,Object? purchasePrice = null,}) {
  return _then(_ShipmentItem(
productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,manufacturer: null == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,cartonCount: null == cartonCount ? _self.cartonCount : cartonCount // ignore: cast_nullable_to_non_nullable
as int,purchasePrice: null == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}


/// @nodoc
mixin _$ShipmentCosts {

 num get shipping; num get customs; num get clearance; num get storage; num get transport; num get other;
/// Create a copy of ShipmentCosts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShipmentCostsCopyWith<ShipmentCosts> get copyWith => _$ShipmentCostsCopyWithImpl<ShipmentCosts>(this as ShipmentCosts, _$identity);

  /// Serializes this ShipmentCosts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShipmentCosts&&(identical(other.shipping, shipping) || other.shipping == shipping)&&(identical(other.customs, customs) || other.customs == customs)&&(identical(other.clearance, clearance) || other.clearance == clearance)&&(identical(other.storage, storage) || other.storage == storage)&&(identical(other.transport, transport) || other.transport == transport)&&(identical(other.other, this.other) || other.other == this.other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shipping,customs,clearance,storage,transport,other);

@override
String toString() {
  return 'ShipmentCosts(shipping: $shipping, customs: $customs, clearance: $clearance, storage: $storage, transport: $transport, other: $other)';
}


}

/// @nodoc
abstract mixin class $ShipmentCostsCopyWith<$Res>  {
  factory $ShipmentCostsCopyWith(ShipmentCosts value, $Res Function(ShipmentCosts) _then) = _$ShipmentCostsCopyWithImpl;
@useResult
$Res call({
 num shipping, num customs, num clearance, num storage, num transport, num other
});




}
/// @nodoc
class _$ShipmentCostsCopyWithImpl<$Res>
    implements $ShipmentCostsCopyWith<$Res> {
  _$ShipmentCostsCopyWithImpl(this._self, this._then);

  final ShipmentCosts _self;
  final $Res Function(ShipmentCosts) _then;

/// Create a copy of ShipmentCosts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shipping = null,Object? customs = null,Object? clearance = null,Object? storage = null,Object? transport = null,Object? other = null,}) {
  return _then(ShipmentCosts(
shipping: null == shipping ? _self.shipping : shipping // ignore: cast_nullable_to_non_nullable
as num,customs: null == customs ? _self.customs : customs // ignore: cast_nullable_to_non_nullable
as num,clearance: null == clearance ? _self.clearance : clearance // ignore: cast_nullable_to_non_nullable
as num,storage: null == storage ? _self.storage : storage // ignore: cast_nullable_to_non_nullable
as num,transport: null == transport ? _self.transport : transport // ignore: cast_nullable_to_non_nullable
as num,other: null == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [ShipmentCosts].
extension ShipmentCostsPatterns on ShipmentCosts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShipmentCosts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShipmentCosts() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShipmentCosts value)  $default,){
final _that = this;
switch (_that) {
case _ShipmentCosts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShipmentCosts value)?  $default,){
final _that = this;
switch (_that) {
case _ShipmentCosts() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( num shipping,  num customs,  num clearance,  num storage,  num transport,  num other)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShipmentCosts() when $default != null:
return $default(_that.shipping,_that.customs,_that.clearance,_that.storage,_that.transport,_that.other);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( num shipping,  num customs,  num clearance,  num storage,  num transport,  num other)  $default,) {final _that = this;
switch (_that) {
case _ShipmentCosts():
return $default(_that.shipping,_that.customs,_that.clearance,_that.storage,_that.transport,_that.other);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( num shipping,  num customs,  num clearance,  num storage,  num transport,  num other)?  $default,) {final _that = this;
switch (_that) {
case _ShipmentCosts() when $default != null:
return $default(_that.shipping,_that.customs,_that.clearance,_that.storage,_that.transport,_that.other);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShipmentCosts extends ShipmentCosts {
  const _ShipmentCosts({this.shipping = 0, this.customs = 0, this.clearance = 0, this.storage = 0, this.transport = 0, this.other = 0}): super._();
  factory _ShipmentCosts.fromJson(Map<String, dynamic> json) => _$ShipmentCostsFromJson(json);

@override@JsonKey() final  num shipping;
@override@JsonKey() final  num customs;
@override@JsonKey() final  num clearance;
@override@JsonKey() final  num storage;
@override@JsonKey() final  num transport;
@override@JsonKey() final  num other;

/// Create a copy of ShipmentCosts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShipmentCostsCopyWith<_ShipmentCosts> get copyWith => __$ShipmentCostsCopyWithImpl<_ShipmentCosts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShipmentCostsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShipmentCosts&&(identical(other.shipping, shipping) || other.shipping == shipping)&&(identical(other.customs, customs) || other.customs == customs)&&(identical(other.clearance, clearance) || other.clearance == clearance)&&(identical(other.storage, storage) || other.storage == storage)&&(identical(other.transport, transport) || other.transport == transport)&&(identical(other.other, this.other) || other.other == this.other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shipping,customs,clearance,storage,transport,other);

@override
String toString() {
  return 'ShipmentCosts(shipping: $shipping, customs: $customs, clearance: $clearance, storage: $storage, transport: $transport, other: $other)';
}


}

/// @nodoc
abstract mixin class _$ShipmentCostsCopyWith<$Res> implements $ShipmentCostsCopyWith<$Res> {
  factory _$ShipmentCostsCopyWith(_ShipmentCosts value, $Res Function(_ShipmentCosts) _then) = __$ShipmentCostsCopyWithImpl;
@override @useResult
$Res call({
 num shipping, num customs, num clearance, num storage, num transport, num other
});




}
/// @nodoc
class __$ShipmentCostsCopyWithImpl<$Res>
    implements _$ShipmentCostsCopyWith<$Res> {
  __$ShipmentCostsCopyWithImpl(this._self, this._then);

  final _ShipmentCosts _self;
  final $Res Function(_ShipmentCosts) _then;

/// Create a copy of ShipmentCosts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shipping = null,Object? customs = null,Object? clearance = null,Object? storage = null,Object? transport = null,Object? other = null,}) {
  return _then(_ShipmentCosts(
shipping: null == shipping ? _self.shipping : shipping // ignore: cast_nullable_to_non_nullable
as num,customs: null == customs ? _self.customs : customs // ignore: cast_nullable_to_non_nullable
as num,clearance: null == clearance ? _self.clearance : clearance // ignore: cast_nullable_to_non_nullable
as num,storage: null == storage ? _self.storage : storage // ignore: cast_nullable_to_non_nullable
as num,transport: null == transport ? _self.transport : transport // ignore: cast_nullable_to_non_nullable
as num,other: null == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}


/// @nodoc
mixin _$ShipmentDocument {

 String get label; String get url; String get path;@TimestampConverter() DateTime? get uploadedAt;
/// Create a copy of ShipmentDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShipmentDocumentCopyWith<ShipmentDocument> get copyWith => _$ShipmentDocumentCopyWithImpl<ShipmentDocument>(this as ShipmentDocument, _$identity);

  /// Serializes this ShipmentDocument to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShipmentDocument&&(identical(other.label, label) || other.label == label)&&(identical(other.url, url) || other.url == url)&&(identical(other.path, path) || other.path == path)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,url,path,uploadedAt);

@override
String toString() {
  return 'ShipmentDocument(label: $label, url: $url, path: $path, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class $ShipmentDocumentCopyWith<$Res>  {
  factory $ShipmentDocumentCopyWith(ShipmentDocument value, $Res Function(ShipmentDocument) _then) = _$ShipmentDocumentCopyWithImpl;
@useResult
$Res call({
 String label, String url, String path,@TimestampConverter() DateTime? uploadedAt
});




}
/// @nodoc
class _$ShipmentDocumentCopyWithImpl<$Res>
    implements $ShipmentDocumentCopyWith<$Res> {
  _$ShipmentDocumentCopyWithImpl(this._self, this._then);

  final ShipmentDocument _self;
  final $Res Function(ShipmentDocument) _then;

/// Create a copy of ShipmentDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? url = null,Object? path = null,Object? uploadedAt = freezed,}) {
  return _then(ShipmentDocument(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: freezed == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShipmentDocument].
extension ShipmentDocumentPatterns on ShipmentDocument {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShipmentDocument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShipmentDocument() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShipmentDocument value)  $default,){
final _that = this;
switch (_that) {
case _ShipmentDocument():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShipmentDocument value)?  $default,){
final _that = this;
switch (_that) {
case _ShipmentDocument() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String url,  String path, @TimestampConverter()  DateTime? uploadedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShipmentDocument() when $default != null:
return $default(_that.label,_that.url,_that.path,_that.uploadedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String url,  String path, @TimestampConverter()  DateTime? uploadedAt)  $default,) {final _that = this;
switch (_that) {
case _ShipmentDocument():
return $default(_that.label,_that.url,_that.path,_that.uploadedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String url,  String path, @TimestampConverter()  DateTime? uploadedAt)?  $default,) {final _that = this;
switch (_that) {
case _ShipmentDocument() when $default != null:
return $default(_that.label,_that.url,_that.path,_that.uploadedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShipmentDocument implements ShipmentDocument {
  const _ShipmentDocument({required this.label, required this.url, required this.path, @TimestampConverter() this.uploadedAt});
  factory _ShipmentDocument.fromJson(Map<String, dynamic> json) => _$ShipmentDocumentFromJson(json);

@override final  String label;
@override final  String url;
@override final  String path;
@override@TimestampConverter() final  DateTime? uploadedAt;

/// Create a copy of ShipmentDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShipmentDocumentCopyWith<_ShipmentDocument> get copyWith => __$ShipmentDocumentCopyWithImpl<_ShipmentDocument>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShipmentDocumentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShipmentDocument&&(identical(other.label, label) || other.label == label)&&(identical(other.url, url) || other.url == url)&&(identical(other.path, path) || other.path == path)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,url,path,uploadedAt);

@override
String toString() {
  return 'ShipmentDocument(label: $label, url: $url, path: $path, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class _$ShipmentDocumentCopyWith<$Res> implements $ShipmentDocumentCopyWith<$Res> {
  factory _$ShipmentDocumentCopyWith(_ShipmentDocument value, $Res Function(_ShipmentDocument) _then) = __$ShipmentDocumentCopyWithImpl;
@override @useResult
$Res call({
 String label, String url, String path,@TimestampConverter() DateTime? uploadedAt
});




}
/// @nodoc
class __$ShipmentDocumentCopyWithImpl<$Res>
    implements _$ShipmentDocumentCopyWith<$Res> {
  __$ShipmentDocumentCopyWithImpl(this._self, this._then);

  final _ShipmentDocument _self;
  final $Res Function(_ShipmentDocument) _then;

/// Create a copy of ShipmentDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? url = null,Object? path = null,Object? uploadedAt = freezed,}) {
  return _then(_ShipmentDocument(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: freezed == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Shipment {

 String get id; String get shipmentNumber; String get supplierName; String get purchaseOrderNumber; String get shippingCompany; String get shippingAgent; String get shipmentType; String get originCountry; String get containerNumber;@NullableTimestampConverter() DateTime? get shipDate;@NullableTimestampConverter() DateTime? get expectedArrivalDate; String get notes; String get status; List<ShipmentItem> get items; ShipmentCosts get costs; String get currency; List<ShipmentDocument> get documents;@NullableTimestampConverter() DateTime? get receivedAt; int get receivedCartons; String get receivingNotes;@TimestampConverter() DateTime? get createdAt;
/// Create a copy of Shipment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShipmentCopyWith<Shipment> get copyWith => _$ShipmentCopyWithImpl<Shipment>(this as Shipment, _$identity);

  /// Serializes this Shipment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shipment&&(identical(other.id, id) || other.id == id)&&(identical(other.shipmentNumber, shipmentNumber) || other.shipmentNumber == shipmentNumber)&&(identical(other.supplierName, supplierName) || other.supplierName == supplierName)&&(identical(other.purchaseOrderNumber, purchaseOrderNumber) || other.purchaseOrderNumber == purchaseOrderNumber)&&(identical(other.shippingCompany, shippingCompany) || other.shippingCompany == shippingCompany)&&(identical(other.shippingAgent, shippingAgent) || other.shippingAgent == shippingAgent)&&(identical(other.shipmentType, shipmentType) || other.shipmentType == shipmentType)&&(identical(other.originCountry, originCountry) || other.originCountry == originCountry)&&(identical(other.containerNumber, containerNumber) || other.containerNumber == containerNumber)&&(identical(other.shipDate, shipDate) || other.shipDate == shipDate)&&(identical(other.expectedArrivalDate, expectedArrivalDate) || other.expectedArrivalDate == expectedArrivalDate)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.costs, costs) || other.costs == costs)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.documents, documents)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.receivedCartons, receivedCartons) || other.receivedCartons == receivedCartons)&&(identical(other.receivingNotes, receivingNotes) || other.receivingNotes == receivingNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,shipmentNumber,supplierName,purchaseOrderNumber,shippingCompany,shippingAgent,shipmentType,originCountry,containerNumber,shipDate,expectedArrivalDate,notes,status,const DeepCollectionEquality().hash(items),costs,currency,const DeepCollectionEquality().hash(documents),receivedAt,receivedCartons,receivingNotes,createdAt]);

@override
String toString() {
  return 'Shipment(id: $id, shipmentNumber: $shipmentNumber, supplierName: $supplierName, purchaseOrderNumber: $purchaseOrderNumber, shippingCompany: $shippingCompany, shippingAgent: $shippingAgent, shipmentType: $shipmentType, originCountry: $originCountry, containerNumber: $containerNumber, shipDate: $shipDate, expectedArrivalDate: $expectedArrivalDate, notes: $notes, status: $status, items: $items, costs: $costs, currency: $currency, documents: $documents, receivedAt: $receivedAt, receivedCartons: $receivedCartons, receivingNotes: $receivingNotes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ShipmentCopyWith<$Res>  {
  factory $ShipmentCopyWith(Shipment value, $Res Function(Shipment) _then) = _$ShipmentCopyWithImpl;
@useResult
$Res call({
 String id, String shipmentNumber, String supplierName, String purchaseOrderNumber, String shippingCompany, String shippingAgent, String shipmentType, String originCountry, String containerNumber,@NullableTimestampConverter() DateTime? shipDate,@NullableTimestampConverter() DateTime? expectedArrivalDate, String notes, String status, List<ShipmentItem> items, ShipmentCosts costs, String currency, List<ShipmentDocument> documents,@NullableTimestampConverter() DateTime? receivedAt, int receivedCartons, String receivingNotes,@TimestampConverter() DateTime? createdAt
});


$ShipmentCostsCopyWith<$Res> get costs;

}
/// @nodoc
class _$ShipmentCopyWithImpl<$Res>
    implements $ShipmentCopyWith<$Res> {
  _$ShipmentCopyWithImpl(this._self, this._then);

  final Shipment _self;
  final $Res Function(Shipment) _then;

/// Create a copy of Shipment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? shipmentNumber = null,Object? supplierName = null,Object? purchaseOrderNumber = null,Object? shippingCompany = null,Object? shippingAgent = null,Object? shipmentType = null,Object? originCountry = null,Object? containerNumber = null,Object? shipDate = freezed,Object? expectedArrivalDate = freezed,Object? notes = null,Object? status = null,Object? items = null,Object? costs = null,Object? currency = null,Object? documents = null,Object? receivedAt = freezed,Object? receivedCartons = null,Object? receivingNotes = null,Object? createdAt = freezed,}) {
  return _then(Shipment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,shipmentNumber: null == shipmentNumber ? _self.shipmentNumber : shipmentNumber // ignore: cast_nullable_to_non_nullable
as String,supplierName: null == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String,purchaseOrderNumber: null == purchaseOrderNumber ? _self.purchaseOrderNumber : purchaseOrderNumber // ignore: cast_nullable_to_non_nullable
as String,shippingCompany: null == shippingCompany ? _self.shippingCompany : shippingCompany // ignore: cast_nullable_to_non_nullable
as String,shippingAgent: null == shippingAgent ? _self.shippingAgent : shippingAgent // ignore: cast_nullable_to_non_nullable
as String,shipmentType: null == shipmentType ? _self.shipmentType : shipmentType // ignore: cast_nullable_to_non_nullable
as String,originCountry: null == originCountry ? _self.originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as String,containerNumber: null == containerNumber ? _self.containerNumber : containerNumber // ignore: cast_nullable_to_non_nullable
as String,shipDate: freezed == shipDate ? _self.shipDate : shipDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expectedArrivalDate: freezed == expectedArrivalDate ? _self.expectedArrivalDate : expectedArrivalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ShipmentItem>,costs: null == costs ? _self.costs : costs // ignore: cast_nullable_to_non_nullable
as ShipmentCosts,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<ShipmentDocument>,receivedAt: freezed == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,receivedCartons: null == receivedCartons ? _self.receivedCartons : receivedCartons // ignore: cast_nullable_to_non_nullable
as int,receivingNotes: null == receivingNotes ? _self.receivingNotes : receivingNotes // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Shipment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShipmentCostsCopyWith<$Res> get costs {
  
  return $ShipmentCostsCopyWith<$Res>(_self.costs, (value) {
    return _then(_self.copyWith(costs: value));
  });
}
}


/// Adds pattern-matching-related methods to [Shipment].
extension ShipmentPatterns on Shipment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Shipment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Shipment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Shipment value)  $default,){
final _that = this;
switch (_that) {
case _Shipment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Shipment value)?  $default,){
final _that = this;
switch (_that) {
case _Shipment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String shipmentNumber,  String supplierName,  String purchaseOrderNumber,  String shippingCompany,  String shippingAgent,  String shipmentType,  String originCountry,  String containerNumber, @NullableTimestampConverter()  DateTime? shipDate, @NullableTimestampConverter()  DateTime? expectedArrivalDate,  String notes,  String status,  List<ShipmentItem> items,  ShipmentCosts costs,  String currency,  List<ShipmentDocument> documents, @NullableTimestampConverter()  DateTime? receivedAt,  int receivedCartons,  String receivingNotes, @TimestampConverter()  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Shipment() when $default != null:
return $default(_that.id,_that.shipmentNumber,_that.supplierName,_that.purchaseOrderNumber,_that.shippingCompany,_that.shippingAgent,_that.shipmentType,_that.originCountry,_that.containerNumber,_that.shipDate,_that.expectedArrivalDate,_that.notes,_that.status,_that.items,_that.costs,_that.currency,_that.documents,_that.receivedAt,_that.receivedCartons,_that.receivingNotes,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String shipmentNumber,  String supplierName,  String purchaseOrderNumber,  String shippingCompany,  String shippingAgent,  String shipmentType,  String originCountry,  String containerNumber, @NullableTimestampConverter()  DateTime? shipDate, @NullableTimestampConverter()  DateTime? expectedArrivalDate,  String notes,  String status,  List<ShipmentItem> items,  ShipmentCosts costs,  String currency,  List<ShipmentDocument> documents, @NullableTimestampConverter()  DateTime? receivedAt,  int receivedCartons,  String receivingNotes, @TimestampConverter()  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Shipment():
return $default(_that.id,_that.shipmentNumber,_that.supplierName,_that.purchaseOrderNumber,_that.shippingCompany,_that.shippingAgent,_that.shipmentType,_that.originCountry,_that.containerNumber,_that.shipDate,_that.expectedArrivalDate,_that.notes,_that.status,_that.items,_that.costs,_that.currency,_that.documents,_that.receivedAt,_that.receivedCartons,_that.receivingNotes,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String shipmentNumber,  String supplierName,  String purchaseOrderNumber,  String shippingCompany,  String shippingAgent,  String shipmentType,  String originCountry,  String containerNumber, @NullableTimestampConverter()  DateTime? shipDate, @NullableTimestampConverter()  DateTime? expectedArrivalDate,  String notes,  String status,  List<ShipmentItem> items,  ShipmentCosts costs,  String currency,  List<ShipmentDocument> documents, @NullableTimestampConverter()  DateTime? receivedAt,  int receivedCartons,  String receivingNotes, @TimestampConverter()  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Shipment() when $default != null:
return $default(_that.id,_that.shipmentNumber,_that.supplierName,_that.purchaseOrderNumber,_that.shippingCompany,_that.shippingAgent,_that.shipmentType,_that.originCountry,_that.containerNumber,_that.shipDate,_that.expectedArrivalDate,_that.notes,_that.status,_that.items,_that.costs,_that.currency,_that.documents,_that.receivedAt,_that.receivedCartons,_that.receivingNotes,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Shipment extends Shipment {
  const _Shipment({required this.id, required this.shipmentNumber, this.supplierName = '', this.purchaseOrderNumber = '', this.shippingCompany = '', this.shippingAgent = '', this.shipmentType = ShipmentType.sea, this.originCountry = '', this.containerNumber = '', @NullableTimestampConverter() this.shipDate, @NullableTimestampConverter() this.expectedArrivalDate, this.notes = '', this.status = ShipmentStatus.preparing,  List<ShipmentItem> items = const <ShipmentItem>[], this.costs = const ShipmentCosts(), this.currency = 'USD',  List<ShipmentDocument> documents = const <ShipmentDocument>[], @NullableTimestampConverter() this.receivedAt, this.receivedCartons = 0, this.receivingNotes = '', @TimestampConverter() this.createdAt}): _items = items,_documents = documents,super._();
  factory _Shipment.fromJson(Map<String, dynamic> json) => _$ShipmentFromJson(json);

@override final  String id;
@override final  String shipmentNumber;
@override@JsonKey() final  String supplierName;
@override@JsonKey() final  String purchaseOrderNumber;
@override@JsonKey() final  String shippingCompany;
@override@JsonKey() final  String shippingAgent;
@override@JsonKey() final  String shipmentType;
@override@JsonKey() final  String originCountry;
@override@JsonKey() final  String containerNumber;
@override@NullableTimestampConverter() final  DateTime? shipDate;
@override@NullableTimestampConverter() final  DateTime? expectedArrivalDate;
@override@JsonKey() final  String notes;
@override@JsonKey() final  String status;
 final  List<ShipmentItem> _items;
@override@JsonKey() List<ShipmentItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  ShipmentCosts costs;
@override@JsonKey() final  String currency;
 final  List<ShipmentDocument> _documents;
@override@JsonKey() List<ShipmentDocument> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}

@override@NullableTimestampConverter() final  DateTime? receivedAt;
@override@JsonKey() final  int receivedCartons;
@override@JsonKey() final  String receivingNotes;
@override@TimestampConverter() final  DateTime? createdAt;

/// Create a copy of Shipment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShipmentCopyWith<_Shipment> get copyWith => __$ShipmentCopyWithImpl<_Shipment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShipmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shipment&&(identical(other.id, id) || other.id == id)&&(identical(other.shipmentNumber, shipmentNumber) || other.shipmentNumber == shipmentNumber)&&(identical(other.supplierName, supplierName) || other.supplierName == supplierName)&&(identical(other.purchaseOrderNumber, purchaseOrderNumber) || other.purchaseOrderNumber == purchaseOrderNumber)&&(identical(other.shippingCompany, shippingCompany) || other.shippingCompany == shippingCompany)&&(identical(other.shippingAgent, shippingAgent) || other.shippingAgent == shippingAgent)&&(identical(other.shipmentType, shipmentType) || other.shipmentType == shipmentType)&&(identical(other.originCountry, originCountry) || other.originCountry == originCountry)&&(identical(other.containerNumber, containerNumber) || other.containerNumber == containerNumber)&&(identical(other.shipDate, shipDate) || other.shipDate == shipDate)&&(identical(other.expectedArrivalDate, expectedArrivalDate) || other.expectedArrivalDate == expectedArrivalDate)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.costs, costs) || other.costs == costs)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other._documents, _documents)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.receivedCartons, receivedCartons) || other.receivedCartons == receivedCartons)&&(identical(other.receivingNotes, receivingNotes) || other.receivingNotes == receivingNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,shipmentNumber,supplierName,purchaseOrderNumber,shippingCompany,shippingAgent,shipmentType,originCountry,containerNumber,shipDate,expectedArrivalDate,notes,status,const DeepCollectionEquality().hash(_items),costs,currency,const DeepCollectionEquality().hash(_documents),receivedAt,receivedCartons,receivingNotes,createdAt]);

@override
String toString() {
  return 'Shipment(id: $id, shipmentNumber: $shipmentNumber, supplierName: $supplierName, purchaseOrderNumber: $purchaseOrderNumber, shippingCompany: $shippingCompany, shippingAgent: $shippingAgent, shipmentType: $shipmentType, originCountry: $originCountry, containerNumber: $containerNumber, shipDate: $shipDate, expectedArrivalDate: $expectedArrivalDate, notes: $notes, status: $status, items: $items, costs: $costs, currency: $currency, documents: $documents, receivedAt: $receivedAt, receivedCartons: $receivedCartons, receivingNotes: $receivingNotes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ShipmentCopyWith<$Res> implements $ShipmentCopyWith<$Res> {
  factory _$ShipmentCopyWith(_Shipment value, $Res Function(_Shipment) _then) = __$ShipmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String shipmentNumber, String supplierName, String purchaseOrderNumber, String shippingCompany, String shippingAgent, String shipmentType, String originCountry, String containerNumber,@NullableTimestampConverter() DateTime? shipDate,@NullableTimestampConverter() DateTime? expectedArrivalDate, String notes, String status, List<ShipmentItem> items, ShipmentCosts costs, String currency, List<ShipmentDocument> documents,@NullableTimestampConverter() DateTime? receivedAt, int receivedCartons, String receivingNotes,@TimestampConverter() DateTime? createdAt
});


@override $ShipmentCostsCopyWith<$Res> get costs;

}
/// @nodoc
class __$ShipmentCopyWithImpl<$Res>
    implements _$ShipmentCopyWith<$Res> {
  __$ShipmentCopyWithImpl(this._self, this._then);

  final _Shipment _self;
  final $Res Function(_Shipment) _then;

/// Create a copy of Shipment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? shipmentNumber = null,Object? supplierName = null,Object? purchaseOrderNumber = null,Object? shippingCompany = null,Object? shippingAgent = null,Object? shipmentType = null,Object? originCountry = null,Object? containerNumber = null,Object? shipDate = freezed,Object? expectedArrivalDate = freezed,Object? notes = null,Object? status = null,Object? items = null,Object? costs = null,Object? currency = null,Object? documents = null,Object? receivedAt = freezed,Object? receivedCartons = null,Object? receivingNotes = null,Object? createdAt = freezed,}) {
  return _then(_Shipment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,shipmentNumber: null == shipmentNumber ? _self.shipmentNumber : shipmentNumber // ignore: cast_nullable_to_non_nullable
as String,supplierName: null == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String,purchaseOrderNumber: null == purchaseOrderNumber ? _self.purchaseOrderNumber : purchaseOrderNumber // ignore: cast_nullable_to_non_nullable
as String,shippingCompany: null == shippingCompany ? _self.shippingCompany : shippingCompany // ignore: cast_nullable_to_non_nullable
as String,shippingAgent: null == shippingAgent ? _self.shippingAgent : shippingAgent // ignore: cast_nullable_to_non_nullable
as String,shipmentType: null == shipmentType ? _self.shipmentType : shipmentType // ignore: cast_nullable_to_non_nullable
as String,originCountry: null == originCountry ? _self.originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as String,containerNumber: null == containerNumber ? _self.containerNumber : containerNumber // ignore: cast_nullable_to_non_nullable
as String,shipDate: freezed == shipDate ? _self.shipDate : shipDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expectedArrivalDate: freezed == expectedArrivalDate ? _self.expectedArrivalDate : expectedArrivalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ShipmentItem>,costs: null == costs ? _self.costs : costs // ignore: cast_nullable_to_non_nullable
as ShipmentCosts,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<ShipmentDocument>,receivedAt: freezed == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,receivedCartons: null == receivedCartons ? _self.receivedCartons : receivedCartons // ignore: cast_nullable_to_non_nullable
as int,receivingNotes: null == receivingNotes ? _self.receivingNotes : receivingNotes // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Shipment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShipmentCostsCopyWith<$Res> get costs {
  
  return $ShipmentCostsCopyWith<$Res>(_self.costs, (value) {
    return _then(_self.copyWith(costs: value));
  });
}
}

// dart format on
