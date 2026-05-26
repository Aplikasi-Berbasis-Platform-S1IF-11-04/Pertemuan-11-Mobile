import 'package:flutter/material.dart';
import 'GalleryPage.dart';

class ProfilePage extends StatelessWidget {
  final String nama;
  const ProfilePage({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle, size: 100, color: Colors.indigo),
            const SizedBox(height: 20),
            Text(
              "Halo, $nama",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Notifikasi Sistem"),
                      content: const Text(
                        "Anda akan dialihkan menuju halaman Gallery.",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GalleryPage(),
                              ),
                            );
                          },
                          child: const Text("Lanjutkan"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("Buka Gallery"),
            ),
          ],
        ),
      ),
    );
  }
}
