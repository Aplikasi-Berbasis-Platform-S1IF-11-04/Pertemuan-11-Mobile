import 'package:flutter/material.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.hourglass_empty, size: 60, color: Color(0xff00ffcc)),
            const SizedBox(height: 20),
            const Text('PREMIUM VAULT ARCHITECTURE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.white)),
            const SizedBox(height: 12),
            Container(
              constraints: const BoxConstraints(maxWidth: 450), // Perbaikan maxWidth
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xff161b22), borderRadius: BorderRadius.circular(12)),
              child: const Text(
                'Aplikasi ini merepresentasikan integrasi mutakhir state manajemen tab Flutter Web, kustomisasi PageRouteBuilder animasi mikro, dan skema proteksi kegagalan plugin lokal pada Google Chrome.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white60, fontSize: 13, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}