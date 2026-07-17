import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/firebase/service_providers.dart';
import '../constants/firestore_paths.dart';

enum AppAuthStatus { loading, signedOut, admin, doctor }

class AppAuthState {
  const AppAuthState({required this.status, this.uid});
  final AppAuthStatus status;
  final String? uid;

  static const loading = AppAuthState(status: AppAuthStatus.loading);
  static const signedOut = AppAuthState(status: AppAuthStatus.signedOut);
}

/// Single source of truth for "who is signed in and what role are they",
/// combining Firebase's authStateChanges() stream with a claims fetch.
/// go_router's redirect (see app_router.dart) watches this to send
/// unauthenticated users to /login and route each role into its own shell.
final appAuthStateProvider = StreamProvider<AppAuthState>((ref) async* {
  final auth = ref.watch(authServiceProvider);
  await for (final user in auth.authStateChanges) {
    if (user == null) {
      yield AppAuthState.signedOut;
      continue;
    }
    final tokenResult = await user.getIdTokenResult();
    final role = tokenResult.claims?['role'] as String?;
    if (role == AppRoles.admin) {
      yield AppAuthState(status: AppAuthStatus.admin, uid: user.uid);
    } else if (role == AppRoles.doctor) {
      yield AppAuthState(status: AppAuthStatus.doctor, uid: user.uid);
    } else {
      // Signed in but no recognized role claim — treat as signed out
      // rather than letting an unclaimed account wander the app.
      yield AppAuthState.signedOut;
    }
  }
});

/// Re-exported for convenience where only the FirebaseAuth user (not the
/// resolved role) is needed.
final firebaseUserProvider = StreamProvider<User?>((ref) {
  return ref.watch(authServiceProvider).authStateChanges;
});
