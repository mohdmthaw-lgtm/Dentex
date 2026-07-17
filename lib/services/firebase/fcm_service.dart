import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

/// Push notification wiring. Admin device(s) subscribe to the shared
/// `admin_alerts` topic on login rather than per-token fan-out — simpler,
/// and avoids stale-token bookkeeping for what's realistically one owner
/// across a couple of devices. Doctors receive no push notifications per
/// spec, so there is no doctor-side topic.
class FcmService {
  FcmService({FirebaseMessaging? messaging})
      : _messaging = messaging ?? FirebaseMessaging.instance;

  final FirebaseMessaging _messaging;

  static const adminAlertsTopic = 'admin_alerts';

  Future<void> requestPermission() async {
    await _messaging.requestPermission(alert: true, badge: true, sound: true);
  }

  Future<void> subscribeAdminToAlerts() async {
    await _messaging.subscribeToTopic(adminAlertsTopic);
  }

  Future<void> unsubscribeAdminFromAlerts() async {
    await _messaging.unsubscribeFromTopic(adminAlertsTopic);
  }

  Future<String?> getToken() => _messaging.getToken();

  /// Registers foreground/background/tap handlers. Wired up from app.dart
  /// once a role is known so the deep-link target can be resolved.
  void listenForegroundMessages(void Function(RemoteMessage) onMessage) {
    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        debugPrint('FCM foreground message: ${message.notification?.title}');
      }
      onMessage(message);
    });
  }

  void listenMessageOpenedApp(void Function(RemoteMessage) onOpened) {
    FirebaseMessaging.onMessageOpenedApp.listen(onOpened);
  }
}
