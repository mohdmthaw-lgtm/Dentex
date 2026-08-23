import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_paths.dart';
import '../../models/medical_center.dart';

/// Medical centers are created by the admin while approving a 'center'
/// [AccountRequest] (a plain client write — admins bypass firestore.rules'
/// isAdmin() gate, no Cloud Function needed here, unlike doctor accounts
/// which require the Admin SDK to create a Firebase Auth user).
class MedicalCenterRepository {
  MedicalCenterRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _centers =>
      _db.collection(FirestorePaths.medicalCenters);

  Future<String> createCenter({
    required String name,
    required int chairCount,
    required String managerUid,
    required String managerName,
  }) async {
    final ref = _centers.doc();
    await ref.set({
      'name': name,
      'chairCount': chairCount,
      'memberUids': <String>[managerUid],
      'memberNames': {managerUid: managerName},
      'managerUid': managerUid,
      'createdAt': FieldValue.serverTimestamp(),
    });
    return ref.id;
  }

  Future<void> addMember(String centerId, String uid, String name) {
    return _centers.doc(centerId).update({
      'memberUids': FieldValue.arrayUnion([uid]),
      'memberNames.$uid': name,
    });
  }

  Stream<MedicalCenter?> watchCenter(String centerId) {
    return _centers.doc(centerId).snapshots().map(
        (doc) => doc.exists ? MedicalCenter.fromDoc(doc.id, doc.data()!) : null);
  }

  Future<MedicalCenter?> getCenter(String centerId) async {
    final doc = await _centers.doc(centerId).get();
    if (!doc.exists) return null;
    return MedicalCenter.fromDoc(doc.id, doc.data()!);
  }
}
