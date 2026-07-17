// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
  String get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get variantId => throw _privateConstructorUsedError;
  String get variantLabel => throw _privateConstructorUsedError;
  num get unitSellPrice => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  num get lineTotal => throw _privateConstructorUsedError;

  /// Serializes this OrderItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call(
      {String productId,
      String productName,
      String variantId,
      String variantLabel,
      num unitSellPrice,
      int quantity,
      num lineTotal});
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? variantId = null,
    Object? variantLabel = null,
    Object? unitSellPrice = null,
    Object? quantity = null,
    Object? lineTotal = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String,
      variantLabel: null == variantLabel
          ? _value.variantLabel
          : variantLabel // ignore: cast_nullable_to_non_nullable
              as String,
      unitSellPrice: null == unitSellPrice
          ? _value.unitSellPrice
          : unitSellPrice // ignore: cast_nullable_to_non_nullable
              as num,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      lineTotal: null == lineTotal
          ? _value.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemImplCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$$OrderItemImplCopyWith(
          _$OrderItemImpl value, $Res Function(_$OrderItemImpl) then) =
      __$$OrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String productName,
      String variantId,
      String variantLabel,
      num unitSellPrice,
      int quantity,
      num lineTotal});
}

/// @nodoc
class __$$OrderItemImplCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$OrderItemImpl>
    implements _$$OrderItemImplCopyWith<$Res> {
  __$$OrderItemImplCopyWithImpl(
      _$OrderItemImpl _value, $Res Function(_$OrderItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? variantId = null,
    Object? variantLabel = null,
    Object? unitSellPrice = null,
    Object? quantity = null,
    Object? lineTotal = null,
  }) {
    return _then(_$OrderItemImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String,
      variantLabel: null == variantLabel
          ? _value.variantLabel
          : variantLabel // ignore: cast_nullable_to_non_nullable
              as String,
      unitSellPrice: null == unitSellPrice
          ? _value.unitSellPrice
          : unitSellPrice // ignore: cast_nullable_to_non_nullable
              as num,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      lineTotal: null == lineTotal
          ? _value.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemImpl implements _OrderItem {
  const _$OrderItemImpl(
      {required this.productId,
      required this.productName,
      required this.variantId,
      required this.variantLabel,
      required this.unitSellPrice,
      required this.quantity,
      required this.lineTotal});

  factory _$OrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemImplFromJson(json);

  @override
  final String productId;
  @override
  final String productName;
  @override
  final String variantId;
  @override
  final String variantLabel;
  @override
  final num unitSellPrice;
  @override
  final int quantity;
  @override
  final num lineTotal;

  @override
  String toString() {
    return 'OrderItem(productId: $productId, productName: $productName, variantId: $variantId, variantLabel: $variantLabel, unitSellPrice: $unitSellPrice, quantity: $quantity, lineTotal: $lineTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.variantLabel, variantLabel) ||
                other.variantLabel == variantLabel) &&
            (identical(other.unitSellPrice, unitSellPrice) ||
                other.unitSellPrice == unitSellPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.lineTotal, lineTotal) ||
                other.lineTotal == lineTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, productName,
      variantId, variantLabel, unitSellPrice, quantity, lineTotal);

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      __$$OrderItemImplCopyWithImpl<_$OrderItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemImplToJson(
      this,
    );
  }
}

abstract class _OrderItem implements OrderItem {
  const factory _OrderItem(
      {required final String productId,
      required final String productName,
      required final String variantId,
      required final String variantLabel,
      required final num unitSellPrice,
      required final int quantity,
      required final num lineTotal}) = _$OrderItemImpl;

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$OrderItemImpl.fromJson;

  @override
  String get productId;
  @override
  String get productName;
  @override
  String get variantId;
  @override
  String get variantLabel;
  @override
  num get unitSellPrice;
  @override
  int get quantity;
  @override
  num get lineTotal;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String get id => throw _privateConstructorUsedError;
  String get doctorId => throw _privateConstructorUsedError;
  String get doctorNameSnapshot => throw _privateConstructorUsedError;
  String get doctorPhoneSnapshot => throw _privateConstructorUsedError;
  String get createdBy =>
      throw _privateConstructorUsedError; // 'admin' | 'doctor'
  String get createdByUid => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<OrderItem> get items => throw _privateConstructorUsedError;
  num get totalAmount => throw _privateConstructorUsedError;
  num get amountPaid => throw _privateConstructorUsedError;
  num get amountRemaining => throw _privateConstructorUsedError;
  String get paymentStatus => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @NullableTimestampConverter()
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String id,
      String doctorId,
      String doctorNameSnapshot,
      String doctorPhoneSnapshot,
      String createdBy,
      String createdByUid,
      String status,
      List<OrderItem> items,
      num totalAmount,
      num amountPaid,
      num amountRemaining,
      String paymentStatus,
      String notes,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      @NullableTimestampConverter() DateTime? completedAt});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doctorId = null,
    Object? doctorNameSnapshot = null,
    Object? doctorPhoneSnapshot = null,
    Object? createdBy = null,
    Object? createdByUid = null,
    Object? status = null,
    Object? items = null,
    Object? totalAmount = null,
    Object? amountPaid = null,
    Object? amountRemaining = null,
    Object? paymentStatus = null,
    Object? notes = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorNameSnapshot: null == doctorNameSnapshot
          ? _value.doctorNameSnapshot
          : doctorNameSnapshot // ignore: cast_nullable_to_non_nullable
              as String,
      doctorPhoneSnapshot: null == doctorPhoneSnapshot
          ? _value.doctorPhoneSnapshot
          : doctorPhoneSnapshot // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUid: null == createdByUid
          ? _value.createdByUid
          : createdByUid // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as num,
      amountPaid: null == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as num,
      amountRemaining: null == amountRemaining
          ? _value.amountRemaining
          : amountRemaining // ignore: cast_nullable_to_non_nullable
              as num,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String doctorId,
      String doctorNameSnapshot,
      String doctorPhoneSnapshot,
      String createdBy,
      String createdByUid,
      String status,
      List<OrderItem> items,
      num totalAmount,
      num amountPaid,
      num amountRemaining,
      String paymentStatus,
      String notes,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      @NullableTimestampConverter() DateTime? completedAt});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doctorId = null,
    Object? doctorNameSnapshot = null,
    Object? doctorPhoneSnapshot = null,
    Object? createdBy = null,
    Object? createdByUid = null,
    Object? status = null,
    Object? items = null,
    Object? totalAmount = null,
    Object? amountPaid = null,
    Object? amountRemaining = null,
    Object? paymentStatus = null,
    Object? notes = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorNameSnapshot: null == doctorNameSnapshot
          ? _value.doctorNameSnapshot
          : doctorNameSnapshot // ignore: cast_nullable_to_non_nullable
              as String,
      doctorPhoneSnapshot: null == doctorPhoneSnapshot
          ? _value.doctorPhoneSnapshot
          : doctorPhoneSnapshot // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUid: null == createdByUid
          ? _value.createdByUid
          : createdByUid // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as num,
      amountPaid: null == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as num,
      amountRemaining: null == amountRemaining
          ? _value.amountRemaining
          : amountRemaining // ignore: cast_nullable_to_non_nullable
              as num,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl extends _Order {
  const _$OrderImpl(
      {required this.id,
      required this.doctorId,
      required this.doctorNameSnapshot,
      this.doctorPhoneSnapshot = '',
      required this.createdBy,
      required this.createdByUid,
      this.status = 'waiting',
      final List<OrderItem> items = const <OrderItem>[],
      this.totalAmount = 0,
      this.amountPaid = 0,
      this.amountRemaining = 0,
      this.paymentStatus = 'unpaid',
      this.notes = '',
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      @NullableTimestampConverter() this.completedAt})
      : _items = items,
        super._();

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String id;
  @override
  final String doctorId;
  @override
  final String doctorNameSnapshot;
  @override
  @JsonKey()
  final String doctorPhoneSnapshot;
  @override
  final String createdBy;
// 'admin' | 'doctor'
  @override
  final String createdByUid;
  @override
  @JsonKey()
  final String status;
  final List<OrderItem> _items;
  @override
  @JsonKey()
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final num totalAmount;
  @override
  @JsonKey()
  final num amountPaid;
  @override
  @JsonKey()
  final num amountRemaining;
  @override
  @JsonKey()
  final String paymentStatus;
  @override
  @JsonKey()
  final String notes;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;
  @override
  @NullableTimestampConverter()
  final DateTime? completedAt;

  @override
  String toString() {
    return 'Order(id: $id, doctorId: $doctorId, doctorNameSnapshot: $doctorNameSnapshot, doctorPhoneSnapshot: $doctorPhoneSnapshot, createdBy: $createdBy, createdByUid: $createdByUid, status: $status, items: $items, totalAmount: $totalAmount, amountPaid: $amountPaid, amountRemaining: $amountRemaining, paymentStatus: $paymentStatus, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.doctorNameSnapshot, doctorNameSnapshot) ||
                other.doctorNameSnapshot == doctorNameSnapshot) &&
            (identical(other.doctorPhoneSnapshot, doctorPhoneSnapshot) ||
                other.doctorPhoneSnapshot == doctorPhoneSnapshot) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdByUid, createdByUid) ||
                other.createdByUid == createdByUid) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid) &&
            (identical(other.amountRemaining, amountRemaining) ||
                other.amountRemaining == amountRemaining) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      doctorId,
      doctorNameSnapshot,
      doctorPhoneSnapshot,
      createdBy,
      createdByUid,
      status,
      const DeepCollectionEquality().hash(_items),
      totalAmount,
      amountPaid,
      amountRemaining,
      paymentStatus,
      notes,
      createdAt,
      updatedAt,
      completedAt);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order extends Order {
  const factory _Order(
      {required final String id,
      required final String doctorId,
      required final String doctorNameSnapshot,
      final String doctorPhoneSnapshot,
      required final String createdBy,
      required final String createdByUid,
      final String status,
      final List<OrderItem> items,
      final num totalAmount,
      final num amountPaid,
      final num amountRemaining,
      final String paymentStatus,
      final String notes,
      @TimestampConverter() final DateTime? createdAt,
      @TimestampConverter() final DateTime? updatedAt,
      @NullableTimestampConverter() final DateTime? completedAt}) = _$OrderImpl;
  const _Order._() : super._();

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  String get id;
  @override
  String get doctorId;
  @override
  String get doctorNameSnapshot;
  @override
  String get doctorPhoneSnapshot;
  @override
  String get createdBy; // 'admin' | 'doctor'
  @override
  String get createdByUid;
  @override
  String get status;
  @override
  List<OrderItem> get items;
  @override
  num get totalAmount;
  @override
  num get amountPaid;
  @override
  num get amountRemaining;
  @override
  String get paymentStatus;
  @override
  String get notes;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;
  @override
  @NullableTimestampConverter()
  DateTime? get completedAt;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  String get id => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  String get recordedByUid => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get recordedAt => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res, Payment>;
  @useResult
  $Res call(
      {String id,
      num amount,
      String method,
      String recordedByUid,
      @TimestampConverter() DateTime? recordedAt,
      String note});
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res, $Val extends Payment>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? method = null,
    Object? recordedByUid = null,
    Object? recordedAt = freezed,
    Object? note = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      recordedByUid: null == recordedByUid
          ? _value.recordedByUid
          : recordedByUid // ignore: cast_nullable_to_non_nullable
              as String,
      recordedAt: freezed == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentImplCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$$PaymentImplCopyWith(
          _$PaymentImpl value, $Res Function(_$PaymentImpl) then) =
      __$$PaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      num amount,
      String method,
      String recordedByUid,
      @TimestampConverter() DateTime? recordedAt,
      String note});
}

