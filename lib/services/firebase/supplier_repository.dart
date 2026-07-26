import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_paths.dart';
import '../../models/supplier.dart';

class SupplierRepository {
  SupplierRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _suppliers =>
      _db.collection(FirestorePaths.suppliers);

  Stream<List<Supplier>> watchSuppliers() {
    return _suppliers.orderBy('name').snapshots().map((snap) =>
        snap.docs.map((d) => Supplier.fromDoc(d.id, d.data())).toList());
  }

  /// Looks up a supplier by exact name, creating it if it doesn't exist yet
  /// — lets a form add a brand-new supplier inline without a separate
  /// "manage suppliers" trip.
  Future<Supplier> getOrCreate(String name) async {
    final trimmed = name.trim();
    final existing =
        await _suppliers.where('name', isEqualTo: trimmed).limit(1).get();
    if (existing.docs.isNotEmpty) {
      return Supplier.fromDoc(existing.docs.first.id, existing.docs.first.data());
    }
    final ref = await _suppliers.add({
      'name': trimmed,
      'createdAt': FieldValue.serverTimestamp(),
    });
    return Supplier(id: ref.id, name: trimmed);
  }
}
