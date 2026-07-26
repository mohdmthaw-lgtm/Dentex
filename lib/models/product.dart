import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';
import 'product_variant.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    @Default('') String manufacturer,
    @Default('') String description,
    @Default('') String imageUrl,
    @Default('') String imagePath,
    @Default(0) int lowStockThreshold,
    @Default(true) bool isActive,
    @Default(0) int totalQuantity,
    @Default(<VariantSummary>[]) List<VariantSummary> variantSummaries,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _Product;

  const Product._();

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.fromDoc(String id, Map<String, dynamic> data) =>
      Product.fromJson({...data, 'id': id});

  /// Half-threshold and zero are the two alert points a low-stock Cloud
  /// Function trigger fires on; exposed here so the UI can show the same
  /// "low stock" badge without re-deriving the rule.
  bool get isLowStock =>
      lowStockThreshold > 0 && totalQuantity <= lowStockThreshold / 2;

  bool get isOutOfStock => totalQuantity <= 0;
}
