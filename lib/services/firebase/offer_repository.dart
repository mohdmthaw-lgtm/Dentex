import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_paths.dart';
import '../../models/offer.dart';

class OfferRepository {
  OfferRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _offers =>
      _db.collection(FirestorePaths.offers);

  Stream<List<Offer>> watchOffers({bool activeOnly = false}) {
    Query<Map<String, dynamic>> query =
        _offers.orderBy('createdAt', descending: true);
    if (activeOnly) {
      query = query.where('isActive', isEqualTo: true);
    }
    // A single malformed/legacy document (e.g. pre-dating this schema)
    // must not take down the whole list for every other valid offer —
    // skip it instead of letting Offer.fromDoc's exception bubble up and
    // kill the entire stream.
    return query.snapshots().map((snap) => snap.docs
        .map((d) {
          try {
            return Offer.fromDoc(d.id, d.data());
          } catch (_) {
            return null;
          }
        })
        .whereType<Offer>()
        .toList());
  }

  Future<Offer?> getOffer(String offerId) async {
    final doc = await _offers.doc(offerId).get();
    if (!doc.exists) return null;
    return Offer.fromDoc(doc.id, doc.data()!);
  }

  Stream<Offer?> watchOffer(String offerId) {
    return _offers
        .doc(offerId)
        .snapshots()
        .map((doc) => doc.exists ? Offer.fromDoc(doc.id, doc.data()!) : null);
  }

  Future<String> createOffer({
    required String title,
    required String description,
    required List<OfferItem> items,
    required num offerPrice,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final ref = await _offers.add({
      'title': title,
      'description': description,
      'imageUrl': '',
      'imagePath': '',
      'items': items.map((i) => i.toJson()).toList(),
      'offerPrice': offerPrice,
      'isActive': true,
      'startDate':
          startDate == null ? null : Timestamp.fromDate(startDate),
      'endDate': endDate == null ? null : Timestamp.fromDate(endDate),
      'createdAt': FieldValue.serverTimestamp(),
      'timesSold': 0,
      'unitsSold': 0,
      'totalRevenue': 0,
      'totalDiscountGiven': 0,
    });
    return ref.id;
  }

  Future<void> updateOffer({
    required String offerId,
    required String title,
    required String description,
    required List<OfferItem> items,
    required num offerPrice,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return _offers.doc(offerId).update({
      'title': title,
      'description': description,
      'items': items.map((i) => i.toJson()).toList(),
      'offerPrice': offerPrice,
      'startDate':
          startDate == null ? null : Timestamp.fromDate(startDate),
      'endDate': endDate == null ? null : Timestamp.fromDate(endDate),
    });
  }

  Future<void> updateOfferImage({
    required String offerId,
    required String imageUrl,
    required String imagePath,
  }) {
    return _offers.doc(offerId).update({
      'imageUrl': imageUrl,
      'imagePath': imagePath,
    });
  }

  Future<void> setActive(String offerId, bool isActive) {
    return _offers.doc(offerId).update({'isActive': isActive});
  }

  Future<void> deleteOffer(String offerId) {
    return _offers.doc(offerId).delete();
  }
}
