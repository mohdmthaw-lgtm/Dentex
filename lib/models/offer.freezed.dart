// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfferItem {

 String get productId; String get productName; String get productImageUrl; String get variantId; String get variantLabel; num get unitPrice; int get quantity;
/// Create a copy of OfferItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferItemCopyWith<OfferItem> get copyWith => _$OfferItemCopyWithImpl<OfferItem>(this as OfferItem, _$identity);

  /// Serializes this OfferItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productImageUrl, productImageUrl) || other.productImageUrl == productImageUrl)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.variantLabel, variantLabel) || other.variantLabel == variantLabel)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,productName,productImageUrl,variantId,variantLabel,unitPrice,quantity);

@override
String toString() {
  return 'OfferItem(productId: $productId, productName: $productName, productImageUrl: $productImageUrl, variantId: $variantId, variantLabel: $variantLabel, unitPrice: $unitPrice, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $OfferItemCopyWith<$Res>  {
  factory $OfferItemCopyWith(OfferItem value, $Res Function(OfferItem) _then) = _$OfferItemCopyWithImpl;
@useResult
$Res call({
 String productId, String productName, String productImageUrl, String variantId, String variantLabel, num unitPrice, int quantity
});




}
/// @nodoc
class _$OfferItemCopyWithImpl<$Res>
    implements $OfferItemCopyWith<$Res> {
  _$OfferItemCopyWithImpl(this._self, this._then);

  final OfferItem _self;
  final $Res Function(OfferItem) _then;

/// Create a copy of OfferItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? productName = null,Object? productImageUrl = null,Object? variantId = null,Object? variantLabel = null,Object? unitPrice = null,Object? quantity = null,}) {
  return _then(OfferItem(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productImageUrl: null == productImageUrl ? _self.productImageUrl : productImageUrl // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as num,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OfferItem].
extension OfferItemPatterns on OfferItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferItem value)  $default,){
final _that = this;
switch (_that) {
case _OfferItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferItem value)?  $default,){
final _that = this;
switch (_that) {
case _OfferItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productId,  String productName,  String productImageUrl,  String variantId,  String variantLabel,  num unitPrice,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferItem() when $default != null:
return $default(_that.productId,_that.productName,_that.productImageUrl,_that.variantId,_that.variantLabel,_that.unitPrice,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productId,  String productName,  String productImageUrl,  String variantId,  String variantLabel,  num unitPrice,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _OfferItem():
return $default(_that.productId,_that.productName,_that.productImageUrl,_that.variantId,_that.variantLabel,_that.unitPrice,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productId,  String productName,  String productImageUrl,  String variantId,  String variantLabel,  num unitPrice,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _OfferItem() when $default != null:
return $default(_that.productId,_that.productName,_that.productImageUrl,_that.variantId,_that.variantLabel,_that.unitPrice,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfferItem extends OfferItem {
  const _OfferItem({required this.productId, required this.productName, this.productImageUrl = '', required this.variantId, required this.variantLabel, required this.unitPrice, required this.quantity}): super._();
  factory _OfferItem.fromJson(Map<String, dynamic> json) => _$OfferItemFromJson(json);

@override final  String productId;
@override final  String productName;
@override@JsonKey() final  String productImageUrl;
@override final  String variantId;
@override final  String variantLabel;
@override final  num unitPrice;
@override final  int quantity;

/// Create a copy of OfferItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferItemCopyWith<_OfferItem> get copyWith => __$OfferItemCopyWithImpl<_OfferItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfferItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productImageUrl, productImageUrl) || other.productImageUrl == productImageUrl)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.variantLabel, variantLabel) || other.variantLabel == variantLabel)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,productName,productImageUrl,variantId,variantLabel,unitPrice,quantity);

@override
String toString() {
  return 'OfferItem(productId: $productId, productName: $productName, productImageUrl: $productImageUrl, variantId: $variantId, variantLabel: $variantLabel, unitPrice: $unitPrice, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$OfferItemCopyWith<$Res> implements $OfferItemCopyWith<$Res> {
  factory _$OfferItemCopyWith(_OfferItem value, $Res Function(_OfferItem) _then) = __$OfferItemCopyWithImpl;
@override @useResult
$Res call({
 String productId, String productName, String productImageUrl, String variantId, String variantLabel, num unitPrice, int quantity
});




}
/// @nodoc
class __$OfferItemCopyWithImpl<$Res>
    implements _$OfferItemCopyWith<$Res> {
  __$OfferItemCopyWithImpl(this._self, this._then);

  final _OfferItem _self;
  final $Res Function(_OfferItem) _then;

/// Create a copy of OfferItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? productName = null,Object? productImageUrl = null,Object? variantId = null,Object? variantLabel = null,Object? unitPrice = null,Object? quantity = null,}) {
  return _then(_OfferItem(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productImageUrl: null == productImageUrl ? _self.productImageUrl : productImageUrl // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as num,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Offer {

 String get id; String get title; String get description; String get imageUrl; String get imagePath; List<OfferItem> get items; num get offerPrice; bool get isActive;@NullableTimestampConverter() DateTime? get startDate;@NullableTimestampConverter() DateTime? get endDate;@TimestampConverter() DateTime? get createdAt; int get timesSold; int get unitsSold; num get totalRevenue; num get totalDiscountGiven;
/// Create a copy of Offer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferCopyWith<Offer> get copyWith => _$OfferCopyWithImpl<Offer>(this as Offer, _$identity);

  /// Serializes this Offer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Offer&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.offerPrice, offerPrice) || other.offerPrice == offerPrice)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.timesSold, timesSold) || other.timesSold == timesSold)&&(identical(other.unitsSold, unitsSold) || other.unitsSold == unitsSold)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.totalDiscountGiven, totalDiscountGiven) || other.totalDiscountGiven == totalDiscountGiven));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,imageUrl,imagePath,const DeepCollectionEquality().hash(items),offerPrice,isActive,startDate,endDate,createdAt,timesSold,unitsSold,totalRevenue,totalDiscountGiven);

@override
String toString() {
  return 'Offer(id: $id, title: $title, description: $description, imageUrl: $imageUrl, imagePath: $imagePath, items: $items, offerPrice: $offerPrice, isActive: $isActive, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, timesSold: $timesSold, unitsSold: $unitsSold, totalRevenue: $totalRevenue, totalDiscountGiven: $totalDiscountGiven)';
}


}

/// @nodoc
abstract mixin class $OfferCopyWith<$Res>  {
  factory $OfferCopyWith(Offer value, $Res Function(Offer) _then) = _$OfferCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, String imageUrl, String imagePath, List<OfferItem> items, num offerPrice, bool isActive,@NullableTimestampConverter() DateTime? startDate,@NullableTimestampConverter() DateTime? endDate,@TimestampConverter() DateTime? createdAt, int timesSold, int unitsSold, num totalRevenue, num totalDiscountGiven
});




}
/// @nodoc
class _$OfferCopyWithImpl<$Res>
    implements $OfferCopyWith<$Res> {
  _$OfferCopyWithImpl(this._self, this._then);

  final Offer _self;
  final $Res Function(Offer) _then;

/// Create a copy of Offer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? imageUrl = null,Object? imagePath = null,Object? items = null,Object? offerPrice = null,Object? isActive = null,Object? startDate = freezed,Object? endDate = freezed,Object? createdAt = freezed,Object? timesSold = null,Object? unitsSold = null,Object? totalRevenue = null,Object? totalDiscountGiven = null,}) {
  return _then(Offer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OfferItem>,offerPrice: null == offerPrice ? _self.offerPrice : offerPrice // ignore: cast_nullable_to_non_nullable
as num,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,timesSold: null == timesSold ? _self.timesSold : timesSold // ignore: cast_nullable_to_non_nullable
as int,unitsSold: null == unitsSold ? _self.unitsSold : unitsSold // ignore: cast_nullable_to_non_nullable
as int,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as num,totalDiscountGiven: null == totalDiscountGiven ? _self.totalDiscountGiven : totalDiscountGiven // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [Offer].
extension OfferPatterns on Offer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Offer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Offer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Offer value)  $default,){
final _that = this;
switch (_that) {
case _Offer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Offer value)?  $default,){
final _that = this;
switch (_that) {
case _Offer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String imageUrl,  String imagePath,  List<OfferItem> items,  num offerPrice,  bool isActive, @NullableTimestampConverter()  DateTime? startDate, @NullableTimestampConverter()  DateTime? endDate, @TimestampConverter()  DateTime? createdAt,  int timesSold,  int unitsSold,  num totalRevenue,  num totalDiscountGiven)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Offer() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.imageUrl,_that.imagePath,_that.items,_that.offerPrice,_that.isActive,_that.startDate,_that.endDate,_that.createdAt,_that.timesSold,_that.unitsSold,_that.totalRevenue,_that.totalDiscountGiven);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String imageUrl,  String imagePath,  List<OfferItem> items,  num offerPrice,  bool isActive, @NullableTimestampConverter()  DateTime? startDate, @NullableTimestampConverter()  DateTime? endDate, @TimestampConverter()  DateTime? createdAt,  int timesSold,  int unitsSold,  num totalRevenue,  num totalDiscountGiven)  $default,) {final _that = this;
switch (_that) {
case _Offer():
return $default(_that.id,_that.title,_that.description,_that.imageUrl,_that.imagePath,_that.items,_that.offerPrice,_that.isActive,_that.startDate,_that.endDate,_that.createdAt,_that.timesSold,_that.unitsSold,_that.totalRevenue,_that.totalDiscountGiven);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  String imageUrl,  String imagePath,  List<OfferItem> items,  num offerPrice,  bool isActive, @NullableTimestampConverter()  DateTime? startDate, @NullableTimestampConverter()  DateTime? endDate, @TimestampConverter()  DateTime? createdAt,  int timesSold,  int unitsSold,  num totalRevenue,  num totalDiscountGiven)?  $default,) {final _that = this;
switch (_that) {
case _Offer() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.imageUrl,_that.imagePath,_that.items,_that.offerPrice,_that.isActive,_that.startDate,_that.endDate,_that.createdAt,_that.timesSold,_that.unitsSold,_that.totalRevenue,_that.totalDiscountGiven);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Offer extends Offer {
  const _Offer({required this.id, required this.title, this.description = '', this.imageUrl = '', this.imagePath = '',  List<OfferItem> items = const <OfferItem>[], this.offerPrice = 0, this.isActive = true, @NullableTimestampConverter() this.startDate, @NullableTimestampConverter() this.endDate, @TimestampConverter() this.createdAt, this.timesSold = 0, this.unitsSold = 0, this.totalRevenue = 0, this.totalDiscountGiven = 0}): _items = items,super._();
  factory _Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  String imageUrl;
@override@JsonKey() final  String imagePath;
 final  List<OfferItem> _items;
@override@JsonKey() List<OfferItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  num offerPrice;
@override@JsonKey() final  bool isActive;
@override@NullableTimestampConverter() final  DateTime? startDate;
@override@NullableTimestampConverter() final  DateTime? endDate;
@override@TimestampConverter() final  DateTime? createdAt;
@override@JsonKey() final  int timesSold;
@override@JsonKey() final  int unitsSold;
@override@JsonKey() final  num totalRevenue;
@override@JsonKey() final  num totalDiscountGiven;

/// Create a copy of Offer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferCopyWith<_Offer> get copyWith => __$OfferCopyWithImpl<_Offer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfferToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Offer&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.offerPrice, offerPrice) || other.offerPrice == offerPrice)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.timesSold, timesSold) || other.timesSold == timesSold)&&(identical(other.unitsSold, unitsSold) || other.unitsSold == unitsSold)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.totalDiscountGiven, totalDiscountGiven) || other.totalDiscountGiven == totalDiscountGiven));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,imageUrl,imagePath,const DeepCollectionEquality().hash(_items),offerPrice,isActive,startDate,endDate,createdAt,timesSold,unitsSold,totalRevenue,totalDiscountGiven);

@override
String toString() {
  return 'Offer(id: $id, title: $title, description: $description, imageUrl: $imageUrl, imagePath: $imagePath, items: $items, offerPrice: $offerPrice, isActive: $isActive, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, timesSold: $timesSold, unitsSold: $unitsSold, totalRevenue: $totalRevenue, totalDiscountGiven: $totalDiscountGiven)';
}


}

/// @nodoc
abstract mixin class _$OfferCopyWith<$Res> implements $OfferCopyWith<$Res> {
  factory _$OfferCopyWith(_Offer value, $Res Function(_Offer) _then) = __$OfferCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, String imageUrl, String imagePath, List<OfferItem> items, num offerPrice, bool isActive,@NullableTimestampConverter() DateTime? startDate,@NullableTimestampConverter() DateTime? endDate,@TimestampConverter() DateTime? createdAt, int timesSold, int unitsSold, num totalRevenue, num totalDiscountGiven
});




}
/// @nodoc
class __$OfferCopyWithImpl<$Res>
    implements _$OfferCopyWith<$Res> {
  __$OfferCopyWithImpl(this._self, this._then);

  final _Offer _self;
  final $Res Function(_Offer) _then;

/// Create a copy of Offer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? imageUrl = null,Object? imagePath = null,Object? items = null,Object? offerPrice = null,Object? isActive = null,Object? startDate = freezed,Object? endDate = freezed,Object? createdAt = freezed,Object? timesSold = null,Object? unitsSold = null,Object? totalRevenue = null,Object? totalDiscountGiven = null,}) {
  return _then(_Offer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OfferItem>,offerPrice: null == offerPrice ? _self.offerPrice : offerPrice // ignore: cast_nullable_to_non_nullable
as num,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,timesSold: null == timesSold ? _self.timesSold : timesSold // ignore: cast_nullable_to_non_nullable
as int,unitsSold: null == unitsSold ? _self.unitsSold : unitsSold // ignore: cast_nullable_to_non_nullable
as int,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as num,totalDiscountGiven: null == totalDiscountGiven ? _self.totalDiscountGiven : totalDiscountGiven // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}

// dart format on