/// @nodoc
class __$$PaymentImplCopyWithImpl<$Res>
    extends _$PaymentCopyWithImpl<$Res, _$PaymentImpl>
    implements _$$PaymentImplCopyWith<$Res> {
  __$$PaymentImplCopyWithImpl(
      _$PaymentImpl _value, $Res Function(_$PaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? method = null,
    Object? recordedByUid = null,
    Object? recordedAt = freezed,
    Object? note = null,
  }) {
    return _then(_$PaymentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      recordedByUid: null == recordedByUid
          ? _value.recordedByUid
          : recordedByUid // ignore: cast_nullable_to_non_nullable
              as String,
      recordedAt: freezed == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentImpl implements _Payment {
  const _$PaymentImpl(
      {required this.id,
      required this.amount,
      this.method = 'cash',
      required this.recordedByUid,
      @TimestampConverter() this.recordedAt,
      this.note = ''});

  factory _$PaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentImplFromJson(json);

  @override
  final String id;
  @override
  final num amount;
  @override
  @JsonKey()
  final String method;
  @override
  final String recordedByUid;
  @override
  @TimestampConverter()
  final DateTime? recordedAt;
  @override
  @JsonKey()
  final String note;

  @override
  String toString() {
    return 'Payment(id: $id, amount: $amount, method: $method, recordedByUid: $recordedByUid, recordedAt: $recordedAt, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.recordedByUid, recordedByUid) ||
                other.recordedByUid == recordedByUid) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, amount, method, recordedByUid, recordedAt, note);

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      __$$PaymentImplCopyWithImpl<_$PaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentImplToJson(
      this,
    );
  }
}

abstract class _Payment implements Payment {
  const factory _Payment(
      {required final String id,
      required final num amount,
      final String method,
      required final String recordedByUid,
      @TimestampConverter() final DateTime? recordedAt,
      final String note}) = _$PaymentImpl;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$PaymentImpl.fromJson;

  @override
  String get id;
  @override
  num get amount;
  @override
  String get method;
  @override
  String get recordedByUid;
  @override
  @TimestampConverter()
  DateTime? get recordedAt;
  @override
  String get note;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfitDataSummary _$ProfitDataSummaryFromJson(Map<String, dynamic> json) {
  return _ProfitDataSummary.fromJson(json);
}

/// @nodoc
mixin _$ProfitDataSummary {
  List<ProfitLineItem> get items => throw _privateConstructorUsedError;
  num get totalCost => throw _privateConstructorUsedError;
  num get totalProfit => throw _privateConstructorUsedError;

  /// Serializes this ProfitDataSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfitDataSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfitDataSummaryCopyWith<ProfitDataSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfitDataSummaryCopyWith<$Res> {
  factory $ProfitDataSummaryCopyWith(
          ProfitDataSummary value, $Res Function(ProfitDataSummary) then) =
      _$ProfitDataSummaryCopyWithImpl<$Res, ProfitDataSummary>;
  @useResult
  $Res call({List<ProfitLineItem> items, num totalCost, num totalProfit});
}

/// @nodoc
class _$ProfitDataSummaryCopyWithImpl<$Res, $Val extends ProfitDataSummary>
    implements $ProfitDataSummaryCopyWith<$Res> {
  _$ProfitDataSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfitDataSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCost = null,
    Object? totalProfit = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProfitLineItem>,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as num,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfitDataSummaryImplCopyWith<$Res>
    implements $ProfitDataSummaryCopyWith<$Res> {
  factory _$$ProfitDataSummaryImplCopyWith(_$ProfitDataSummaryImpl value,
          $Res Function(_$ProfitDataSummaryImpl) then) =
      __$$ProfitDataSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProfitLineItem> items, num totalCost, num totalProfit});
}

/// @nodoc
class __$$ProfitDataSummaryImplCopyWithImpl<$Res>
    extends _$ProfitDataSummaryCopyWithImpl<$Res, _$ProfitDataSummaryImpl>
    implements _$$ProfitDataSummaryImplCopyWith<$Res> {
  __$$ProfitDataSummaryImplCopyWithImpl(_$ProfitDataSummaryImpl _value,
      $Res Function(_$ProfitDataSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfitDataSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCost = null,
    Object? totalProfit = null,
  }) {
    return _then(_$ProfitDataSummaryImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProfitLineItem>,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as num,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfitDataSummaryImpl implements _ProfitDataSummary {
  const _$ProfitDataSummaryImpl(
      {final List<ProfitLineItem> items = const <ProfitLineItem>[],
      this.totalCost = 0,
      this.totalProfit = 0})
      : _items = items;

  factory _$ProfitDataSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfitDataSummaryImplFromJson(json);

  final List<ProfitLineItem> _items;
  @override
  @JsonKey()
  List<ProfitLineItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final num totalCost;
  @override
  @JsonKey()
  final num totalProfit;

  @override
  String toString() {
    return 'ProfitDataSummary(items: $items, totalCost: $totalCost, totalProfit: $totalProfit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfitDataSummaryImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.totalProfit, totalProfit) ||
                other.totalProfit == totalProfit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), totalCost, totalProfit);

  /// Create a copy of ProfitDataSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfitDataSummaryImplCopyWith<_$ProfitDataSummaryImpl> get copyWith =>
      __$$ProfitDataSummaryImplCopyWithImpl<_$ProfitDataSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfitDataSummaryImplToJson(
      this,
    );
  }
}

abstract class _ProfitDataSummary implements ProfitDataSummary {
  const factory _ProfitDataSummary(
      {final List<ProfitLineItem> items,
      final num totalCost,
      final num totalProfit}) = _$ProfitDataSummaryImpl;

  factory _ProfitDataSummary.fromJson(Map<String, dynamic> json) =
      _$ProfitDataSummaryImpl.fromJson;

  @override
  List<ProfitLineItem> get items;
  @override
  num get totalCost;
  @override
  num get totalProfit;

  /// Create a copy of ProfitDataSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfitDataSummaryImplCopyWith<_$ProfitDataSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfitLineItem _$ProfitLineItemFromJson(Map<String, dynamic> json) {
  return _ProfitLineItem.fromJson(json);
}

/// @nodoc
mixin _$ProfitLineItem {
  String get variantId => throw _privateConstructorUsedError;
  num get unitCostPrice => throw _privateConstructorUsedError;
  num get lineProfit => throw _privateConstructorUsedError;

  /// Serializes this ProfitLineItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfitLineItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfitLineItemCopyWith<ProfitLineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfitLineItemCopyWith<$Res> {
  factory $ProfitLineItemCopyWith(
          ProfitLineItem value, $Res Function(ProfitLineItem) then) =
      _$ProfitLineItemCopyWithImpl<$Res, ProfitLineItem>;
  @useResult
  $Res call({String variantId, num unitCostPrice, num lineProfit});
}

/// @nodoc
class _$ProfitLineItemCopyWithImpl<$Res, $Val extends ProfitLineItem>
    implements $ProfitLineItemCopyWith<$Res> {
  _$ProfitLineItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfitLineItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variantId = null,
    Object? unitCostPrice = null,
    Object? lineProfit = null,
  }) {
    return _then(_value.copyWith(
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String,
      unitCostPrice: null == unitCostPrice
          ? _value.unitCostPrice
          : unitCostPrice // ignore: cast_nullable_to_non_nullable
              as num,
      lineProfit: null == lineProfit
          ? _value.lineProfit
          : lineProfit // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfitLineItemImplCopyWith<$Res>
    implements $ProfitLineItemCopyWith<$Res> {
  factory _$$ProfitLineItemImplCopyWith(_$ProfitLineItemImpl value,
          $Res Function(_$ProfitLineItemImpl) then) =
      __$$ProfitLineItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String variantId, num unitCostPrice, num lineProfit});
}

/// @nodoc
class __$$ProfitLineItemImplCopyWithImpl<$Res>
    extends _$ProfitLineItemCopyWithImpl<$Res, _$ProfitLineItemImpl>
    implements _$$ProfitLineItemImplCopyWith<$Res> {
  __$$ProfitLineItemImplCopyWithImpl(
      _$ProfitLineItemImpl _value, $Res Function(_$ProfitLineItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfitLineItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variantId = null,
    Object? unitCostPrice = null,
    Object? lineProfit = null,
  }) {
    return _then(_$ProfitLineItemImpl(
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String,
      unitCostPrice: null == unitCostPrice
          ? _value.unitCostPrice
          : unitCostPrice // ignore: cast_nullable_to_non_nullable
              as num,
      lineProfit: null == lineProfit
          ? _value.lineProfit
          : lineProfit // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfitLineItemImpl implements _ProfitLineItem {
  const _$ProfitLineItemImpl(
      {required this.variantId,
      required this.unitCostPrice,
      required this.lineProfit});

  factory _$ProfitLineItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfitLineItemImplFromJson(json);

  @override
  final String variantId;
  @override
  final num unitCostPrice;
  @override
  final num lineProfit;

  @override
  String toString() {
    return 'ProfitLineItem(variantId: $variantId, unitCostPrice: $unitCostPrice, lineProfit: $lineProfit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfitLineItemImpl &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.unitCostPrice, unitCostPrice) ||
                other.unitCostPrice == unitCostPrice) &&
            (identical(other.lineProfit, lineProfit) ||
                other.lineProfit == lineProfit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, variantId, unitCostPrice, lineProfit);

  /// Create a copy of ProfitLineItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfitLineItemImplCopyWith<_$ProfitLineItemImpl> get copyWith =>
      __$$ProfitLineItemImplCopyWithImpl<_$ProfitLineItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfitLineItemImplToJson(
      this,
    );
  }
}

abstract class _ProfitLineItem implements ProfitLineItem {
  const factory _ProfitLineItem(
      {required final String variantId,
      required final num unitCostPrice,
      required final num lineProfit}) = _$ProfitLineItemImpl;

  factory _ProfitLineItem.fromJson(Map<String, dynamic> json) =
      _$ProfitLineItemImpl.fromJson;

  @override
  String get variantId;
  @override
  num get unitCostPrice;
  @override
  num get lineProfit;

  /// Create a copy of ProfitLineItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfitLineItemImplCopyWith<_$ProfitLineItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
