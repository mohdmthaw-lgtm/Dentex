// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItem {

 String get productId; String get productName; String get productImageUrl; String get variantId; String get variantLabel; num get unitSellPrice; int get quantity; num get lineTotal; String? get offerId; String? get offerName;
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemCopyWith<OrderItem> get copyWith => _$OrderItemCopyWithImpl<OrderItem>(this as OrderItem, _$identity);

  /// Serializes this OrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productImageUrl, productImageUrl) || other.productImageUrl == productImageUrl)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.variantLabel, variantLabel) || other.variantLabel == variantLabel)&&(identical(other.unitSellPrice, unitSellPrice) || other.unitSellPrice == unitSellPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&(identical(other.offerId, offerId) || other.offerId == offerId)&&(identical(other.offerName, offerName) || other.offerName == offerName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,productName,productImageUrl,variantId,variantLabel,unitSellPrice,quantity,lineTotal,offerId,offerName);

@override
String toString() {
  return 'OrderItem(productId: $productId, productName: $productName, productImageUrl: $productImageUrl, variantId: $variantId, variantLabel: $variantLabel, unitSellPrice: $unitSellPrice, quantity: $quantity, lineTotal: $lineTotal, offerId: $offerId, offerName: $offerName)';
}


}

/// @nodoc
abstract mixin class $OrderItemCopyWith<$Res>  {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) _then) = _$OrderItemCopyWithImpl;
@useResult
$Res call({
 String productId, String productName, String productImageUrl, String variantId, String variantLabel, num unitSellPrice, int quantity, num lineTotal, String? offerId, String? offerName
});




}
/// @nodoc
class _$OrderItemCopyWithImpl<$Res>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._self, this._then);

  final OrderItem _self;
  final $Res Function(OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? productName = null,Object? productImageUrl = null,Object? variantId = null,Object? variantLabel = null,Object? unitSellPrice = null,Object? quantity = null,Object? lineTotal = null,Object? offerId = freezed,Object? offerName = freezed,}) {
  return _then(OrderItem(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productImageUrl: null == productImageUrl ? _self.productImageUrl : productImageUrl // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,unitSellPrice: null == unitSellPrice ? _self.unitSellPrice : unitSellPrice // ignore: cast_nullable_to_non_nullable
as num,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as num,offerId: freezed == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String?,offerName: freezed == offerName ? _self.offerName : offerName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItem].
extension OrderItemPatterns on OrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productId,  String productName,  String productImageUrl,  String variantId,  String variantLabel,  num unitSellPrice,  int quantity,  num lineTotal,  String? offerId,  String? offerName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.productId,_that.productName,_that.productImageUrl,_that.variantId,_that.variantLabel,_that.unitSellPrice,_that.quantity,_that.lineTotal,_that.offerId,_that.offerName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productId,  String productName,  String productImageUrl,  String variantId,  String variantLabel,  num unitSellPrice,  int quantity,  num lineTotal,  String? offerId,  String? offerName)  $default,) {final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that.productId,_that.productName,_that.productImageUrl,_that.variantId,_that.variantLabel,_that.unitSellPrice,_that.quantity,_that.lineTotal,_that.offerId,_that.offerName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productId,  String productName,  String productImageUrl,  String variantId,  String variantLabel,  num unitSellPrice,  int quantity,  num lineTotal,  String? offerId,  String? offerName)?  $default,) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.productId,_that.productName,_that.productImageUrl,_that.variantId,_that.variantLabel,_that.unitSellPrice,_that.quantity,_that.lineTotal,_that.offerId,_that.offerName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItem implements OrderItem {
  const _OrderItem({required this.productId, required this.productName, this.productImageUrl = '', required this.variantId, required this.variantLabel, required this.unitSellPrice, required this.quantity, required this.lineTotal, this.offerId, this.offerName});
  factory _OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

@override final  String productId;
@override final  String productName;
@override@JsonKey() final  String productImageUrl;
@override final  String variantId;
@override final  String variantLabel;
@override final  num unitSellPrice;
@override final  int quantity;
@override final  num lineTotal;
@override final  String? offerId;
@override final  String? offerName;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemCopyWith<_OrderItem> get copyWith => __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productImageUrl, productImageUrl) || other.productImageUrl == productImageUrl)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.variantLabel, variantLabel) || other.variantLabel == variantLabel)&&(identical(other.unitSellPrice, unitSellPrice) || other.unitSellPrice == unitSellPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&(identical(other.offerId, offerId) || other.offerId == offerId)&&(identical(other.offerName, offerName) || other.offerName == offerName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,productName,productImageUrl,variantId,variantLabel,unitSellPrice,quantity,lineTotal,offerId,offerName);

@override
String toString() {
  return 'OrderItem(productId: $productId, productName: $productName, productImageUrl: $productImageUrl, variantId: $variantId, variantLabel: $variantLabel, unitSellPrice: $unitSellPrice, quantity: $quantity, lineTotal: $lineTotal, offerId: $offerId, offerName: $offerName)';
}


}

