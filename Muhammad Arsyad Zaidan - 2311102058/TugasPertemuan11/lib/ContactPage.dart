import 'package:flutter/material.dart';
import 'DetailPage.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.chat, size: 100, color: Colors.blueGrey),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Mentransfer parameter pesan ke Halaman Detail...",
                    ),
                    backgroundColor: Colors.blueGrey,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailPage(
                      pesan:
                          "Pesan Terenkripsi: Data sukses terkirim dari Arsyad (2311102058)",
                    ),
                  ),
                );
              },
              child: const Text("Lihat Detail Kiriman"),
            ),
          ],
        ),
      ),
    );
  }
}
