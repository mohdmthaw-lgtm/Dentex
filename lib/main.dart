import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    // Expected until `flutterfire configure` replaces the placeholder
    // values in firebase_options.dart with a real project's config — swallow
    // rather than crash so the UI is still reachable during local
    // development; every Firebase-backed screen already handles its own
    // call failures (see e.g. login_screen.dart's signIn try/catch).
    debugPrint('Firebase.initializeApp failed (expected pre-setup): $e');
  }
  runApp(const ProviderScope(child: DentexApp()));
}
