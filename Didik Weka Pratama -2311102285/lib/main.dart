// lib/main.dart
// Entry point aplikasi Modul 7 - Navigasi dan Notifikasi
// Praktikum Pemrograman Perangkat Bergerak 2024

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'services/notification_service.dart';

// void main() sesuai pola di Modul 7
void main() async {
  // Pastikan Flutter binding siap sebelum inisialisasi plugin
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi NotificationService (sesuai initState Modul 7)
  await NotificationService().initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 7 - Navigasi & Notifikasi',
      debugShowCheckedModeBanner: false,

      // Theme utama aplikasi
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,

        appBarTheme: const AppBarTheme(
          elevation: 2,
        ),

        cardTheme: CardThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),

      // Halaman awal
      home: const HomeScreen(),
    );
  }
}