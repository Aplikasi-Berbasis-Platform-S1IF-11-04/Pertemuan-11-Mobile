// lib/screens/profile_screen.dart
// Halaman Profil - salah satu tab di BottomNavigationBar

import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController(text: 'Mahasiswa Flutter');
  final _nimController = TextEditingController(text: '12345678');
  final NotificationService _notifService = NotificationService();
  bool _isEditing = false;

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    super.dispose();
  }

  void _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isEditing = false);

      // ✅ NOTIFIKASI 10: Snackbar + Local notification saat simpan profil
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 8),
              Text('Profil berhasil diperbarui!'),
            ],
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );

      await _notifService.showNotification(
        id: 10,
        title: '👤 Profil Diperbarui',
        body: 'Data profil "${_namaController.text}" berhasil disimpan!',
        payload: 'profile_updated',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Avatar
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.blue.shade100,
                  child: const Icon(Icons.person, size: 60, color: Colors.blue),
                ),
                if (_isEditing)
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Fitur ubah foto akan segera tersedia')),
                        );
                      },
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),

            // Card form profil
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informasi Profil',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Field Nama
                    TextFormField(
                      controller: _namaController,
                      enabled: _isEditing,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nama',
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Nama tidak boleh kosong';
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),

                    // Field NIM
                    TextFormField(
                      controller: _nimController,
                      enabled: _isEditing,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'NIM',
                        prefixIcon: Icon(Icons.badge),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'NIM tidak boleh kosong';
                        if (value.length < 8) return 'NIM minimal 8 karakter';
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol edit / simpan
            SizedBox(
              width: double.infinity,
              child: _isEditing
                  ? Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _saveProfile,
                            icon: const Icon(Icons.save),
                            label: const Text('Simpan'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 13),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => setState(() => _isEditing = false),
                            icon: const Icon(Icons.cancel),
                            label: const Text('Batal'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 13),
                            ),
                          ),
                        ),
                      ],
                    )
                  : ElevatedButton.icon(
                      onPressed: () => setState(() => _isEditing = true),
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit Profil'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 13),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
