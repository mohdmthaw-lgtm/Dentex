// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OfferItem _$OfferItemFromJson(Map<String, dynamic> json) {
  return _OfferItem.fromJson(json);
}

/// @nodoc
mixin _$OfferItem {
  String get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get variantId => throw _privateConstructorUsedError;
  String get variantLabel => throw _privateConstructorUsedError;
  num get unitPrice => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this OfferItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfferItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferItemCopyWith<OfferItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferItemCopyWith<$Res> {
  factory $OfferItemCopyWith(OfferItem value, $Res Function(OfferItem) then) =
      _$OfferItemCopyWithImpl<$Res, OfferItem>;
  @useResult
  $Res call(
      {String productId,
      String productName,
      String variantId,
      String variantLabel,
      num unitPrice,
      int quantity});
}

/// @nodoc
class _$OfferItemCopyWithImpl<$Res, $Val extends OfferItem>
    implements $OfferItemCopyWith<$Res> {
  _$OfferItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfferItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? variantId = null,
    Object? variantLabel = null,
    Object? unitPrice = null,
    Object? quantity = null,
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
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as num,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfferItemImplCopyWith<$Res>
    implements $OfferItemCopyWith<$Res> {
  factory _$$OfferItemImplCopyWith(
          _$OfferItemImpl value, $Res Function(_$OfferItemImpl) then) =
      __$$OfferItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String productName,
      String variantId,
      String variantLabel,
      num unitPrice,
      int quantity});
}

/// @nodoc
class __$$OfferItemImplCopyWithImpl<$Res>
    extends _$OfferItemCopyWithImpl<$Res, _$OfferItemImpl>
    implements _$$OfferItemImplCopyWith<$Res> {
  __$$OfferItemImplCopyWithImpl(
      _$OfferItemImpl _value, $Res Function(_$OfferItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of OfferItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? variantId = null,
    Object? variantLabel = null,
    Object? unitPrice = null,
    Object? quantity = null,
  }) {
    return _then(_$OfferItemImpl(
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
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as num,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfferItemImpl extends _OfferItem {
  const _$OfferItemImpl(
      {required this.productId,
      required this.productName,
      required this.variantId,
      required this.variantLabel,
      required this.unitPrice,
      required this.quantity})
      : super._();

  factory _$OfferItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferItemImplFromJson(json);

  @override
  final String productId;
  @override
  final String productName;
  @override
  final String variantId;
  @override
  final String variantLabel;
  @override
  final num unitPrice;
  @override
  final int quantity;

  @override
  String toString() {
    return 'OfferItem(productId: $productId, productName: $productName, variantId: $variantId, variantLabel: $variantLabel, unitPrice: $unitPrice, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferItemImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.variantLabel, variantLabel) ||
                other.variantLabel == variantLabel) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, productName,
      variantId, variantLabel, unitPrice, quantity);

  /// Create a copy of OfferItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferItemImplCopyWith<_$OfferItemImpl> get copyWith =>
      __$$OfferItemImplCopyWithImpl<_$OfferItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferItemImplToJson(
      this,
    );
  }
}

abstract class _OfferItem extends OfferItem {
  const factory _OfferItem(
      {required final String productId,
      required final String productName,
      required final String variantId,
      required final String variantLabel,
      required final num unitPrice,
      required final int quantity}) = _$OfferItemImpl;
  const _OfferItem._() : super._();

  factory _OfferItem.fromJson(Map<String, dynamic> json) =
      _$OfferItemImpl.fromJson;

  @override
  String get productId;
  @override
  String get productName;
  @override
  String get variantId;
  @override
  String get variantLabel;
  @override
  num get unitPrice;
  @override
  int get quantity;

  /// Create a copy of OfferItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferItemImplCopyWith<_$OfferItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Offer _$OfferFromJson(Map<String, dynamic> json) {
  return _Offer.fromJson(json);
}

/// @nodoc
mixin _$Offer {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  List<OfferItem> get items => throw _privateConstructorUsedError;
  num get offerPrice => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  @NullableTimestampConverter()
  DateTime? get startDate => throw _privateConstructorUsedError;
  @NullableTimestampConverter()
  DateTime? get endDate => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  int get timesSold => throw _privateConstructorUsedError;
  int get unitsSold => throw _privateConstructorUsedError;
  num get totalRevenue => throw _privateConstructorUsedError;
  num get totalDiscountGiven => throw _privateConstructorUsedError;

  /// Serializes this Offer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferCopyWith<Offer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferCopyWith<$Res> {
  factory $OfferCopyWith(Offer value, $Res Function(Offer) then) =
      _$OfferCopyWithImpl<$Res, Offer>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String imageUrl,
      String imagePath,
      List<OfferItem> items,
      num offerPrice,
      bool isActive,
      @NullableTimestampConverter() DateTime? startDate,
      @NullableTimestampConverter() DateTime? endDate,
      @TimestampConverter() DateTime? createdAt,
      int timesSold,
      int unitsSold,
      num totalRevenue,
      num totalDiscountGiven});
}

