import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppNotificationService {
  AppNotificationService._privateConstructor();
  static final AppNotificationService instance = AppNotificationService._privateConstructor();

  final FlutterLocalNotificationsPlugin _localNotifier = FlutterLocalNotificationsPlugin();

  Future<void> setupNotifications() async {
    if (kIsWeb) {
      debugPrint("⚡ [System Web] Inisialisasi engine notifikasi berhasil dialihkan.");
      return;
    }

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initSettings = InitializationSettings(android: androidSettings);
    await _localNotifier.initialize(initSettings);
  }

  Future<void> triggerAlert({required String head, required String body}) async {
    debugPrint('🔔 NEO-NOTIF: [$head] -> $body');
    if (kIsWeb) return;

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'cyber_inventory_channel',
      'Manajemen Inventaris Premium',
      channelDescription: 'Notifikasi internal ekosistem pergudangan modern',
      importance: Importance.max,
      priority: Priority.high,
    );

    await _localNotifier.show(
      DateTime.now().hashCode,
      head,
      body,
      const NotificationDetails(android: androidPlatformChannelSpecifics),
    );
  }
}