// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShipmentItem _$ShipmentItemFromJson(Map<String, dynamic> json) {
  return _ShipmentItem.fromJson(json);
}

/// @nodoc
mixin _$ShipmentItem {
  String get productName => throw _privateConstructorUsedError;
  String get manufacturer => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get cartonCount => throw _privateConstructorUsedError;
  num get purchasePrice => throw _privateConstructorUsedError;

  /// Serializes this ShipmentItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShipmentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipmentItemCopyWith<ShipmentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentItemCopyWith<$Res> {
  factory $ShipmentItemCopyWith(
          ShipmentItem value, $Res Function(ShipmentItem) then) =
      _$ShipmentItemCopyWithImpl<$Res, ShipmentItem>;
  @useResult
  $Res call(
      {String productName,
      String manufacturer,
      int quantity,
      int cartonCount,
      num purchasePrice});
}

/// @nodoc
class _$ShipmentItemCopyWithImpl<$Res, $Val extends ShipmentItem>
    implements $ShipmentItemCopyWith<$Res> {
  _$ShipmentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipmentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? manufacturer = null,
    Object? quantity = null,
    Object? cartonCount = null,
    Object? purchasePrice = null,
  }) {
    return _then(_value.copyWith(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      cartonCount: null == cartonCount
          ? _value.cartonCount
          : cartonCount // ignore: cast_nullable_to_non_nullable
              as int,
      purchasePrice: null == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShipmentItemImplCopyWith<$Res>
    implements $ShipmentItemCopyWith<$Res> {
  factory _$$ShipmentItemImplCopyWith(
          _$ShipmentItemImpl value, $Res Function(_$ShipmentItemImpl) then) =
      __$$ShipmentItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productName,
      String manufacturer,
      int quantity,
      int cartonCount,
      num purchasePrice});
}

/// @nodoc
class __$$ShipmentItemImplCopyWithImpl<$Res>
    extends _$ShipmentItemCopyWithImpl<$Res, _$ShipmentItemImpl>
    implements _$$ShipmentItemImplCopyWith<$Res> {
  __$$ShipmentItemImplCopyWithImpl(
      _$ShipmentItemImpl _value, $Res Function(_$ShipmentItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShipmentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? manufacturer = null,
    Object? quantity = null,
    Object? cartonCount = null,
    Object? purchasePrice = null,
  }) {
    return _then(_$ShipmentItemImpl(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      cartonCount: null == cartonCount
          ? _value.cartonCount
          : cartonCount // ignore: cast_nullable_to_non_nullable
              as int,
      purchasePrice: null == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipmentItemImpl extends _ShipmentItem {
  const _$ShipmentItemImpl(
      {required this.productName,
      this.manufacturer = '',
      this.quantity = 0,
      this.cartonCount = 0,
      this.purchasePrice = 0})
      : super._();

  factory _$ShipmentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipmentItemImplFromJson(json);

  @override
  final String productName;
  @override
  @JsonKey()
  final String manufacturer;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final int cartonCount;
  @override
  @JsonKey()
  final num purchasePrice;

  @override
  String toString() {
    return 'ShipmentItem(productName: $productName, manufacturer: $manufacturer, quantity: $quantity, cartonCount: $cartonCount, purchasePrice: $purchasePrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentItemImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.cartonCount, cartonCount) ||
                other.cartonCount == cartonCount) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productName, manufacturer,
      quantity, cartonCount, purchasePrice);

  /// Create a copy of ShipmentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentItemImplCopyWith<_$ShipmentItemImpl> get copyWith =>
      __$$ShipmentItemImplCopyWithImpl<_$ShipmentItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipmentItemImplToJson(
      this,
    );
  }
}

abstract class _ShipmentItem extends ShipmentItem {
  const factory _ShipmentItem(
      {required final String productName,
      final String manufacturer,
      final int quantity,
      final int cartonCount,
      final num purchasePrice}) = _$ShipmentItemImpl;
  const _ShipmentItem._() : super._();

  factory _ShipmentItem.fromJson(Map<String, dynamic> json) =
      _$ShipmentItemImpl.fromJson;

  @override
  String get productName;
  @override
  String get manufacturer;
  @override
  int get quantity;
  @override
  int get cartonCount;
  @override
  num get purchasePrice;

  /// Create a copy of ShipmentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipmentItemImplCopyWith<_$ShipmentItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShipmentCosts _$ShipmentCostsFromJson(Map<String, dynamic> json) {
  return _ShipmentCosts.fromJson(json);
}

/// @nodoc
mixin _$ShipmentCosts {
  num get shipping => throw _privateConstructorUsedError;
  num get customs => throw _privateConstructorUsedError;
  num get clearance => throw _privateConstructorUsedError;
  num get storage => throw _privateConstructorUsedError;
  num get transport => throw _privateConstructorUsedError;
  num get other => throw _privateConstructorUsedError;

  /// Serializes this ShipmentCosts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShipmentCosts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipmentCostsCopyWith<ShipmentCosts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentCostsCopyWith<$Res> {
  factory $ShipmentCostsCopyWith(
          ShipmentCosts value, $Res Function(ShipmentCosts) then) =
      _$ShipmentCostsCopyWithImpl<$Res, ShipmentCosts>;
  @useResult
  $Res call(
      {num shipping,
      num customs,
      num clearance,
      num storage,
      num transport,
      num other});
}

/// @nodoc
class _$ShipmentCostsCopyWithImpl<$Res, $Val extends ShipmentCosts>
    implements $ShipmentCostsCopyWith<$Res> {
  _$ShipmentCostsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipmentCosts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipping = null,
    Object? customs = null,
    Object? clearance = null,
    Object? storage = null,
    Object? transport = null,
    Object? other = null,
  }) {
    return _then(_value.copyWith(
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as num,
      customs: null == customs
          ? _value.customs
          : customs // ignore: cast_nullable_to_non_nullable
              as num,
      clearance: null == clearance
          ? _value.clearance
          : clearance // ignore: cast_nullable_to_non_nullable
              as num,
      storage: null == storage
          ? _value.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as num,
      transport: null == transport
          ? _value.transport
          : transport // ignore: cast_nullable_to_non_nullable
              as num,
      other: null == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShipmentCostsImplCopyWith<$Res>
    implements $ShipmentCostsCopyWith<$Res> {
  factory _$$ShipmentCostsImplCopyWith(
          _$ShipmentCostsImpl value, $Res Function(_$ShipmentCostsImpl) then) =
      __$$ShipmentCostsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num shipping,
      num customs,
      num clearance,
      num storage,
      num transport,
      num other});
}

/// @nodoc
class __$$ShipmentCostsImplCopyWithImpl<$Res>
    extends _$ShipmentCostsCopyWithImpl<$Res, _$ShipmentCostsImpl>
    implements _$$ShipmentCostsImplCopyWith<$Res> {
  __$$ShipmentCostsImplCopyWithImpl(
      _$ShipmentCostsImpl _value, $Res Function(_$ShipmentCostsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShipmentCosts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipping = null,
    Object? customs = null,
    Object? clearance = null,
    Object? storage = null,
    Object? transport = null,
    Object? other = null,
  }) {
    return _then(_$ShipmentCostsImpl(
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as num,
      customs: null == customs
          ? _value.customs
          : customs // ignore: cast_nullable_to_non_nullable
              as num,
      clearance: null == clearance
          ? _value.clearance
          : clearance // ignore: cast_nullable_to_non_nullable
              as num,
      storage: null == storage
          ? _value.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as num,
      transport: null == transport
          ? _value.transport
          : transport // ignore: cast_nullable_to_non_nullable
              as num,
      other: null == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipmentCostsImpl extends _ShipmentCosts {
  const _$ShipmentCostsImpl(
      {this.shipping = 0,
      this.customs = 0,
      this.clearance = 0,
      this.storage = 0,
      this.transport = 0,
      this.other = 0})
      : super._();

  factory _$ShipmentCostsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipmentCostsImplFromJson(json);

  @override
  @JsonKey()
  final num shipping;
  @override
  @JsonKey()
  final num customs;
  @override
  @JsonKey()
  final num clearance;
  @override
  @JsonKey()
  final num storage;
  @override
  @JsonKey()
  final num transport;
  @override
  @JsonKey()
  final num other;

  @override
  String toString() {
    return 'ShipmentCosts(shipping: $shipping, customs: $customs, clearance: $clearance, storage: $storage, transport: $transport, other: $other)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentCostsImpl &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.customs, customs) || other.customs == customs) &&
            (identical(other.clearance, clearance) ||
                other.clearance == clearance) &&
            (identical(other.storage, storage) || other.storage == storage) &&
            (identical(other.transport, transport) ||
                other.transport == transport) &&
            (identical(other.other, this.other) || other.other == this.other));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, shipping, customs, clearance, storage, transport, other);

  /// Create a copy of ShipmentCosts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentCostsImplCopyWith<_$ShipmentCostsImpl> get copyWith =>
      __$$ShipmentCostsImplCopyWithImpl<_$ShipmentCostsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipmentCostsImplToJson(
      this,
    );
  }
}

abstract class _ShipmentCosts extends ShipmentCosts {
  const factory _ShipmentCosts(
      {final num shipping,
      final num customs,
      final num clearance,
      final num storage,
      final num transport,
      final num other}) = _$ShipmentCostsImpl;
  const _ShipmentCosts._() : super._();

  factory _ShipmentCosts.fromJson(Map<String, dynamic> json) =
      _$ShipmentCostsImpl.fromJson;

  @override
  num get shipping;
  @override
  num get customs;
  @override
  num get clearance;
  @override
  num get storage;
  @override
  num get transport;
  @override
  num get other;

  /// Create a copy of ShipmentCosts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipmentCostsImplCopyWith<_$ShipmentCostsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShipmentDocument _$ShipmentDocumentFromJson(Map<String, dynamic> json) {
  return _ShipmentDocument.fromJson(json);
}

/// @nodoc
mixin _$ShipmentDocument {
  String get label => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get uploadedAt => throw _privateConstructorUsedError;

  /// Serializes this ShipmentDocument to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShipmentDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipmentDocumentCopyWith<ShipmentDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentDocumentCopyWith<$Res> {
  factory $ShipmentDocumentCopyWith(
          ShipmentDocument value, $Res Function(ShipmentDocument) then) =
      _$ShipmentDocumentCopyWithImpl<$Res, ShipmentDocument>;
  @useResult
  $Res call(
      {String label,
      String url,
      String path,
      @TimestampConverter() DateTime? uploadedAt});
}

/// @nodoc
class _$ShipmentDocumentCopyWithImpl<$Res, $Val extends ShipmentDocument>
    implements $ShipmentDocumentCopyWith<$Res> {
  _$ShipmentDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipmentDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? url = null,
    Object? path = null,
    Object? uploadedAt = freezed,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShipmentDocumentImplCopyWith<$Res>
    implements $ShipmentDocumentCopyWith<$Res> {
  factory _$$ShipmentDocumentImplCopyWith(_$ShipmentDocumentImpl value,
          $Res Function(_$ShipmentDocumentImpl) then) =
      __$$ShipmentDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      String url,
      String path,
      @TimestampConverter() DateTime? uploadedAt});
}

/// @nodoc
class __$$ShipmentDocumentImplCopyWithImpl<$Res>
    extends _$ShipmentDocumentCopyWithImpl<$Res, _$ShipmentDocumentImpl>
    implements _$$ShipmentDocumentImplCopyWith<$Res> {
  __$$ShipmentDocumentImplCopyWithImpl(_$ShipmentDocumentImpl _value,
      $Res Function(_$ShipmentDocumentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShipmentDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? url = null,
    Object? path = null,
    Object? uploadedAt = freezed,
  }) {
    return _then(_$ShipmentDocumentImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipmentDocumentImpl implements _ShipmentDocument {
  const _$ShipmentDocumentImpl(
      {required this.label,
      required this.url,
      required this.path,
      @TimestampConverter() this.uploadedAt});

  factory _$ShipmentDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipmentDocumentImplFromJson(json);

  @override
  final String label;
  @override
  final String url;
  @override
  final String path;
  @override
  @TimestampConverter()
  final DateTime? uploadedAt;

  @override
  String toString() {
    return 'ShipmentDocument(label: $label, url: $url, path: $path, uploadedAt: $uploadedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentDocumentImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, url, path, uploadedAt);

  /// Create a copy of ShipmentDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentDocumentImplCopyWith<_$ShipmentDocumentImpl> get copyWith =>
      __$$ShipmentDocumentImplCopyWithImpl<_$ShipmentDocumentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipmentDocumentImplToJson(
      this,
    );
  }
}

abstract class _ShipmentDocument implements ShipmentDocument {
  const factory _ShipmentDocument(
          {required final String label,
          required final String url,
          required final String path,
          @TimestampConverter() final DateTime? uploadedAt}) =
      _$ShipmentDocumentImpl;

  factory _ShipmentDocument.fromJson(Map<String, dynamic> json) =
      _$ShipmentDocumentImpl.fromJson;

  @override
  String get label;
  @override
  String get url;
  @override
  String get path;
  @override
  @TimestampConverter()
  DateTime? get uploadedAt;

  /// Create a copy of ShipmentDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipmentDocumentImplCopyWith<_$ShipmentDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Shipment _$ShipmentFromJson(Map<String, dynamic> json) {
  return _Shipment.fromJson(json);
}

/// @nodoc
mixin _$Shipment {
  String get id => throw _privateConstructorUsedError;
  String get shipmentNumber => throw _privateConstructorUsedError;
  String get supplierName => throw _privateConstructorUsedError;
  String get purchaseOrderNumber => throw _privateConstructorUsedError;
  String get shippingCompany => throw _privateConstructorUsedError;
  String get shippingAgent => throw _privateConstructorUsedError;
  String get shipmentType =>
      throw _privateConstructorUsedError; // see ShipmentType consts
  String get originCountry => throw _privateConstructorUsedError;
  String get containerNumber => throw _privateConstructorUsedError;
  @NullableTimestampConverter()
  DateTime? get shipDate => throw _privateConstructorUsedError;
  @NullableTimestampConverter()
  DateTime? get expectedArrivalDate => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // see ShipmentStatus consts
  List<ShipmentItem> get items => throw _privateConstructorUsedError;
  ShipmentCosts get costs => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError; // 'USD' | 'ILS'
  List<ShipmentDocument> get documents => throw _privateConstructorUsedError;
  @NullableTimestampConverter()
  DateTime? get receivedAt => throw _privateConstructorUsedError;
  int get receivedCartons => throw _privateConstructorUsedError;
  String get receivingNotes => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Shipment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Shipment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipmentCopyWith<Shipment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentCopyWith<$Res> {
  factory $ShipmentCopyWith(Shipment value, $Res Function(Shipment) then) =
      _$ShipmentCopyWithImpl<$Res, Shipment>;
  @useResult
  $Res call(
      {String id,
      String shipmentNumber,
      String supplierName,
      String purchaseOrderNumber,
      String shippingCompany,
      String shippingAgent,
      String shipmentType,
      String originCountry,
      String containerNumber,
      @NullableTimestampConverter() DateTime? shipDate,
      @NullableTimestampConverter() DateTime? expectedArrivalDate,
      String notes,
      String status,
      List<ShipmentItem> items,
      ShipmentCosts costs,
      String currency,
      List<ShipmentDocument> documents,
      @NullableTimestampConverter() DateTime? receivedAt,
      int receivedCartons,
      String receivingNotes,
      @TimestampConverter() DateTime? createdAt});

  $ShipmentCostsCopyWith<$Res> get costs;
}

/// @nodoc
class _$ShipmentCopyWithImpl<$Res, $Val extends Shipment>
    implements $ShipmentCopyWith<$Res> {
  _$ShipmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Shipment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shipmentNumber = null,
    Object? supplierName = null,
    Object? purchaseOrderNumber = null,
    Object? shippingCompany = null,
    Object? shippingAgent = null,
    Object? shipmentType = null,
    Object? originCountry = null,
    Object? containerNumber = null,
    Object? shipDate = freezed,
    Object? expectedArrivalDate = freezed,
    Object? notes = null,
    Object? status = null,
    Object? items = null,
    Object? costs = null,
    Object? currency = null,
    Object? documents = null,
    Object? receivedAt = freezed,
    Object? receivedCartons = null,
    Object? receivingNotes = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shipmentNumber: null == shipmentNumber
          ? _value.shipmentNumber
          : shipmentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderNumber: null == purchaseOrderNumber
          ? _value.purchaseOrderNumber
          : purchaseOrderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      shippingCompany: null == shippingCompany
          ? _value.shippingCompany
          : shippingCompany // ignore: cast_nullable_to_non_nullable
              as String,
      shippingAgent: null == shippingAgent
          ? _value.shippingAgent
          : shippingAgent // ignore: cast_nullable_to_non_nullable
              as String,
      shipmentType: null == shipmentType
          ? _value.shipmentType
          : shipmentType // ignore: cast_nullable_to_non_nullable
              as String,
      originCountry: null == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String,
      containerNumber: null == containerNumber
          ? _value.containerNumber
          : containerNumber // ignore: cast_nullable_to_non_nullable
              as String,
      shipDate: freezed == shipDate
          ? _value.shipDate
          : shipDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expectedArrivalDate: freezed == expectedArrivalDate
          ? _value.expectedArrivalDate
          : expectedArrivalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ShipmentItem>,
      costs: null == costs
          ? _value.costs
          : costs // ignore: cast_nullable_to_non_nullable
              as ShipmentCosts,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<ShipmentDocument>,
      receivedAt: freezed == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      receivedCartons: null == receivedCartons
          ? _value.receivedCartons
          : receivedCartons // ignore: cast_nullable_to_non_nullable
              as int,
      receivingNotes: null == receivingNotes
          ? _value.receivingNotes
          : receivingNotes // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Shipment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShipmentCostsCopyWith<$Res> get costs {
    return $ShipmentCostsCopyWith<$Res>(_value.costs, (value) {
      return _then(_value.copyWith(costs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShipmentImplCopyWith<$Res>
    implements $ShipmentCopyWith<$Res> {
  factory _$$ShipmentImplCopyWith(
          _$ShipmentImpl value, $Res Function(_$ShipmentImpl) then) =
      __$$ShipmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String shipmentNumber,
      String supplierName,
      String purchaseOrderNumber,
      String shippingCompany,
      String shippingAgent,
      String shipmentType,
      String originCountry,
      String containerNumber,
      @NullableTimestampConverter() DateTime? shipDate,
      @NullableTimestampConverter() DateTime? expectedArrivalDate,
      String notes,
      String status,
      List<ShipmentItem> items,
      ShipmentCosts costs,
      String currency,
      List<ShipmentDocument> documents,
      @NullableTimestampConverter() DateTime? receivedAt,
      int receivedCartons,
      String receivingNotes,
      @TimestampConverter() DateTime? createdAt});

  @override
  $ShipmentCostsCopyWith<$Res> get costs;
}

/// @nodoc
class __$$ShipmentImplCopyWithImpl<$Res>
    extends _$ShipmentCopyWithImpl<$Res, _$ShipmentImpl>
    implements _$$ShipmentImplCopyWith<$Res> {
  __$$ShipmentImplCopyWithImpl(
      _$ShipmentImpl _value, $Res Function(_$ShipmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Shipment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shipmentNumber = null,
    Object? supplierName = null,
    Object? purchaseOrderNumber = null,
    Object? shippingCompany = null,
    Object? shippingAgent = null,
    Object? shipmentType = null,
    Object? originCountry = null,
    Object? containerNumber = null,
    Object? shipDate = freezed,
    Object? expectedArrivalDate = freezed,
    Object? notes = null,
    Object? status = null,
    Object? items = null,
    Object? costs = null,
    Object? currency = null,
    Object? documents = null,
    Object? receivedAt = freezed,
    Object? receivedCartons = null,
    Object? receivingNotes = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ShipmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shipmentNumber: null == shipmentNumber
          ? _value.shipmentNumber
          : shipmentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderNumber: null == purchaseOrderNumber
          ? _value.purchaseOrderNumber
          : purchaseOrderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      shippingCompany: null == shippingCompany
          ? _value.shippingCompany
          : shippingCompany // ignore: cast_nullable_to_non_nullable
              as String,
      shippingAgent: null == shippingAgent
          ? _value.shippingAgent
          : shippingAgent // ignore: cast_nullable_to_non_nullable
              as String,
      shipmentType: null == shipmentType
          ? _value.shipmentType
          : shipmentType // ignore: cast_nullable_to_non_nullable
              as String,
      originCountry: null == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String,
      containerNumber: null == containerNumber
          ? _value.containerNumber
          : containerNumber // ignore: cast_nullable_to_non_nullable
              as String,
      shipDate: freezed == shipDate
          ? _value.shipDate
          : shipDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expectedArrivalDate: freezed == expectedArrivalDate
          ? _value.expectedArrivalDate
          : expectedArrivalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ShipmentItem>,
      costs: null == costs
          ? _value.costs
          : costs // ignore: cast_nullable_to_non_nullable
              as ShipmentCosts,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<ShipmentDocument>,
      receivedAt: freezed == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      receivedCartons: null == receivedCartons
          ? _value.receivedCartons
          : receivedCartons // ignore: cast_nullable_to_non_nullable
              as int,
      receivingNotes: null == receivingNotes
          ? _value.receivingNotes
          : receivingNotes // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipmentImpl extends _Shipment {
  const _$ShipmentImpl(
      {required this.id,
      required this.shipmentNumber,
      this.supplierName = '',
      this.purchaseOrderNumber = '',
      this.shippingCompany = '',
      this.shippingAgent = '',
      this.shipmentType = ShipmentType.sea,
      this.originCountry = '',
      this.containerNumber = '',
      @NullableTimestampConverter() this.shipDate,
      @NullableTimestampConverter() this.expectedArrivalDate,
      this.notes = '',
      this.status = ShipmentStatus.preparing,
      final List<ShipmentItem> items = const <ShipmentItem>[],
      this.costs = const ShipmentCosts(),
      this.currency = 'USD',
      final List<ShipmentDocument> documents = const <ShipmentDocument>[],
      @NullableTimestampConverter() this.receivedAt,
      this.receivedCartons = 0,
      this.receivingNotes = '',
      @TimestampConverter() this.createdAt})
      : _items = items,
        _documents = documents,
        super._();

  factory _$ShipmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipmentImplFromJson(json);

  @override
  final String id;
  @override
  final String shipmentNumber;
  @override
  @JsonKey()
  final String supplierName;
  @override
  @JsonKey()
  final String purchaseOrderNumber;
  @override
  @JsonKey()
  final String shippingCompany;
  @override
  @JsonKey()
  final String shippingAgent;
  @override
  @JsonKey()
  final String shipmentType;
// see ShipmentType consts
  @override
  @JsonKey()
  final String originCountry;
  @override
  @JsonKey()
  final String containerNumber;
  @override
  @NullableTimestampConverter()
  final DateTime? shipDate;
  @override
  @NullableTimestampConverter()
  final DateTime? expectedArrivalDate;
  @override
  @JsonKey()
  final String notes;
  @override
  @JsonKey()
  final String status;
// see ShipmentStatus consts
  final List<ShipmentItem> _items;
// see ShipmentStatus consts
  @override
  @JsonKey()
  List<ShipmentItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final ShipmentCosts costs;
  @override
  @JsonKey()
  final String currency;
// 'USD' | 'ILS'
  final List<ShipmentDocument> _documents;
// 'USD' | 'ILS'
  @override
  @JsonKey()
  List<ShipmentDocument> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  @NullableTimestampConverter()
  final DateTime? receivedAt;
  @override
  @JsonKey()
  final int receivedCartons;
  @override
  @JsonKey()
  final String receivingNotes;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Shipment(id: $id, shipmentNumber: $shipmentNumber, supplierName: $supplierName, purchaseOrderNumber: $purchaseOrderNumber, shippingCompany: $shippingCompany, shippingAgent: $shippingAgent, shipmentType: $shipmentType, originCountry: $originCountry, containerNumber: $containerNumber, shipDate: $shipDate, expectedArrivalDate: $expectedArrivalDate, notes: $notes, status: $status, items: $items, costs: $costs, currency: $currency, documents: $documents, receivedAt: $receivedAt, receivedCartons: $receivedCartons, receivingNotes: $receivingNotes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shipmentNumber, shipmentNumber) ||
                other.shipmentNumber == shipmentNumber) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.purchaseOrderNumber, purchaseOrderNumber) ||
                other.purchaseOrderNumber == purchaseOrderNumber) &&
            (identical(other.shippingCompany, shippingCompany) ||
                other.shippingCompany == shippingCompany) &&
            (identical(other.shippingAgent, shippingAgent) ||
                other.shippingAgent == shippingAgent) &&
            (identical(other.shipmentType, shipmentType) ||
                other.shipmentType == shipmentType) &&
            (identical(other.originCountry, originCountry) ||
                other.originCountry == originCountry) &&
            (identical(other.containerNumber, containerNumber) ||
                other.containerNumber == containerNumber) &&
            (identical(other.shipDate, shipDate) ||
                other.shipDate == shipDate) &&
            (identical(other.expectedArrivalDate, expectedArrivalDate) ||
                other.expectedArrivalDate == expectedArrivalDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.costs, costs) || other.costs == costs) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.receivedCartons, receivedCartons) ||
                other.receivedCartons == receivedCartons) &&
            (identical(other.receivingNotes, receivingNotes) ||
                other.receivingNotes == receivingNotes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        shipmentNumber,
        supplierName,
        purchaseOrderNumber,
        shippingCompany,
        shippingAgent,
        shipmentType,
        originCountry,
        containerNumber,
        shipDate,
        expectedArrivalDate,
        notes,
        status,
        const DeepCollectionEquality().hash(_items),
        costs,
        currency,
        const DeepCollectionEquality().hash(_documents),
        receivedAt,
        receivedCartons,
        receivingNotes,
        createdAt
      ]);

  /// Create a copy of Shipment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentImplCopyWith<_$ShipmentImpl> get copyWith =>
      __$$ShipmentImplCopyWithImpl<_$ShipmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipmentImplToJson(
      this,
    );
  }
}

abstract class _Shipment extends Shipment {
  const factory _Shipment(
      {required final String id,
      required final String shipmentNumber,
      final String supplierName,
      final String purchaseOrderNumber,
      final String shippingCompany,
      final String shippingAgent,
      final String shipmentType,
      final String originCountry,
      final String containerNumber,
      @NullableTimestampConverter() final DateTime? shipDate,
      @NullableTimestampConverter() final DateTime? expectedArrivalDate,
      final String notes,
      final String status,
      final List<ShipmentItem> items,
      final ShipmentCosts costs,
      final String currency,
      final List<ShipmentDocument> documents,
      @NullableTimestampConverter() final DateTime? receivedAt,
      final int receivedCartons,
      final String receivingNotes,
      @TimestampConverter() final DateTime? createdAt}) = _$ShipmentImpl;
  const _Shipment._() : super._();

  factory _Shipment.fromJson(Map<String, dynamic> json) =
      _$ShipmentImpl.fromJson;

  @override
  String get id;
  @override
  String get shipmentNumber;
  @override
  String get supplierName;
  @override
  String get purchaseOrderNumber;
  @override
  String get shippingCompany;
  @override
  String get shippingAgent;
  @override
  String get shipmentType; // see ShipmentType consts
  @override
  String get originCountry;
  @override
  String get containerNumber;
  @override
  @NullableTimestampConverter()
  DateTime? get shipDate;
  @override
  @NullableTimestampConverter()
  DateTime? get expectedArrivalDate;
  @override
  String get notes;
  @override
  String get status; // see ShipmentStatus consts
  @override
  List<ShipmentItem> get items;
  @override
  ShipmentCosts get costs;
  @override
  String get currency; // 'USD' | 'ILS'
  @override
  List<ShipmentDocument> get documents;
  @override
  @NullableTimestampConverter()
  DateTime? get receivedAt;
  @override
  int get receivedCartons;
  @override
  String get receivingNotes;
  @override
  @TimestampConverter()
  DateTime? get createdAt;

  /// Create a copy of Shipment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipmentImplCopyWith<_$ShipmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
