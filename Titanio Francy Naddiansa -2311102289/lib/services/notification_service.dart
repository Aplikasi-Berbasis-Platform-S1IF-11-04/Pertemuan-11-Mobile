// lib/services/notification_service.dart
// Service untuk mengelola notifikasi menggunakan flutter_local_notifications
// Sesuai materi Modul 7 - Notification

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  // Singleton pattern
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  // Object FlutterLocalNotificationsPlugin sesuai Modul 7
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Inisialisasi plugin (sesuai initState Modul 7)
  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
    );

    // Request permission untuk Android 13+
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  // Handler saat notifikasi dipilih (sesuai Modul 7)
  void onSelectNotification(NotificationResponse response) {
    debugPrint('Notifikasi dipilih: ${response.payload}');
  }

  // Fungsi tampilkan notifikasi sederhana (sesuai showNotification() Modul 7)
  Future<void> showNotification({
    int id = 0,
    required String title,
    required String body,
    String? payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'modul7_channel', // channel id
      'Modul 7 Notifications', // channel name
      channelDescription: 'Notifikasi untuk aplikasi Modul 7',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      icon: '@mipmap/ic_launcher',
    );

    const DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  // Notifikasi saat pindah halaman
  Future<void> showNavigationNotification(String pageName) async {
    await showNotification(
      id: 1,
      title: '📱 Navigasi',
      body: 'Anda berpindah ke halaman $pageName',
      payload: 'navigation_$pageName',
    );
  }

  // Notifikasi saat data berhasil disimpan
  Future<void> showSuccessNotification(String userName) async {
    await showNotification(
      id: 2,
      title: '✅ Data Tersimpan',
      body: 'Data pengguna "$userName" berhasil ditambahkan!',
      payload: 'success_$userName',
    );
  }

  // Notifikasi saat ada error
  Future<void> showErrorNotification(String message) async {
    await showNotification(
      id: 3,
      title: '❌ Terjadi Kesalahan',
      body: message,
      payload: 'error',
    );
  }
}