/// @nodoc
class _$OfferCopyWithImpl<$Res, $Val extends Offer>
    implements $OfferCopyWith<$Res> {
  _$OfferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? imagePath = null,
    Object? items = null,
    Object? offerPrice = null,
    Object? isActive = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? createdAt = freezed,
    Object? timesSold = null,
    Object? unitsSold = null,
    Object? totalRevenue = null,
    Object? totalDiscountGiven = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OfferItem>,
      offerPrice: null == offerPrice
          ? _value.offerPrice
          : offerPrice // ignore: cast_nullable_to_non_nullable
              as num,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timesSold: null == timesSold
          ? _value.timesSold
          : timesSold // ignore: cast_nullable_to_non_nullable
              as int,
      unitsSold: null == unitsSold
          ? _value.unitsSold
          : unitsSold // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as num,
      totalDiscountGiven: null == totalDiscountGiven
          ? _value.totalDiscountGiven
          : totalDiscountGiven // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfferImplCopyWith<$Res> implements $OfferCopyWith<$Res> {
  factory _$$OfferImplCopyWith(
          _$OfferImpl value, $Res Function(_$OfferImpl) then) =
      __$$OfferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String imageUrl,
      String imagePath,
      List<OfferItem> items,
      num offerPrice,
      bool isActive,
      @NullableTimestampConverter() DateTime? startDate,
      @NullableTimestampConverter() DateTime? endDate,
      @TimestampConverter() DateTime? createdAt,
      int timesSold,
      int unitsSold,
      num totalRevenue,
      num totalDiscountGiven});
}

/// @nodoc
class __$$OfferImplCopyWithImpl<$Res>
    extends _$OfferCopyWithImpl<$Res, _$OfferImpl>
    implements _$$OfferImplCopyWith<$Res> {
  __$$OfferImplCopyWithImpl(
      _$OfferImpl _value, $Res Function(_$OfferImpl) _then)
      : super(_value, _then);

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? imagePath = null,
    Object? items = null,
    Object? offerPrice = null,
    Object? isActive = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? createdAt = freezed,
    Object? timesSold = null,
    Object? unitsSold = null,
    Object? totalRevenue = null,
    Object? totalDiscountGiven = null,
  }) {
    return _then(_$OfferImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OfferItem>,
      offerPrice: null == offerPrice
          ? _value.offerPrice
          : offerPrice // ignore: cast_nullable_to_non_nullable
              as num,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timesSold: null == timesSold
          ? _value.timesSold
          : timesSold // ignore: cast_nullable_to_non_nullable
              as int,
      unitsSold: null == unitsSold
          ? _value.unitsSold
          : unitsSold // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as num,
      totalDiscountGiven: null == totalDiscountGiven
          ? _value.totalDiscountGiven
          : totalDiscountGiven // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfferImpl extends _Offer {
  const _$OfferImpl(
      {required this.id,
      required this.title,
      this.description = '',
      this.imageUrl = '',
      this.imagePath = '',
      final List<OfferItem> items = const <OfferItem>[],
      this.offerPrice = 0,
      this.isActive = true,
      @NullableTimestampConverter() this.startDate,
      @NullableTimestampConverter() this.endDate,
      @TimestampConverter() this.createdAt,
      this.timesSold = 0,
      this.unitsSold = 0,
      this.totalRevenue = 0,
      this.totalDiscountGiven = 0})
      : _items = items,
        super._();

  factory _$OfferImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String imagePath;
  final List<OfferItem> _items;
  @override
  @JsonKey()
  List<OfferItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final num offerPrice;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @NullableTimestampConverter()
  final DateTime? startDate;
  @override
  @NullableTimestampConverter()
  final DateTime? endDate;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @JsonKey()
  final int timesSold;
  @override
  @JsonKey()
  final int unitsSold;
  @override
  @JsonKey()
  final num totalRevenue;
  @override
  @JsonKey()
  final num totalDiscountGiven;

  @override
  String toString() {
    return 'Offer(id: $id, title: $title, description: $description, imageUrl: $imageUrl, imagePath: $imagePath, items: $items, offerPrice: $offerPrice, isActive: $isActive, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, timesSold: $timesSold, unitsSold: $unitsSold, totalRevenue: $totalRevenue, totalDiscountGiven: $totalDiscountGiven)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.offerPrice, offerPrice) ||
                other.offerPrice == offerPrice) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.timesSold, timesSold) ||
                other.timesSold == timesSold) &&
            (identical(other.unitsSold, unitsSold) ||
                other.unitsSold == unitsSold) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.totalDiscountGiven, totalDiscountGiven) ||
                other.totalDiscountGiven == totalDiscountGiven));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      imageUrl,
      imagePath,
      const DeepCollectionEquality().hash(_items),
      offerPrice,
      isActive,
      startDate,
      endDate,
      createdAt,
      timesSold,
      unitsSold,
      totalRevenue,
      totalDiscountGiven);

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferImplCopyWith<_$OfferImpl> get copyWith =>
      __$$OfferImplCopyWithImpl<_$OfferImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferImplToJson(
      this,
    );
  }
}

abstract class _Offer extends Offer {
  const factory _Offer(
      {required final String id,
      required final String title,
      final String description,
      final String imageUrl,
      final String imagePath,
      final List<OfferItem> items,
      final num offerPrice,
      final bool isActive,
      @NullableTimestampConverter() final DateTime? startDate,
      @NullableTimestampConverter() final DateTime? endDate,
      @TimestampConverter() final DateTime? createdAt,
      final int timesSold,
      final int unitsSold,
      final num totalRevenue,
      final num totalDiscountGiven}) = _$OfferImpl;
  const _Offer._() : super._();

  factory _Offer.fromJson(Map<String, dynamic> json) = _$OfferImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  String get imagePath;
  @override
  List<OfferItem> get items;
  @override
  num get offerPrice;
  @override
  bool get isActive;
  @override
  @NullableTimestampConverter()
  DateTime? get startDate;
  @override
  @NullableTimestampConverter()
  DateTime? get endDate;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  int get timesSold;
  @override
  int get unitsSold;
  @override
  num get totalRevenue;
  @override
  num get totalDiscountGiven;

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferImplCopyWith<_$OfferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
