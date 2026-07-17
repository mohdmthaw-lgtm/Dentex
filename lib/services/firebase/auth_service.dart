import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/constants/firestore_paths.dart';
import '../../core/utils/phone_utils.dart';

/// Result of a successful sign-in, carrying the resolved role so callers
/// don't need a second round trip before routing.
class AuthResult {
  const AuthResult({required this.uid, required this.role});
  final String uid;
  final String role;
}

class WrongCredentialsException implements Exception {
  const WrongCredentialsException();
}

/// Handles phone+password login for both roles. Firebase Auth has no native
/// phone+password provider (native phone auth requires SMS OTP, which is
/// explicitly out of scope for this app), so every account signs in with a
/// synthetic email derived from its phone number via [PhoneUtils].
class AuthService {
  AuthService({FirebaseAuth? auth, FirebaseFirestore? firestore})
      : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  /// The literal string the admin types into both the phone and password
  /// fields on the login screen.
  static const adminShortcutInput = 'admin';

  /// Base64-obfuscated real admin password, substituted transparently when
  /// [adminShortcutInput] is typed into both fields — the user never sees or
  /// types the real credential.
  ///
  /// SECURITY TRADE-OFF (accepted, see plan): this string is technically
  /// extractable from a decompiled app binary. Authorization is enforced by
  /// the `role` custom claim on the resulting Firebase Auth token, not by
  /// "which email logged in" — so this credential can be rotated at any
  /// time (see scripts/seed_admin.js) without changing the on-screen
  /// admin/admin login UX.
  ///
  static const _obfuscatedAdminPassword =
      'eV9WVWk2cmg5SkwxODZOc2gzS09Rb1ZF';

  static String get _realAdminPassword =>
      utf8.decode(base64.decode(_obfuscatedAdminPassword));

  static const _adminSyntheticEmail = 'admin@dentex.local';

  /// Signs in with a phone number + password. If both fields are the
  /// literal "admin", the real seeded admin credentials are substituted.
  Future<AuthResult> signIn({
    required String phoneOrAdmin,
    required String password,
  }) async {
    final isAdminShortcut =
        phoneOrAdmin.trim().toLowerCase() == adminShortcutInput &&
            password == adminShortcutInput;

    final email = isAdminShortcut
        ? _adminSyntheticEmail
        : PhoneUtils.syntheticEmailFor(phoneOrAdmin);
    final effectivePassword = isAdminShortcut ? _realAdminPassword : password;

    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: effectivePassword,
      );
      final uid = credential.user!.uid;

      // Custom claims are only visible after a forced token refresh
      // immediately following sign-in.
      final tokenResult =
          await credential.user!.getIdTokenResult(true);
      final role = tokenResult.claims?['role'] as String? ?? '';

      if (role != AppRoles.admin && role != AppRoles.doctor) {
        await _auth.signOut();
        throw const WrongCredentialsException();
      }

      return AuthResult(uid: uid, role: role);
    } on FirebaseAuthException catch (_) {
      throw const WrongCredentialsException();
    }
  }

  Future<void> signOut() => _auth.signOut();

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  /// Re-reads the current user's custom claims (e.g. after app resume).
  Future<String?> currentRole({bool forceRefresh = false}) async {
    final user = _auth.currentUser;
    if (user == null) return null;
    final result = await user.getIdTokenResult(forceRefresh);
    return result.claims?['role'] as String?;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> currentUserDoc() {
    final uid = _auth.currentUser!.uid;
    return _firestore.collection(FirestorePaths.users).doc(uid).get();
  }
}
