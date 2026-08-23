import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_paths.dart';
import '../../models/consumption_mapping.dart';

/// Global catalog data (see [ConsumptionMapping]'s doc comment) — every
/// signed-in doctor can read the full list (needed for their own reorder
/// suggestions), only an admin can create/delete entries.
class ConsumptionMappingRepository {
  ConsumptionMappingRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _mappings =>
      _db.collection(FirestorePaths.consumptionMappings);

  Stream<List<ConsumptionMapping>> watchAllMappings() {
    return _mappings.snapshots().map((snap) =>
        snap.docs.map((d) => ConsumptionMapping.fromDoc(d.id, d.data())).toList());
  }

  Future<void> createMapping({
    required String treatmentType,
    required String productId,
    required String productName,
    required String variantId,
    required String variantLabel,
    required num quantityPerTreatment,
    required String createdByUid,
  }) {
    return _mappings.add({
      'treatmentType': treatmentType,
      'productId': productId,
      'productName': productName,
      'variantId': variantId,
      'variantLabel': variantLabel,
      'quantityPerTreatment': quantityPerTreatment,
      'createdByUid': createdByUid,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> deleteMapping(String id) => _mappings.doc(id).delete();
}
