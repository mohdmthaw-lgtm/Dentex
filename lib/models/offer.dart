import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';

part 'offer.freezed.dart';
part 'offer.g.dart';

/// One product+variant bundled into an [Offer] package, at its normal
/// catalog price — frozen at the moment the admin builds the package so a
/// later product price change doesn't retroactively change an existing
/// offer's advertised savings.
@freezed
class OfferItem with _$OfferItem {
  const factory OfferItem({
    required String productId,
    required String productName,
    required String variantId,
    required String variantLabel,
    required num unitPrice,
    required int quantity,
  }) = _OfferItem;

  const OfferItem._();

  factory OfferItem.fromJson(Map<String, dynamic> json) =>
      _$OfferItemFromJson(json);

  num get lineTotal => unitPrice * quantity;
}

enum OfferStatus { active, inactive, expired }

/// A promotional package/bundle: one or more existing products sold
/// together at a discount off their combined normal price.
@freezed
class Offer with _$Offer {
  const factory Offer({
    required String id,
    required String title,
    @Default('') String description,
    @Default('') String imageUrl,
    @Default('') String imagePath,
    @Default(<OfferItem>[]) List<OfferItem> items,
    @Default(0) num offerPrice,
    @Default(true) bool isActive,
    @NullableTimestampConverter() DateTime? startDate,
    @NullableTimestampConverter() DateTime? endDate,
    @TimestampConverter() DateTime? createdAt,
    @Default(0) int timesSold,
    @Default(0) int unitsSold,
    @Default(0) num totalRevenue,
    @Default(0) num totalDiscountGiven,
  }) = _Offer;

  const Offer._();

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  factory Offer.fromDoc(String id, Map<String, dynamic> data) =>
      Offer.fromJson({...data, 'id': id});

  num get originalTotal =>
      items.fold<num>(0, (sum, item) => sum + item.lineTotal);

  num get discountAmount => (originalTotal - offerPrice).clamp(0, originalTotal);

  double get discountPercent =>
      originalTotal <= 0 ? 0 : (discountAmount / originalTotal * 100);

  OfferStatus get status {
    if (!isActive) return OfferStatus.inactive;
    if (endDate != null && endDate!.isBefore(DateTime.now())) {
      return OfferStatus.expired;
    }
    return OfferStatus.active;
  }
}
