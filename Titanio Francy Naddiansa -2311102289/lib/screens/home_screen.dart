// lib/screens/home_screen.dart
// Halaman Utama dengan BottomNavigationBar (Modul 6) + Navigation (Modul 7)

import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/notification_service.dart';
import 'detail_screen.dart';
import 'add_user_screen.dart';
import 'profile_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Index untuk BottomNavigationBar (sesuai Modul 6)
  int _selectedIndex = 0;

  final NotificationService _notificationService = NotificationService();

  // Data awal pengguna (menggunakan Model dari Modul 7)
  List<User> _users = [
    const User(id: 1, name: 'Budi Santoso', email: 'budi@email.com', role: 'Mahasiswa'),
    const User(id: 2, name: 'Siti Rahayu', email: 'siti@email.com', role: 'Dosen'),
    const User(id: 3, name: 'Andi Wijaya', email: 'andi@email.com', role: 'Staff'),
    const User(id: 4, name: 'Dewi Lestari', email: 'dewi@email.com', role: 'Mahasiswa'),
  ];

  // Fungsi handler BottomNavigationBar tap (sesuai Modul 6)
  void _onItemTapped(int index) async {
    // ✅ NOTIFIKASI 5: Snackbar saat pindah tab
    final tabNames = ['Beranda', 'Profil', 'Tentang'];
    if (index != _selectedIndex) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Berpindah ke tab ${tabNames[index]}'),
          backgroundColor: Colors.blueGrey,
          duration: const Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );

      // ✅ NOTIFIKASI 6: Local notification saat pindah tab
      await _notificationService.showNavigationNotification(tabNames[index]);
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  // Fungsi tambah user baru (callback dari AddUserScreen)
  void _addUser(User user) {
    setState(() {
      _users.add(user);
    });
  }

  // Navigasi ke halaman Detail (Navigator.push sesuai Modul 7)
  void _navigateToDetail(User user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(user: user),
      ),
    );

    // ✅ NOTIFIKASI 7: Snackbar saat buka detail
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Membuka detail pengguna: ${user.name}'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  // Navigasi ke halaman Tambah User (Navigator.push sesuai Modul 7)
  void _navigateToAddUser() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddUserScreen(onUserAdded: _addUser),
      ),
    );
  }

  // Hapus user dengan konfirmasi Dialog + Notifikasi
  void _deleteUser(User user) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Pengguna'),
        content: Text('Yakin ingin menghapus "${user.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() {
        _users.removeWhere((u) => u.id == user.id);
      });

      // ✅ NOTIFIKASI 8: SnackBar saat data dihapus
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Pengguna "${user.name}" berhasil dihapus'),
            backgroundColor: Colors.orange,
            action: SnackBarAction(
              label: 'Undo',
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  _users.add(user);
                });
              },
            ),
          ),
        );
      }
    }
  }

  // Halaman Beranda - daftar pengguna
  Widget _buildHomeTab() {
    return Column(
      children: [
        // Info jumlah pengguna
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.blueAccent],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Pengguna',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  Text(
                    '${_users.length} orang',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.people, color: Colors.white, size: 40),
            ],
          ),
        ),

        // Daftar pengguna
        Expanded(
          child: _users.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_off, size: 60, color: Colors.grey),
                      SizedBox(height: 12),
                      Text(
                        'Belum ada pengguna',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    final user = _users[index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: _getRoleColor(user.role),
                          child: Text(
                            user.name.substring(0, 1).toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          user.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(user.email),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Badge role
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: _getRoleColor(user.role).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: _getRoleColor(user.role)),
                              ),
                              child: Text(
                                user.role,
                                style: TextStyle(
                                  color: _getRoleColor(user.role),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // Tombol hapus
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                              onPressed: () => _deleteUser(user),
                            ),
                          ],
                        ),
                        // Navigasi ke Detail saat di-tap (sesuai Modul 7)
                        onTap: () => _navigateToDetail(user),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Color _getRoleColor(String role) {
    switch (role) {
      case 'Dosen':
        return Colors.purple;
      case 'Staff':
        return Colors.orange;
      case 'Admin':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  // Konten untuk setiap tab (sesuai Modul 6 - BottomNavigationBar)
  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeTab();
      case 1:
        return const ProfileScreen();
      case 2:
        return const AboutScreen();
      default:
        return _buildHomeTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manajemen Pengguna',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          // ✅ NOTIFIKASI 9: IconButton dengan notifikasi
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () async {
              await _notificationService.showNotification(
                id: 99,
                title: '🔔 Test Notifikasi',
                body: 'Notifikasi sistem berjalan dengan baik!',
                payload: 'test',
              );
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Test notifikasi dikirim!'),
                    backgroundColor: Colors.blue,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: _buildBody(),

      // FAB hanya muncul di tab Beranda
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton.extended(
              onPressed: _navigateToAddUser,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: const Icon(Icons.add),
              label: const Text('Tambah User'),
            )
          : null,

      // BottomNavigationBar sesuai Modul 6
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Tentang',
          ),
        ],
      ),
    );
  }
}
