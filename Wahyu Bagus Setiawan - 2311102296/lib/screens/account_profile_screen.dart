import 'package:flutter/material.dart';
import '../services/app_notification_service.dart';

class AccountProfileScreen extends StatelessWidget {
  const AccountProfileScreen({super.key}); // Menggunakan super.key terbaru

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(32),
        constraints: const BoxConstraints(maxWidth: 400), // Perbaikan maxWidth
        decoration: BoxDecoration(
          color: const Color(0xff161b22),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xff00ffcc).withValues(alpha: 0.2)), // Menggunakan withValues
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: Color(0xff00ffcc), shape: BoxShape.circle),
              child: const CircleAvatar(
                radius: 46, 
                backgroundColor: Color(0xff0d1117), 
                child: Icon(Icons.security, size: 40, color: Color(0xff00ffcc)),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Wahyu Bagus Setiawan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5)),
            const SizedBox(height: 4),
            const Text('S1 Teknik Informatika', style: TextStyle(color: Color(0xff00ffcc), fontSize: 13, fontWeight: FontWeight.w600)),
            const Text('NIM: 2311102296', style: TextStyle(color: Colors.grey, fontSize: 12, height: 1.8)),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff00ffcc).withValues(alpha: 0.05),
                foregroundColor: const Color(0xff00ffcc),
                side: const BorderSide(color: Color(0xff00ffcc)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Kredensi Staf tervalidasi aman.'), backgroundColor: Colors.teal),
                );
                AppNotificationService.instance.triggerAlert(head: 'Keamanan Profil', body: 'Sinkronisasi token NIM berhasil.');
              },
              child: const Text('SINKRONISASI AKUN', style: TextStyle(fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}