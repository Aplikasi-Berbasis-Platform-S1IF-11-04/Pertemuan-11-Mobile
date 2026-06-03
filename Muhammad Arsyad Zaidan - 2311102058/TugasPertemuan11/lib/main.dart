import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'ProfilePage.dart';
import 'GalleryPage.dart';
import 'AboutPage.dart';
import 'ContactPage.dart';
import 'DetailPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modul 7 Flutter - Muhammad Arsyad Zaidan',
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      home: const HomePage(),
      routes: {
        '/profile': (context) => const ProfilePage(nama: "Arsyad"),
        '/gallery': (context) => const GalleryPage(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
        '/detail': (context) => const DetailPage(pesan: ""),
      },
    );
  }
}