/// @nodoc
abstract mixin class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(_OrderItem value, $Res Function(_OrderItem) _then) = __$OrderItemCopyWithImpl;
@override @useResult
$Res call({
 String productId, String productName, String productImageUrl, String variantId, String variantLabel, num unitSellPrice, int quantity, num lineTotal, String? offerId, String? offerName
});




}
/// @nodoc
class __$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(this._self, this._then);

  final _OrderItem _self;
  final $Res Function(_OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? productName = null,Object? productImageUrl = null,Object? variantId = null,Object? variantLabel = null,Object? unitSellPrice = null,Object? quantity = null,Object? lineTotal = null,Object? offerId = freezed,Object? offerName = freezed,}) {
  return _then(_OrderItem(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productImageUrl: null == productImageUrl ? _self.productImageUrl : productImageUrl // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,variantLabel: null == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String,unitSellPrice: null == unitSellPrice ? _self.unitSellPrice : unitSellPrice // ignore: cast_nullable_to_non_nullable
as num,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as num,offerId: freezed == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String?,offerName: freezed == offerName ? _self.offerName : offerName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Order {

 String get id; String get doctorId; String get doctorNameSnapshot; String get doctorPhoneSnapshot; String get createdBy; String get createdByUid; String get status; List<OrderItem> get items; num get subtotalAmount; num get discountRate; num get discountAmount; num get totalAmount; num get amountPaid; num get amountRemaining; String get paymentStatus; String get notes;@TimestampConverter() DateTime? get createdAt;@TimestampConverter() DateTime? get updatedAt;@NullableTimestampConverter() DateTime? get completedAt;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorNameSnapshot, doctorNameSnapshot) || other.doctorNameSnapshot == doctorNameSnapshot)&&(identical(other.doctorPhoneSnapshot, doctorPhoneSnapshot) || other.doctorPhoneSnapshot == doctorPhoneSnapshot)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByUid, createdByUid) || other.createdByUid == createdByUid)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.subtotalAmount, subtotalAmount) || other.subtotalAmount == subtotalAmount)&&(identical(other.discountRate, discountRate) || other.discountRate == discountRate)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.amountRemaining, amountRemaining) || other.amountRemaining == amountRemaining)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,doctorId,doctorNameSnapshot,doctorPhoneSnapshot,createdBy,createdByUid,status,const DeepCollectionEquality().hash(items),subtotalAmount,discountRate,discountAmount,totalAmount,amountPaid,amountRemaining,paymentStatus,notes,createdAt,updatedAt,completedAt]);

