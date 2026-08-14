import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_paths.dart';
import '../../models/account_request.dart';

/// Handles the public "request an account" submission and the admin-side
/// review of it. Submission itself never touches Firebase Auth — it's a
/// plain Firestore write a signed-out client can make (see firestore.rules),
/// so approval still goes through [UserRepository.createDoctorAccount]
/// exactly like the admin's existing walk-in "add doctor" flow.
class AccountRequestRepository {
  AccountRequestRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _requests =>
      _db.collection(FirestorePaths.accountRequests);

  Future<void> submitRequest({
    required String name,
    required String phone,
    required String password,
    String clinicName = '',
    String location = '',
    String notes = '',
  }) {
    return _requests.add({
      'name': name,
      'phone': phone,
      'password': password,
      'clinicName': clinicName,
      'location': location,
      'notes': notes,
      'status': AccountRequestStatus.pending,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<List<AccountRequest>> watchPendingRequests() {
    return _requests
        .where('status', isEqualTo: AccountRequestStatus.pending)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => AccountRequest.fromDoc(d.id, d.data())).toList());
  }

  Stream<int> watchPendingCount() =>
      watchPendingRequests().map((list) => list.length);

  Future<void> rejectRequest(String id) {
    return _requests.doc(id).update({'status': AccountRequestStatus.rejected});
  }

  Future<void> markApproved(String id, String doctorUid) {
    return _requests.doc(id).update({
      'status': AccountRequestStatus.approved,
      'doctorUid': doctorUid,
      // Never needed again once the account exists — don't leave a
      // plaintext password sitting in Firestore any longer than necessary.
      'password': FieldValue.delete(),
    });
  }
}
