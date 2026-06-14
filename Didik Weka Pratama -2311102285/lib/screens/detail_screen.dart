// lib/screens/detail_screen.dart
// Halaman Detail - Menerima data dari halaman sebelumnya
// Sesuai materi Modul 7 - Navigation Mengirim Data

import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/notification_service.dart';

class DetailScreen extends StatelessWidget {
  // Parameter data yang diterima (sesuai Modul 7 - DetailScreen)
  final User user;

  const DetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail: ${user.name}'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Notifikasi saat kembali ke halaman sebelumnya
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Kembali ke halaman daftar pengguna'),
                backgroundColor: Colors.blueGrey,
                duration: Duration(seconds: 2),
              ),
            );
            // Navigator.pop sesuai Modul 7
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header kartu profil
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Text(
                  user.name.substring(0, 1).toUpperCase(),
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Card detail data user
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildDetailRow(Icons.badge, 'ID', '#${user.id}'),
                    const Divider(),
                    _buildDetailRow(Icons.person, 'Nama', user.name),
                    const Divider(),
                    _buildDetailRow(Icons.email, 'Email', user.email),
                    const Divider(),
                    _buildDetailRow(Icons.work, 'Role', user.role),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Tombol kembali (Navigator.pop sesuai Modul 7)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 22),
          const SizedBox(width: 12),
          Text(
            '$label:',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
