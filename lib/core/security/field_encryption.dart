import 'dart:convert';

import 'package:cryptography/cryptography.dart';

/// App-level encryption for a handful of sensitive [Patient] fields (phone,
/// medical notes) — a real layer on top of Firestore's own at-rest
/// encryption, not a replacement for it. Every read/write in this app goes
/// directly from the client to Firestore (see firestore.rules) with no
/// server-mediated layer that could otherwise enforce this, so encryption
/// has to happen here.
///
/// The key is embedded in the compiled app rather than fetched from a
/// server. That is a deliberate, accepted ceiling: it protects a
/// leaked/dumped Firestore export from being readable on its own, but not a
/// fully reverse-engineered app binary. Rotating [_secretKeyBase64] requires
/// decrypting every existing patient doc with the old key and re-encrypting
/// with the new one — never rotate it without also running that migration,
/// or every existing patient's phone/medical notes becomes unreadable.
class FieldEncryptionService {
  const FieldEncryptionService();

  static final _algorithm = AesGcm.with256bits();

  static const _secretKeyBase64 = 'hCJkoe7A67tdsQH/3Va+A+8ol/tlVQ9Zo9joPpLjomA=';

  static const _macLength = 16; // AES-GCM's Mac is always 16 bytes.

  SecretKey get _secretKey => SecretKey(base64Decode(_secretKeyBase64));

  /// Returns `"<base64 nonce>:<base64 cipherText+mac>"`, or `''` for `''`
  /// input so optional fields don't need special-casing at call sites.
  Future<String> encryptField(String plaintext) async {
    if (plaintext.isEmpty) return '';
    final secretBox = await _algorithm.encrypt(
      utf8.encode(plaintext),
      secretKey: _secretKey,
    );
    final payload = secretBox.cipherText + secretBox.mac.bytes;
    return '${base64Encode(secretBox.nonce)}:${base64Encode(payload)}';
  }

  Future<String> decryptField(String encoded) async {
    if (encoded.isEmpty) return '';
    final parts = encoded.split(':');
    if (parts.length != 2) return '';
    final nonce = base64Decode(parts[0]);
    final payload = base64Decode(parts[1]);
    final macStart = payload.length - _macLength;
    final secretBox = SecretBox(
      payload.sublist(0, macStart),
      nonce: nonce,
      mac: Mac(payload.sublist(macStart)),
    );
    final clear = await _algorithm.decrypt(secretBox, secretKey: _secretKey);
    return utf8.decode(clear);
  }
}
