import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_paths.dart';
import '../../models/tooth_photo.dart';

/// Top-level `toothPhotos` collection — pure metadata CRUD; the actual
/// image bytes live in Firebase Storage (see
/// StorageService.uploadToothPhoto). Not a patients/{id}/toothPhotos
/// subcollection — see [Visit]'s doc comment on why nested collections
/// can't satisfy Firestore's `list`-query rule-provability check.
class ToothPhotoRepository {
  ToothPhotoRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _photos =>
      _db.collection(FirestorePaths.toothPhotos);

  /// All of one tooth's photos across every visit, newest first — grouped
  /// by visit/date in the archive screen, not here. ownerId/ownerType are
  /// filtered explicitly (not just present on the returned docs) because
  /// Firestore rejects a `list` query outright unless it can statically
  /// prove every possible matching document satisfies canAccessOwner —
  /// see PatientRepository.watchPatientsForOwner's doc comment.
  Stream<List<ToothPhoto>> watchToothPhotos(
      String patientId, String ownerId, String ownerType, String toothNumber) {
    return _photos
        .where('patientId', isEqualTo: patientId)
        .where('ownerId', isEqualTo: ownerId)
        .where('ownerType', isEqualTo: ownerType)
        .where('toothNumber', isEqualTo: toothNumber)
        .orderBy('uploadedAt', descending: true)
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => ToothPhoto.fromDoc(d.id, d.data())).toList());
  }

  Future<void> addToothPhoto({
    required String patientId,
    required String ownerId,
    required String ownerType,
    required String toothNumber,
    required String visitId,
    required String category,
    required String storageUrl,
    required String storagePath,
    required String uploadedByUid,
  }) {
    return _photos.add({
      'ownerId': ownerId,
      'ownerType': ownerType,
      'patientId': patientId,
      'toothNumber': toothNumber,
      'visitId': visitId,
      'category': category,
      'storageUrl': storageUrl,
      'storagePath': storagePath,
      'uploadedByUid': uploadedByUid,
      'uploadedAt': FieldValue.serverTimestamp(),
    });
  }
}