@override
String toString() {
  return 'Order(id: $id, doctorId: $doctorId, doctorNameSnapshot: $doctorNameSnapshot, doctorPhoneSnapshot: $doctorPhoneSnapshot, createdBy: $createdBy, createdByUid: $createdByUid, status: $status, items: $items, subtotalAmount: $subtotalAmount, discountRate: $discountRate, discountAmount: $discountAmount, totalAmount: $totalAmount, amountPaid: $amountPaid, amountRemaining: $amountRemaining, paymentStatus: $paymentStatus, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String id, String doctorId, String doctorNameSnapshot, String doctorPhoneSnapshot, String createdBy, String createdByUid, String status, List<OrderItem> items, num subtotalAmount, num discountRate, num discountAmount, num totalAmount, num amountPaid, num amountRemaining, String paymentStatus, String notes,@TimestampConverter() DateTime? createdAt,@TimestampConverter() DateTime? updatedAt,@NullableTimestampConverter() DateTime? completedAt
});




}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? doctorId = null,Object? doctorNameSnapshot = null,Object? doctorPhoneSnapshot = null,Object? createdBy = null,Object? createdByUid = null,Object? status = null,Object? items = null,Object? subtotalAmount = null,Object? discountRate = null,Object? discountAmount = null,Object? totalAmount = null,Object? amountPaid = null,Object? amountRemaining = null,Object? paymentStatus = null,Object? notes = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? completedAt = freezed,}) {
  return _then(Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorNameSnapshot: null == doctorNameSnapshot ? _self.doctorNameSnapshot : doctorNameSnapshot // ignore: cast_nullable_to_non_nullable
as String,doctorPhoneSnapshot: null == doctorPhoneSnapshot ? _self.doctorPhoneSnapshot : doctorPhoneSnapshot // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdByUid: null == createdByUid ? _self.createdByUid : createdByUid // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,subtotalAmount: null == subtotalAmount ? _self.subtotalAmount : subtotalAmount // ignore: cast_nullable_to_non_nullable
as num,discountRate: null == discountRate ? _self.discountRate : discountRate // ignore: cast_nullable_to_non_nullable
as num,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as num,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as num,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as num,amountRemaining: null == amountRemaining ? _self.amountRemaining : amountRemaining // ignore: cast_nullable_to_non_nullable
as num,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String doctorId,  String doctorNameSnapshot,  String doctorPhoneSnapshot,  String createdBy,  String createdByUid,  String status,  List<OrderItem> items,  num subtotalAmount,  num discountRate,  num discountAmount,  num totalAmount,  num amountPaid,  num amountRemaining,  String paymentStatus,  String notes, @TimestampConverter()  DateTime? createdAt, @TimestampConverter()  DateTime? updatedAt, @NullableTimestampConverter()  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.doctorId,_that.doctorNameSnapshot,_that.doctorPhoneSnapshot,_that.createdBy,_that.createdByUid,_that.status,_that.items,_that.subtotalAmount,_that.discountRate,_that.discountAmount,_that.totalAmount,_that.amountPaid,_that.amountRemaining,_that.paymentStatus,_that.notes,_that.createdAt,_that.updatedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String doctorId,  String doctorNameSnapshot,  String doctorPhoneSnapshot,  String createdBy,  String createdByUid,  String status,  List<OrderItem> items,  num subtotalAmount,  num discountRate,  num discountAmount,  num totalAmount,  num amountPaid,  num amountRemaining,  String paymentStatus,  String notes, @TimestampConverter()  DateTime? createdAt, @TimestampConverter()  DateTime? updatedAt, @NullableTimestampConverter()  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.doctorId,_that.doctorNameSnapshot,_that.doctorPhoneSnapshot,_that.createdBy,_that.createdByUid,_that.status,_that.items,_that.subtotalAmount,_that.discountRate,_that.discountAmount,_that.totalAmount,_that.amountPaid,_that.amountRemaining,_that.paymentStatus,_that.notes,_that.createdAt,_that.updatedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String doctorId,  String doctorNameSnapshot,  String doctorPhoneSnapshot,  String createdBy,  String createdByUid,  String status,  List<OrderItem> items,  num subtotalAmount,  num discountRate,  num discountAmount,  num totalAmount,  num amountPaid,  num amountRemaining,  String paymentStatus,  String notes, @TimestampConverter()  DateTime? createdAt, @TimestampConverter()  DateTime? updatedAt, @NullableTimestampConverter()  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.doctorId,_that.doctorNameSnapshot,_that.doctorPhoneSnapshot,_that.createdBy,_that.createdByUid,_that.status,_that.items,_that.subtotalAmount,_that.discountRate,_that.discountAmount,_that.totalAmount,_that.amountPaid,_that.amountRemaining,_that.paymentStatus,_that.notes,_that.createdAt,_that.updatedAt,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Order extends Order {
  const _Order({required this.id, required this.doctorId, required this.doctorNameSnapshot, this.doctorPhoneSnapshot = '', required this.createdBy, required this.createdByUid, this.status = 'waiting',  List<OrderItem> items = const <OrderItem>[], this.subtotalAmount = 0, this.discountRate = 0, this.discountAmount = 0, this.totalAmount = 0, this.amountPaid = 0, this.amountRemaining = 0, this.paymentStatus = 'unpaid', this.notes = '', @TimestampConverter() this.createdAt, @TimestampConverter() this.updatedAt, @NullableTimestampConverter() this.completedAt}): _items = items,super._();
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override final  String id;
@override final  String doctorId;
@override final  String doctorNameSnapshot;
@override@JsonKey() final  String doctorPhoneSnapshot;
@override final  String createdBy;
@override final  String createdByUid;
@override@JsonKey() final  String status;
 final  List<OrderItem> _items;
@override@JsonKey() List<OrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  num subtotalAmount;
@override@JsonKey() final  num discountRate;
@override@JsonKey() final  num discountAmount;
@override@JsonKey() final  num totalAmount;
@override@JsonKey() final  num amountPaid;
@override@JsonKey() final  num amountRemaining;
@override@JsonKey() final  String paymentStatus;
@override@JsonKey() final  String notes;
@override@TimestampConverter() final  DateTime? createdAt;
@override@TimestampConverter() final  DateTime? updatedAt;
@override@NullableTimestampConverter() final  DateTime? completedAt;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctorNameSnapshot, doctorNameSnapshot) || other.doctorNameSnapshot == doctorNameSnapshot)&&(identical(other.doctorPhoneSnapshot, doctorPhoneSnapshot) || other.doctorPhoneSnapshot == doctorPhoneSnapshot)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByUid, createdByUid) || other.createdByUid == createdByUid)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.subtotalAmount, subtotalAmount) || other.subtotalAmount == subtotalAmount)&&(identical(other.discountRate, discountRate) || other.discountRate == discountRate)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.amountRemaining, amountRemaining) || other.amountRemaining == amountRemaining)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,doctorId,doctorNameSnapshot,doctorPhoneSnapshot,createdBy,createdByUid,status,const DeepCollectionEquality().hash(_items),subtotalAmount,discountRate,discountAmount,totalAmount,amountPaid,amountRemaining,paymentStatus,notes,createdAt,updatedAt,completedAt]);

