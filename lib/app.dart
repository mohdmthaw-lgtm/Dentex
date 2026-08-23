import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/router/auth_state_provider.dart';
import 'core/theme/app_theme.dart';
import 'services/firebase/service_providers.dart';

/// Built Arabic-first / RTL — the entire product spec was written in
/// Arabic and there was no request for a bilingual UI, so `ar` is the only
/// supported locale rather than defaulting to English with an Arabic
/// option bolted on.
class DentexApp extends ConsumerWidget {
  const DentexApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    // Fires once per role resolution (sign-in, or app relaunch with an
    // existing session) — not on every rebuild, since ref.listen only
    // invokes its callback when appAuthStateProvider actually emits a new
    // value. Admin subscribes to the shared alerts topic; a doctor's
    // device token is saved to users/{uid}.fcmTokens for notifyUser (see
    // functions/src/lib/fcm.ts) to target. Previously neither call site
    // existed anywhere in the app, so no push notification — admin or
    // doctor — ever actually reached a device despite the Cloud Functions
    // side already sending them.
    ref.listen<AsyncValue<AppAuthState>>(appAuthStateProvider, (previous, next) {
      final state = next.value;
      if (state == null) return;
      _registerForPushNotifications(ref, state);
    });

    return MaterialApp.router(
      title: 'dentex',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.light,
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: router,
    );
  }
}

Future<void> _registerForPushNotifications(WidgetRef ref, AppAuthState state) async {
  final fcm = ref.read(fcmServiceProvider);
  try {
    await fcm.requestPermission();
    if (state.status == AppAuthStatus.admin) {
      await fcm.subscribeAdminToAlerts();
    } else if (state.status == AppAuthStatus.doctor && state.uid != null) {
      final token = await fcm.getToken();
      if (token != null) {
        await ref.read(userRepositoryProvider).registerFcmToken(state.uid!, token);
      }
    }
  } catch (_) {
    // Best-effort — permission prompts can be dismissed, tokens can be
    // briefly unavailable right after install; none of that should block
    // the app itself from loading.
  }
}
