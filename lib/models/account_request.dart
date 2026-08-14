import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';

part 'account_request.freezed.dart';
part 'account_request.g.dart';

/// A pending "request an account" submission from a prospective doctor who
/// has no login yet — the public, signed-out counterpart to admin-provisioned
/// accounts (see [UserRepository.createDoctorAccount]). Written directly by
/// an unauthenticated client, so Firestore rules (not app logic) are what
/// keep its shape and status restricted to `pending` on create.
@freezed
class AccountRequest with _$AccountRequest {
  const factory AccountRequest({
    required String id,
    required String name,
    required String phone,
    // Chosen by the doctor themselves at request time (not the admin) —
    // used as-is when the admin approves and createDoctorAccount runs, then
    // cleared from this doc (see AccountRequestRepository.markApproved).
    // Only ever readable by an admin (see firestore.rules); a prospective
    // doctor can create their own request doc but never read any request
    // back, including their own.
    @Default('') String password,
    @Default('') String clinicName,
    @Default('') String location,
    @Default('') String notes,
    @Default(AccountRequestStatus.pending) String status,
    @TimestampConverter() DateTime? createdAt,
  }) = _AccountRequest;

  factory AccountRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountRequestFromJson(json);

  factory AccountRequest.fromDoc(String id, Map<String, dynamic> data) =>
      AccountRequest.fromJson({...data, 'id': id});
}

/// Kept here (rather than only in firestore_paths.dart) so model consumers
/// don't need a second import just for the @Default value above.
class AccountRequestStatus {
  AccountRequestStatus._();

  static const pending = 'pending';
  static const approved = 'approved';
  static const rejected = 'rejected';
}
