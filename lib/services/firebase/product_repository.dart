import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_paths.dart';
import '../../models/product.dart';
import '../../models/product_variant.dart';

/// Encapsulates all reads/writes for products + their variants/costs
/// subcollections. Variants are a subcollection (not an array field) so
/// stock decrements can use atomic FieldValue.increment() scoped to a
/// single variant; costs are split into their own admin-only path because
/// Firestore rules can't hide individual fields within one document.
class ProductRepository {
  ProductRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _products =>
      _db.collection(FirestorePaths.products);

  Stream<List<Product>> watchProducts({bool activeOnly = false}) {
    Query<Map<String, dynamic>> query = _products.orderBy('name');
    if (activeOnly) {
      query = query.where('isActive', isEqualTo: true);
    }
    return query.snapshots().map((snap) =>
        snap.docs.map((d) => Product.fromDoc(d.id, d.data())).toList());
  }

  Future<Product?> getProduct(String productId) async {
    final doc = await _products.doc(productId).get();
    if (!doc.exists) return null;
    return Product.fromDoc(doc.id, doc.data()!);
  }

  Stream<List<ProductVariant>> watchVariants(String productId) {
    return _products
        .doc(productId)
        .collection(FirestorePaths.variants)
        .orderBy('label')
        .snapshots()
        .map((snap) => snap.docs
            .map((d) => ProductVariant.fromDoc(d.id, d.data()))
            .toList());
  }

  /// Best-sellers analytics: a collectionGroup query across every product's
  /// variants subcollection, ordered by cumulative units sold. Requires a
  /// collectionGroup index on `variants.totalSold` — see
  /// firestore.indexes.json.
  Stream<List<ProductVariant>> watchBestSellingVariants({int limit = 10}) {
    return _db
        .collectionGroup(FirestorePaths.variants)
        .orderBy('totalSold', descending: true)
        .limit(limit)
        .snapshots()
        .map((snap) => snap.docs
            .map((d) => ProductVariant.fromDoc(d.id, d.data()))
            .toList());
  }

  Future<num> getVariantCost(String productId, String variantId) async {
    final doc = await _products
        .doc(productId)
        .collection(FirestorePaths.costs)
        .doc(variantId)
        .get();
    if (!doc.exists) return 0;
    return (doc.data()!['costPrice'] as num?) ?? 0;
  }

  /// Creates a product with its initial set of variants (each variant
  /// carries its own sell price, quantity, and cost). Writes the product
  /// doc, every variants/{id} doc, and every costs/{id} doc in one batch so
  /// a caller never observes a partially-created product.
  Future<String> createProduct({
    required String name,
    required String description,
    required int lowStockThreshold,
    required List<NewVariantInput> variants,
  }) async {
    final productRef = _products.doc();
    final batch = _db.batch();

    final variantSummaries = <Map<String, dynamic>>[];
    var totalQuantity = 0;

    for (final v in variants) {
      final variantRef =
          productRef.collection(FirestorePaths.variants).doc();
      final costRef = productRef.collection(FirestorePaths.costs).doc(variantRef.id);

      batch.set(variantRef, {
        'label': v.label,
        'sellPrice': v.sellPrice,
        'quantity': v.quantity,
        'totalSold': 0,
        'productName': name,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      batch.set(costRef, {'costPrice': v.costPrice});

      variantSummaries.add({
        'variantId': variantRef.id,
        'label': v.label,
        'sellPrice': v.sellPrice,
        'quantity': v.quantity,
      });
      totalQuantity += v.quantity;
    }

    batch.set(productRef, {
      'name': name,
      'description': description,
      'imageUrl': '',
      'imagePath': '',
      'lowStockThreshold': lowStockThreshold,
      'isActive': true,
      'totalQuantity': totalQuantity,
      'variantSummaries': variantSummaries,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });

    await batch.commit();
    return productRef.id;
  }

  Future<void> updateProductInfo({
    required String productId,
    required String name,
    required String description,
    required int lowStockThreshold,
  }) {
    return _products.doc(productId).update({
      'name': name,
      'description': description,
      'lowStockThreshold': lowStockThreshold,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateProductImage({
    required String productId,
    required String imageUrl,
    required String imagePath,
  }) {
    return _products.doc(productId).update({
      'imageUrl': imageUrl,
      'imagePath': imagePath,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Adds stock to an existing variant (the common "restock" edit flow).
  Future<void> addStock({
    required String productId,
    required String variantId,
    required int additionalQuantity,
  }) {
    final variantRef = _products
        .doc(productId)
        .collection(FirestorePaths.variants)
        .doc(variantId);
    return variantRef.update({
      'quantity': FieldValue.increment(additionalQuantity),
      'updatedAt': FieldValue.serverTimestamp(),
    });
    // NOTE: variantSummaries/totalQuantity on the parent product doc are
    // kept in sync by the onVariantWrite Cloud Function trigger (see
    // functions/src/products/onVariantWrite.ts), not client-side, so
    // concurrent edits from multiple admin sessions never race.
  }

  Future<void> updateVariantPrice({
    required String productId,
    required String variantId,
    required num sellPrice,
    required num costPrice,
  }) async {
    final batch = _db.batch();
    final variantRef = _products
        .doc(productId)
        .collection(FirestorePaths.variants)
        .doc(variantId);
    final costRef =
        _products.doc(productId).collection(FirestorePaths.costs).doc(variantId);
    batch.update(variantRef, {
      'sellPrice': sellPrice,
      'updatedAt': FieldValue.serverTimestamp(),
    });
    batch.set(costRef, {'costPrice': costPrice});
    await batch.commit();
  }

  Future<void> addVariant({
    required String productId,
    required String productName,
    required NewVariantInput variant,
  }) async {
    final productRef = _products.doc(productId);
    final variantRef = productRef.collection(FirestorePaths.variants).doc();
    final costRef =
        productRef.collection(FirestorePaths.costs).doc(variantRef.id);
    final batch = _db.batch();
    batch.set(variantRef, {
      'label': variant.label,
      'sellPrice': variant.sellPrice,
      'quantity': variant.quantity,
      'totalSold': 0,
      'productName': productName,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
    batch.set(costRef, {'costPrice': variant.costPrice});
    await batch.commit();
  }

  Future<void> deleteProduct(String productId) {
    // NOTE: this only deletes the parent product doc; subcollections
    // (variants/costs) require a Cloud Function or Admin SDK script to
    // recursively delete in production (client SDKs can't delete
    // subcollections). Acceptable for MVP since delete is a rare admin
    // action; flagged for Phase 4 hardening.
    return _products.doc(productId).delete();
  }

  Future<void> setActive(String productId, bool isActive) {
    return _products.doc(productId).update({
      'isActive': isActive,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}

class NewVariantInput {
  const NewVariantInput({
    required this.label,
    required this.sellPrice,
    required this.costPrice,
    required this.quantity,
  });

  final String label;
  final num sellPrice;
  final num costPrice;
  final int quantity;
}
