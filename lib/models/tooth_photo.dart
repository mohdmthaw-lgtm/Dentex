import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';
import 'patient.dart';

part 'tooth_photo.freezed.dart';
part 'tooth_photo.g.dart';

/// Top-level `toothPhotos` collection (not a patients/{id}/toothPhotos
/// subcollection — see [Visit]'s doc comment for why: a nested
/// collection's `list` query can't satisfy Firestore's rule-provability
/// check). A photo is tied to one specific tooth AND one specific visit
/// (not just the patient generally), so a returning patient's dental chart
/// shows a real documented history per tooth. Storage path mirrors this:
/// see StorageService.uploadToothPhoto.
@freezed
abstract class ToothPhoto with _$ToothPhoto {
  const factory ToothPhoto({
    required String id,
    required String ownerId,
    @Default(PatientOwnerType.doctor) String ownerType,
    required String patientId,
    required String toothNumber,
    required String visitId,
    @Default(ToothPhotoCategory.before) String category,
    required String storageUrl,
    required String storagePath,
    required String uploadedByUid,
    @TimestampConverter() DateTime? uploadedAt,
  }) = _ToothPhoto;

  factory ToothPhoto.fromJson(Map<String, dynamic> json) =>
      _$ToothPhotoFromJson(json);

  factory ToothPhoto.fromDoc(String id, Map<String, dynamic> data) =>
      ToothPhoto.fromJson({...data, 'id': id});
}

class ToothPhotoCategory {
  ToothPhotoCategory._();

  static const before = 'before';
  static const after = 'after';
  static const xray = 'xray';

  static const all = [before, after, xray];

  static const labels = {before: 'قبل', after: 'بعد', xray: 'أشعة تشخيصية'};
}
