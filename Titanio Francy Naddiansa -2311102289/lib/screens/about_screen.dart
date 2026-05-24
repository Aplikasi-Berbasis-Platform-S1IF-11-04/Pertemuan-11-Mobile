// lib/screens/about_screen.dart
// Halaman Tentang Aplikasi

import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          // Logo
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.phone_android, size: 70, color: Colors.blue),
          ),
          const SizedBox(height: 20),

          // Judul
          const Text(
            'Modul 7\nNavigasi & Notifikasi',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Pemrograman Perangkat Bergerak 2024',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 30),

          // Info card
          _buildInfoCard('📖 Materi', [
            '✅ Model Class (Modul 7.1)',
            '✅ Navigation push/pop (Modul 7.2)',
            '✅ Navigation dengan data (Modul 7.2.2)',
            '✅ Local Notifications (Modul 7.3)',
            '✅ Form & Validasi (Modul 6.2.2)',
            '✅ BottomNavigationBar (Modul 6.2.3.2)',
            '✅ DropdownButton (Modul 6.2.4.3)',
          ]),
          const SizedBox(height: 16),

          _buildInfoCard('🔔 Jenis Notifikasi', [
            '• SnackBar saat perpindahan tab',
            '• SnackBar sukses tambah data',
            '• SnackBar error validasi form',
            '• SnackBar saat hapus data (+ Undo)',
            '• Local Notification saat buka halaman',
            '• Local Notification saat simpan data',
            '• Dialog konfirmasi hapus',
          ]),
          const SizedBox(height: 30),

          // Tombol test notifikasi
          ElevatedButton.icon(
            onPressed: () async {
              await NotificationService().showNotification(
                id: 88,
                title: '📱 Tentang Aplikasi',
                body: 'Praktikum PPB Modul 7 - Flutter Navigation & Notification',
                payload: 'about',
              );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Notifikasi test dikirim dari halaman Tentang!'),
                    backgroundColor: Colors.blue,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            icon: const Icon(Icons.notifications_active),
            label: const Text('Test Notifikasi'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, List<String> items) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(item, style: const TextStyle(fontSize: 13)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
