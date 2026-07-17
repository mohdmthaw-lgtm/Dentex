import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

import '../../core/constants/firestore_paths.dart';
import '../../models/user_profile.dart';

/// Doctor accounts are admin-provisioned (confirmed business flow: the
/// company onboards a doctor client, not the other way around), so account
/// creation always goes through the `createDoctorAccount` callable Cloud
/// Function — it needs the Admin SDK to create the Firebase Auth user and
/// set the role custom claim, which a client SDK can never do directly.
class UserRepository {
  UserRepository({FirebaseFirestore? firestore, FirebaseFunctions? functions})
      : _db = firestore ?? FirebaseFirestore.instance,
        _functions = functions ?? FirebaseFunctions.instance;

  final FirebaseFirestore _db;
  final FirebaseFunctions _functions;

  CollectionReference<Map<String, dynamic>> get _users =>
      _db.collection(FirestorePaths.users);

  Future<UserProfile?> getUser(String uid) async {
    final doc = await _users.doc(uid).get();
    if (!doc.exists) return null;
    return UserProfile.fromDoc(doc.id, doc.data()!);
  }

  Stream<UserProfile?> watchUser(String uid) {
    return _users.doc(uid).snapshots().map(
        (doc) => doc.exists ? UserProfile.fromDoc(doc.id, doc.data()!) : null);
  }

  Stream<List<UserProfile>> watchDoctors() {
    return _users
        .where('role', isEqualTo: AppRoles.doctor)
        .orderBy('name')
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => UserProfile.fromDoc(d.id, d.data())).toList());
  }

  Stream<List<UserProfile>> watchTopDoctorsBySpend({int limit = 10}) {
    return _users
        .where('role', isEqualTo: AppRoles.doctor)
        .orderBy('stats.totalSpent', descending: true)
        .limit(limit)
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => UserProfile.fromDoc(d.id, d.data())).toList());
  }

  Stream<List<UserProfile>> watchTopDoctorsByDebt({int limit = 10}) {
    return _users
        .where('role', isEqualTo: AppRoles.doctor)
        .orderBy('stats.totalDebt', descending: true)
        .limit(limit)
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => UserProfile.fromDoc(d.id, d.data())).toList());
  }

  /// Client-side substring filter over the (typically small, single-company
  /// customer list) doctor set — no Firestore native text search, and not
  /// worth an Algolia/Typesense integration until the list grows large.
  Future<List<UserProfile>> searchDoctors(String query) async {
    final snap = await _users.where('role', isEqualTo: AppRoles.doctor).get();
    final all =
        snap.docs.map((d) => UserProfile.fromDoc(d.id, d.data())).toList();
    if (query.trim().isEmpty) return all;
    final lower = query.trim().toLowerCase();
    return all
        .where((u) =>
            u.name.toLowerCase().contains(lower) ||
            u.clinicName.toLowerCase().contains(lower) ||
            u.phone.contains(lower))
        .toList();
  }

  Future<String> createDoctorAccount({
    required String phone,
    required String password,
    required String name,
    required String clinicName,
    required String location,
  }) async {
    final result = await _functions.httpsCallable('createDoctorAccount').call({
      'phone': phone,
      'password': password,
      'name': name,
      'clinicName': clinicName,
      'location': location,
    });
    return result.data['uid'] as String;
  }

  Future<void> registerFcmToken(String uid, String token) {
    return _users.doc(uid).update({
      'fcmTokens': FieldValue.arrayUnion([token]),
    });
  }
}
