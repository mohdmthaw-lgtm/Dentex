import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';

part 'consumption_mapping.freezed.dart';
part 'consumption_mapping.g.dart';

/// consumptionMappings/{id} — "a [treatmentType] visit uses up
/// [quantityPerTreatment] units of this product/variant." Global catalog
/// data the admin manages (Dentex knows its own products — e.g. "root
/// canal" → "gutta percha" is a fact about the catalog, not something each
/// doctor should have to configure themselves), readable by every
/// signed-in doctor so computeReorderSuggestions can turn it + their own
/// recorded visits/orders into proactive reorder prompts.
@freezed
abstract class ConsumptionMapping with _$ConsumptionMapping {
  const factory ConsumptionMapping({
    required String id,
    required String treatmentType,
    required String productId,
    required String productName,
    required String variantId,
    required String variantLabel,
    @Default(1) num quantityPerTreatment,
    required String createdByUid,
    @TimestampConverter() DateTime? createdAt,
  }) = _ConsumptionMapping;

  factory ConsumptionMapping.fromJson(Map<String, dynamic> json) =>
      _$ConsumptionMappingFromJson(json);

  factory ConsumptionMapping.fromDoc(String id, Map<String, dynamic> data) =>
      ConsumptionMapping.fromJson({...data, 'id': id});
}
