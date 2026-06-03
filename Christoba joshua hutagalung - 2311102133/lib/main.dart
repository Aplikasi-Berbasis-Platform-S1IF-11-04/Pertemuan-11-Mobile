import 'package:flutter/material.dart';

// Sesuaikan dengan nama file yang ada di folder lib kamu
import 'home.dart';
import 'profile.dart';
import 'gallery.dart';
import 'about.dart';
import 'contact.dart';
import 'detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modul 7 Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const HomePage(),

      routes: {
        '/profile': (context) => const ProfilePage(nama: ''),
        '/gallery': (context) => const GalleryPage(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
        '/detail': (context) => const DetailPage(
              pesan: '',
            ),
      },
    );
  }
}