import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';

part 'product_variant.freezed.dart';
part 'product_variant.g.dart';

/// Source-of-truth doc at products/{productId}/variants/{variantId}.
/// Deliberately excludes cost price — that lives in the sibling admin-only
/// products/{productId}/costs/{variantId} path so doctor-facing security
/// rules can grant read access to this doc without ever exposing margin.
@freezed
class ProductVariant with _$ProductVariant {
  const factory ProductVariant({
    required String id,
    required String label,
    required num sellPrice,
    @Default(0) int quantity,
    @Default(0) int totalSold,
    // Denormalized parent product name — written alongside the variant so
    // best-seller analytics (a collectionGroup query across every
    // product's variants) can display "product + variant" without an N+1
    // read back to each parent product doc.
    @Default('') String productName,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _ProductVariant;

  factory ProductVariant.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantFromJson(json);

  factory ProductVariant.fromDoc(String id, Map<String, dynamic> data) =>
      ProductVariant.fromJson({...data, 'id': id});
}

/// Lightweight read-cache embedded on the parent product doc so list
/// screens can render quantity/price without an N+1 read into the
/// variants subcollection.
@freezed
class VariantSummary with _$VariantSummary {
  const factory VariantSummary({
    required String variantId,
    required String label,
    required num sellPrice,
    @Default(0) int quantity,
  }) = _VariantSummary;

  factory VariantSummary.fromJson(Map<String, dynamic> json) =>
      _$VariantSummaryFromJson(json);
}

/// Admin-only doc at products/{productId}/costs/{variantId}, 1:1 with the
/// variant ID. Split into its own path (not a field on ProductVariant)
/// because Firestore security rules can only restrict whole docs, not
/// individual fields within one doc.
@freezed
class ProductVariantCost with _$ProductVariantCost {
  const factory ProductVariantCost({
    required num costPrice,
  }) = _ProductVariantCost;

  factory ProductVariantCost.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantCostFromJson(json);
}
