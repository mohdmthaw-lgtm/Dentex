// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductVariant _$ProductVariantFromJson(Map<String, dynamic> json) {
  return _ProductVariant.fromJson(json);
}

/// @nodoc
mixin _$ProductVariant {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  num get sellPrice => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get totalSold => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get imagePath =>
      throw _privateConstructorUsedError; // Denormalized parent product name — written alongside the variant so
// best-seller analytics (a collectionGroup query across every
// product's variants) can display "product + variant" without an N+1
// read back to each parent product doc.
  String get productName => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProductVariant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductVariant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductVariantCopyWith<ProductVariant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantCopyWith<$Res> {
  factory $ProductVariantCopyWith(
          ProductVariant value, $Res Function(ProductVariant) then) =
      _$ProductVariantCopyWithImpl<$Res, ProductVariant>;
  @useResult
  $Res call(
      {String id,
      String label,
      num sellPrice,
      int quantity,
      int totalSold,
      String imageUrl,
      String imagePath,
      String productName,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$ProductVariantCopyWithImpl<$Res, $Val extends ProductVariant>
    implements $ProductVariantCopyWith<$Res> {
  _$ProductVariantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductVariant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? sellPrice = null,
    Object? quantity = null,
    Object? totalSold = null,
    Object? imageUrl = null,
    Object? imagePath = null,
    Object? productName = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      sellPrice: null == sellPrice
          ? _value.sellPrice
          : sellPrice // ignore: cast_nullable_to_non_nullable
              as num,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalSold: null == totalSold
          ? _value.totalSold
          : totalSold // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductVariantImplCopyWith<$Res>
    implements $ProductVariantCopyWith<$Res> {
  factory _$$ProductVariantImplCopyWith(_$ProductVariantImpl value,
          $Res Function(_$ProductVariantImpl) then) =
      __$$ProductVariantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      num sellPrice,
      int quantity,
      int totalSold,
      String imageUrl,
      String imagePath,
      String productName,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$ProductVariantImplCopyWithImpl<$Res>
    extends _$ProductVariantCopyWithImpl<$Res, _$ProductVariantImpl>
    implements _$$ProductVariantImplCopyWith<$Res> {
  __$$ProductVariantImplCopyWithImpl(
      _$ProductVariantImpl _value, $Res Function(_$ProductVariantImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductVariant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? sellPrice = null,
    Object? quantity = null,
    Object? totalSold = null,
    Object? imageUrl = null,
    Object? imagePath = null,
    Object? productName = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ProductVariantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      sellPrice: null == sellPrice
          ? _value.sellPrice
          : sellPrice // ignore: cast_nullable_to_non_nullable
              as num,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalSold: null == totalSold
          ? _value.totalSold
          : totalSold // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductVariantImpl implements _ProductVariant {
  const _$ProductVariantImpl(
      {required this.id,
      required this.label,
      required this.sellPrice,
      this.quantity = 0,
      this.totalSold = 0,
      this.imageUrl = '',
      this.imagePath = '',
      this.productName = '',
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt});

  factory _$ProductVariantImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductVariantImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final num sellPrice;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final int totalSold;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String imagePath;
// Denormalized parent product name — written alongside the variant so
// best-seller analytics (a collectionGroup query across every
// product's variants) can display "product + variant" without an N+1
// read back to each parent product doc.
  @override
  @JsonKey()
  final String productName;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ProductVariant(id: $id, label: $label, sellPrice: $sellPrice, quantity: $quantity, totalSold: $totalSold, imageUrl: $imageUrl, imagePath: $imagePath, productName: $productName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.sellPrice, sellPrice) ||
                other.sellPrice == sellPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.totalSold, totalSold) ||
                other.totalSold == totalSold) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, sellPrice, quantity,
      totalSold, imageUrl, imagePath, productName, createdAt, updatedAt);

  /// Create a copy of ProductVariant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductVariantImplCopyWith<_$ProductVariantImpl> get copyWith =>
      __$$ProductVariantImplCopyWithImpl<_$ProductVariantImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductVariantImplToJson(
      this,
    );
  }
}

abstract class _ProductVariant implements ProductVariant {
  const factory _ProductVariant(
      {required final String id,
      required final String label,
      required final num sellPrice,
      final int quantity,
      final int totalSold,
      final String imageUrl,
      final String imagePath,
      final String productName,
      @TimestampConverter() final DateTime? createdAt,
      @TimestampConverter() final DateTime? updatedAt}) = _$ProductVariantImpl;

  factory _ProductVariant.fromJson(Map<String, dynamic> json) =
      _$ProductVariantImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  num get sellPrice;
  @override
  int get quantity;
  @override
  int get totalSold;
  @override
  String get imageUrl;
  @override
  String
      get imagePath; // Denormalized parent product name — written alongside the variant so
// best-seller analytics (a collectionGroup query across every
// product's variants) can display "product + variant" without an N+1
// read back to each parent product doc.
  @override
  String get productName;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;

  /// Create a copy of ProductVariant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductVariantImplCopyWith<_$ProductVariantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VariantSummary _$VariantSummaryFromJson(Map<String, dynamic> json) {
  return _VariantSummary.fromJson(json);
}

/// @nodoc
mixin _$VariantSummary {
  String get variantId => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  num get sellPrice => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this VariantSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VariantSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VariantSummaryCopyWith<VariantSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantSummaryCopyWith<$Res> {
  factory $VariantSummaryCopyWith(
          VariantSummary value, $Res Function(VariantSummary) then) =
      _$VariantSummaryCopyWithImpl<$Res, VariantSummary>;
  @useResult
  $Res call({String variantId, String label, num sellPrice, int quantity});
}

/// @nodoc
class _$VariantSummaryCopyWithImpl<$Res, $Val extends VariantSummary>
    implements $VariantSummaryCopyWith<$Res> {
  _$VariantSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VariantSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variantId = null,
    Object? label = null,
    Object? sellPrice = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      sellPrice: null == sellPrice
          ? _value.sellPrice
          : sellPrice // ignore: cast_nullable_to_non_nullable
              as num,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VariantSummaryImplCopyWith<$Res>
    implements $VariantSummaryCopyWith<$Res> {
  factory _$$VariantSummaryImplCopyWith(_$VariantSummaryImpl value,
          $Res Function(_$VariantSummaryImpl) then) =
      __$$VariantSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String variantId, String label, num sellPrice, int quantity});
}

/// @nodoc
class __$$VariantSummaryImplCopyWithImpl<$Res>
    extends _$VariantSummaryCopyWithImpl<$Res, _$VariantSummaryImpl>
    implements _$$VariantSummaryImplCopyWith<$Res> {
  __$$VariantSummaryImplCopyWithImpl(
      _$VariantSummaryImpl _value, $Res Function(_$VariantSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of VariantSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variantId = null,
    Object? label = null,
    Object? sellPrice = null,
    Object? quantity = null,
  }) {
    return _then(_$VariantSummaryImpl(
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      sellPrice: null == sellPrice
          ? _value.sellPrice
          : sellPrice // ignore: cast_nullable_to_non_nullable
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
class _$VariantSummaryImpl implements _VariantSummary {
  const _$VariantSummaryImpl(
      {required this.variantId,
      required this.label,
      required this.sellPrice,
      this.quantity = 0});

  factory _$VariantSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$VariantSummaryImplFromJson(json);

  @override
  final String variantId;
  @override
  final String label;
  @override
  final num sellPrice;
  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'VariantSummary(variantId: $variantId, label: $label, sellPrice: $sellPrice, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantSummaryImpl &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.sellPrice, sellPrice) ||
                other.sellPrice == sellPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, variantId, label, sellPrice, quantity);

  /// Create a copy of VariantSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VariantSummaryImplCopyWith<_$VariantSummaryImpl> get copyWith =>
      __$$VariantSummaryImplCopyWithImpl<_$VariantSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VariantSummaryImplToJson(
      this,
    );
  }
}

abstract class _VariantSummary implements VariantSummary {
  const factory _VariantSummary(
      {required final String variantId,
      required final String label,
      required final num sellPrice,
      final int quantity}) = _$VariantSummaryImpl;

  factory _VariantSummary.fromJson(Map<String, dynamic> json) =
      _$VariantSummaryImpl.fromJson;

  @override
  String get variantId;
  @override
  String get label;
  @override
  num get sellPrice;
  @override
  int get quantity;

  /// Create a copy of VariantSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VariantSummaryImplCopyWith<_$VariantSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductVariantCost _$ProductVariantCostFromJson(Map<String, dynamic> json) {
  return _ProductVariantCost.fromJson(json);
}

/// @nodoc
mixin _$ProductVariantCost {
  num get costPrice => throw _privateConstructorUsedError;

  /// Serializes this ProductVariantCost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductVariantCost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductVariantCostCopyWith<ProductVariantCost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantCostCopyWith<$Res> {
  factory $ProductVariantCostCopyWith(
          ProductVariantCost value, $Res Function(ProductVariantCost) then) =
      _$ProductVariantCostCopyWithImpl<$Res, ProductVariantCost>;
  @useResult
  $Res call({num costPrice});
}

/// @nodoc
class _$ProductVariantCostCopyWithImpl<$Res, $Val extends ProductVariantCost>
    implements $ProductVariantCostCopyWith<$Res> {
  _$ProductVariantCostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductVariantCost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? costPrice = null,
  }) {
    return _then(_value.copyWith(
      costPrice: null == costPrice
          ? _value.costPrice
          : costPrice // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductVariantCostImplCopyWith<$Res>
    implements $ProductVariantCostCopyWith<$Res> {
  factory _$$ProductVariantCostImplCopyWith(_$ProductVariantCostImpl value,
          $Res Function(_$ProductVariantCostImpl) then) =
      __$$ProductVariantCostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num costPrice});
}

/// @nodoc
class __$$ProductVariantCostImplCopyWithImpl<$Res>
    extends _$ProductVariantCostCopyWithImpl<$Res, _$ProductVariantCostImpl>
    implements _$$ProductVariantCostImplCopyWith<$Res> {
  __$$ProductVariantCostImplCopyWithImpl(_$ProductVariantCostImpl _value,
      $Res Function(_$ProductVariantCostImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductVariantCost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? costPrice = null,
  }) {
    return _then(_$ProductVariantCostImpl(
      costPrice: null == costPrice
          ? _value.costPrice
          : costPrice // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductVariantCostImpl implements _ProductVariantCost {
  const _$ProductVariantCostImpl({required this.costPrice});

  factory _$ProductVariantCostImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductVariantCostImplFromJson(json);

  @override
  final num costPrice;

  @override
  String toString() {
    return 'ProductVariantCost(costPrice: $costPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantCostImpl &&
            (identical(other.costPrice, costPrice) ||
                other.costPrice == costPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, costPrice);

  /// Create a copy of ProductVariantCost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductVariantCostImplCopyWith<_$ProductVariantCostImpl> get copyWith =>
      __$$ProductVariantCostImplCopyWithImpl<_$ProductVariantCostImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductVariantCostImplToJson(
      this,
    );
  }
}

abstract class _ProductVariantCost implements ProductVariantCost {
  const factory _ProductVariantCost({required final num costPrice}) =
      _$ProductVariantCostImpl;

  factory _ProductVariantCost.fromJson(Map<String, dynamic> json) =
      _$ProductVariantCostImpl.fromJson;

  @override
  num get costPrice;

  /// Create a copy of ProductVariantCost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductVariantCostImplCopyWith<_$ProductVariantCostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
