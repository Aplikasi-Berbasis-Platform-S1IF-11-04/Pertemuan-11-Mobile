import 'package:flutter/material.dart';

import 'home_page.dart';
import 'profile_page.dart';
import 'gallery_page.dart';
import 'about_page.dart';
import 'contact_page.dart';
import 'detail_page.dart';

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