@override
String toString() {
  return 'Order(id: $id, doctorId: $doctorId, doctorNameSnapshot: $doctorNameSnapshot, doctorPhoneSnapshot: $doctorPhoneSnapshot, createdBy: $createdBy, createdByUid: $createdByUid, status: $status, items: $items, subtotalAmount: $subtotalAmount, discountRate: $discountRate, discountAmount: $discountAmount, totalAmount: $totalAmount, amountPaid: $amountPaid, amountRemaining: $amountRemaining, paymentStatus: $paymentStatus, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String id, String doctorId, String doctorNameSnapshot, String doctorPhoneSnapshot, String createdBy, String createdByUid, String status, List<OrderItem> items, num subtotalAmount, num discountRate, num discountAmount, num totalAmount, num amountPaid, num amountRemaining, String paymentStatus, String notes,@TimestampConverter() DateTime? createdAt,@TimestampConverter() DateTime? updatedAt,@NullableTimestampConverter() DateTime? completedAt
});




}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? doctorId = null,Object? doctorNameSnapshot = null,Object? doctorPhoneSnapshot = null,Object? createdBy = null,Object? createdByUid = null,Object? status = null,Object? items = null,Object? subtotalAmount = null,Object? discountRate = null,Object? discountAmount = null,Object? totalAmount = null,Object? amountPaid = null,Object? amountRemaining = null,Object? paymentStatus = null,Object? notes = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? completedAt = freezed,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String,doctorNameSnapshot: null == doctorNameSnapshot ? _self.doctorNameSnapshot : doctorNameSnapshot // ignore: cast_nullable_to_non_nullable
as String,doctorPhoneSnapshot: null == doctorPhoneSnapshot ? _self.doctorPhoneSnapshot : doctorPhoneSnapshot // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdByUid: null == createdByUid ? _self.createdByUid : createdByUid // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,subtotalAmount: null == subtotalAmount ? _self.subtotalAmount : subtotalAmount // ignore: cast_nullable_to_non_nullable
as num,discountRate: null == discountRate ? _self.discountRate : discountRate // ignore: cast_nullable_to_non_nullable
as num,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as num,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as num,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as num,amountRemaining: null == amountRemaining ? _self.amountRemaining : amountRemaining // ignore: cast_nullable_to_non_nullable
as num,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Payment {

 String get id; num get amount; String get method; String get recordedByUid;@TimestampConverter() DateTime? get recordedAt; String get note;
/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCopyWith<Payment> get copyWith => _$PaymentCopyWithImpl<Payment>(this as Payment, _$identity);

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.method, method) || other.method == method)&&(identical(other.recordedByUid, recordedByUid) || other.recordedByUid == recordedByUid)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,method,recordedByUid,recordedAt,note);

@override
String toString() {
  return 'Payment(id: $id, amount: $amount, method: $method, recordedByUid: $recordedByUid, recordedAt: $recordedAt, note: $note)';
}


}

/// @nodoc
abstract mixin class $PaymentCopyWith<$Res>  {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) _then) = _$PaymentCopyWithImpl;
@useResult
$Res call({
 String id, num amount, String method, String recordedByUid,@TimestampConverter() DateTime? recordedAt, String note
});




}
/// @nodoc
class _$PaymentCopyWithImpl<$Res>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._self, this._then);

  final Payment _self;
  final $Res Function(Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,Object? method = null,Object? recordedByUid = null,Object? recordedAt = freezed,Object? note = null,}) {
  return _then(Payment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,recordedByUid: null == recordedByUid ? _self.recordedByUid : recordedByUid // ignore: cast_nullable_to_non_nullable
as String,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Payment].
extension PaymentPatterns on Payment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Payment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Payment value)  $default,){
final _that = this;
switch (_that) {
case _Payment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Payment value)?  $default,){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  num amount,  String method,  String recordedByUid, @TimestampConverter()  DateTime? recordedAt,  String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.amount,_that.method,_that.recordedByUid,_that.recordedAt,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  num amount,  String method,  String recordedByUid, @TimestampConverter()  DateTime? recordedAt,  String note)  $default,) {final _that = this;
switch (_that) {
case _Payment():
return $default(_that.id,_that.amount,_that.method,_that.recordedByUid,_that.recordedAt,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  num amount,  String method,  String recordedByUid, @TimestampConverter()  DateTime? recordedAt,  String note)?  $default,) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.amount,_that.method,_that.recordedByUid,_that.recordedAt,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Payment implements Payment {
  const _Payment({required this.id, required this.amount, this.method = 'cash', required this.recordedByUid, @TimestampConverter() this.recordedAt, this.note = ''});
  factory _Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

@override final  String id;
@override final  num amount;
@override@JsonKey() final  String method;
@override final  String recordedByUid;
@override@TimestampConverter() final  DateTime? recordedAt;
@override@JsonKey() final  String note;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCopyWith<_Payment> get copyWith => __$PaymentCopyWithImpl<_Payment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.method, method) || other.method == method)&&(identical(other.recordedByUid, recordedByUid) || other.recordedByUid == recordedByUid)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,method,recordedByUid,recordedAt,note);

@override
String toString() {
  return 'Payment(id: $id, amount: $amount, method: $method, recordedByUid: $recordedByUid, recordedAt: $recordedAt, note: $note)';
}


}

/// @nodoc
abstract mixin class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) _then) = __$PaymentCopyWithImpl;
@override @useResult
$Res call({
 String id, num amount, String method, String recordedByUid,@TimestampConverter() DateTime? recordedAt, String note
});




}
/// @nodoc
class __$PaymentCopyWithImpl<$Res>
    implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(this._self, this._then);

  final _Payment _self;
  final $Res Function(_Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,Object? method = null,Object? recordedByUid = null,Object? recordedAt = freezed,Object? note = null,}) {
  return _then(_Payment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,recordedByUid: null == recordedByUid ? _self.recordedByUid : recordedByUid // ignore: cast_nullable_to_non_nullable
as String,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProfitDataSummary {

 List<ProfitLineItem> get items; num get totalCost; num get totalProfit;
/// Create a copy of ProfitDataSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitDataSummaryCopyWith<ProfitDataSummary> get copyWith => _$ProfitDataSummaryCopyWithImpl<ProfitDataSummary>(this as ProfitDataSummary, _$identity);

  /// Serializes this ProfitDataSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitDataSummary&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&(identical(other.totalProfit, totalProfit) || other.totalProfit == totalProfit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),totalCost,totalProfit);

@override
String toString() {
  return 'ProfitDataSummary(items: $items, totalCost: $totalCost, totalProfit: $totalProfit)';
}


}

/// @nodoc
abstract mixin class $ProfitDataSummaryCopyWith<$Res>  {
  factory $ProfitDataSummaryCopyWith(ProfitDataSummary value, $Res Function(ProfitDataSummary) _then) = _$ProfitDataSummaryCopyWithImpl;
@useResult
$Res call({
 List<ProfitLineItem> items, num totalCost, num totalProfit
});




}
/// @nodoc
class _$ProfitDataSummaryCopyWithImpl<$Res>
    implements $ProfitDataSummaryCopyWith<$Res> {
  _$ProfitDataSummaryCopyWithImpl(this._self, this._then);

  final ProfitDataSummary _self;
  final $Res Function(ProfitDataSummary) _then;

/// Create a copy of ProfitDataSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? totalCost = null,Object? totalProfit = null,}) {
  return _then(ProfitDataSummary(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProfitLineItem>,totalCost: null == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as num,totalProfit: null == totalProfit ? _self.totalProfit : totalProfit // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfitDataSummary].
extension ProfitDataSummaryPatterns on ProfitDataSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitDataSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitDataSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitDataSummary value)  $default,){
final _that = this;
switch (_that) {
case _ProfitDataSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitDataSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitDataSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProfitLineItem> items,  num totalCost,  num totalProfit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitDataSummary() when $default != null:
return $default(_that.items,_that.totalCost,_that.totalProfit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProfitLineItem> items,  num totalCost,  num totalProfit)  $default,) {final _that = this;
switch (_that) {
case _ProfitDataSummary():
return $default(_that.items,_that.totalCost,_that.totalProfit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProfitLineItem> items,  num totalCost,  num totalProfit)?  $default,) {final _that = this;
switch (_that) {
case _ProfitDataSummary() when $default != null:
return $default(_that.items,_that.totalCost,_that.totalProfit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfitDataSummary implements ProfitDataSummary {
  const _ProfitDataSummary({ List<ProfitLineItem> items = const <ProfitLineItem>[], this.totalCost = 0, this.totalProfit = 0}): _items = items;
  factory _ProfitDataSummary.fromJson(Map<String, dynamic> json) => _$ProfitDataSummaryFromJson(json);

 final  List<ProfitLineItem> _items;
@override@JsonKey() List<ProfitLineItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  num totalCost;
@override@JsonKey() final  num totalProfit;

/// Create a copy of ProfitDataSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitDataSummaryCopyWith<_ProfitDataSummary> get copyWith => __$ProfitDataSummaryCopyWithImpl<_ProfitDataSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfitDataSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitDataSummary&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&(identical(other.totalProfit, totalProfit) || other.totalProfit == totalProfit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),totalCost,totalProfit);

@override
String toString() {
  return 'ProfitDataSummary(items: $items, totalCost: $totalCost, totalProfit: $totalProfit)';
}


}

/// @nodoc
abstract mixin class _$ProfitDataSummaryCopyWith<$Res> implements $ProfitDataSummaryCopyWith<$Res> {
  factory _$ProfitDataSummaryCopyWith(_ProfitDataSummary value, $Res Function(_ProfitDataSummary) _then) = __$ProfitDataSummaryCopyWithImpl;
@override @useResult
$Res call({
 List<ProfitLineItem> items, num totalCost, num totalProfit
});




}
/// @nodoc
class __$ProfitDataSummaryCopyWithImpl<$Res>
    implements _$ProfitDataSummaryCopyWith<$Res> {
  __$ProfitDataSummaryCopyWithImpl(this._self, this._then);

  final _ProfitDataSummary _self;
  final $Res Function(_ProfitDataSummary) _then;

/// Create a copy of ProfitDataSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? totalCost = null,Object? totalProfit = null,}) {
  return _then(_ProfitDataSummary(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProfitLineItem>,totalCost: null == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as num,totalProfit: null == totalProfit ? _self.totalProfit : totalProfit // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}


/// @nodoc
mixin _$ProfitLineItem {

 String get variantId; num get unitCostPrice; num get lineProfit;
/// Create a copy of ProfitLineItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitLineItemCopyWith<ProfitLineItem> get copyWith => _$ProfitLineItemCopyWithImpl<ProfitLineItem>(this as ProfitLineItem, _$identity);

  /// Serializes this ProfitLineItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitLineItem&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.unitCostPrice, unitCostPrice) || other.unitCostPrice == unitCostPrice)&&(identical(other.lineProfit, lineProfit) || other.lineProfit == lineProfit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variantId,unitCostPrice,lineProfit);

@override
String toString() {
  return 'ProfitLineItem(variantId: $variantId, unitCostPrice: $unitCostPrice, lineProfit: $lineProfit)';
}


}

/// @nodoc
abstract mixin class $ProfitLineItemCopyWith<$Res>  {
  factory $ProfitLineItemCopyWith(ProfitLineItem value, $Res Function(ProfitLineItem) _then) = _$ProfitLineItemCopyWithImpl;
@useResult
$Res call({
 String variantId, num unitCostPrice, num lineProfit
});




}
/// @nodoc
class _$ProfitLineItemCopyWithImpl<$Res>
    implements $ProfitLineItemCopyWith<$Res> {
  _$ProfitLineItemCopyWithImpl(this._self, this._then);

  final ProfitLineItem _self;
  final $Res Function(ProfitLineItem) _then;

/// Create a copy of ProfitLineItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variantId = null,Object? unitCostPrice = null,Object? lineProfit = null,}) {
  return _then(ProfitLineItem(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,unitCostPrice: null == unitCostPrice ? _self.unitCostPrice : unitCostPrice // ignore: cast_nullable_to_non_nullable
as num,lineProfit: null == lineProfit ? _self.lineProfit : lineProfit // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfitLineItem].
extension ProfitLineItemPatterns on ProfitLineItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitLineItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitLineItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitLineItem value)  $default,){
final _that = this;
switch (_that) {
case _ProfitLineItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitLineItem value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitLineItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String variantId,  num unitCostPrice,  num lineProfit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitLineItem() when $default != null:
return $default(_that.variantId,_that.unitCostPrice,_that.lineProfit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String variantId,  num unitCostPrice,  num lineProfit)  $default,) {final _that = this;
switch (_that) {
case _ProfitLineItem():
return $default(_that.variantId,_that.unitCostPrice,_that.lineProfit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String variantId,  num unitCostPrice,  num lineProfit)?  $default,) {final _that = this;
switch (_that) {
case _ProfitLineItem() when $default != null:
return $default(_that.variantId,_that.unitCostPrice,_that.lineProfit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfitLineItem implements ProfitLineItem {
  const _ProfitLineItem({required this.variantId, required this.unitCostPrice, required this.lineProfit});
  factory _ProfitLineItem.fromJson(Map<String, dynamic> json) => _$ProfitLineItemFromJson(json);

@override final  String variantId;
@override final  num unitCostPrice;
@override final  num lineProfit;

/// Create a copy of ProfitLineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitLineItemCopyWith<_ProfitLineItem> get copyWith => __$ProfitLineItemCopyWithImpl<_ProfitLineItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfitLineItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitLineItem&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.unitCostPrice, unitCostPrice) || other.unitCostPrice == unitCostPrice)&&(identical(other.lineProfit, lineProfit) || other.lineProfit == lineProfit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variantId,unitCostPrice,lineProfit);

@override
String toString() {
  return 'ProfitLineItem(variantId: $variantId, unitCostPrice: $unitCostPrice, lineProfit: $lineProfit)';
}


}

/// @nodoc
abstract mixin class _$ProfitLineItemCopyWith<$Res> implements $ProfitLineItemCopyWith<$Res> {
  factory _$ProfitLineItemCopyWith(_ProfitLineItem value, $Res Function(_ProfitLineItem) _then) = __$ProfitLineItemCopyWithImpl;
@override @useResult
$Res call({
 String variantId, num unitCostPrice, num lineProfit
});




}
/// @nodoc
class __$ProfitLineItemCopyWithImpl<$Res>
    implements _$ProfitLineItemCopyWith<$Res> {
  __$ProfitLineItemCopyWithImpl(this._self, this._then);

  final _ProfitLineItem _self;
  final $Res Function(_ProfitLineItem) _then;

/// Create a copy of ProfitLineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variantId = null,Object? unitCostPrice = null,Object? lineProfit = null,}) {
  return _then(_ProfitLineItem(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,unitCostPrice: null == unitCostPrice ? _self.unitCostPrice : unitCostPrice // ignore: cast_nullable_to_non_nullable
as num,lineProfit: null == lineProfit ? _self.lineProfit : lineProfit // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}

// dart format on
