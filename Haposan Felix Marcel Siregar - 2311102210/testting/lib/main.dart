import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/page_text_dasar.dart';
import 'pages/page_button.dart';
import 'pages/page_container.dart';
import 'pages/page_login_form.dart';
import 'pages/page_textfield.dart';
import 'pages/page_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 7 - Navigasi & Notifikasi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/text-dasar': (context) => const PageTextDasar(),
        '/button': (context) => const PageButton(),
        '/container': (context) => const PageContainer(),
        '/login-form': (context) => const PageLoginForm(),
        '/textfield': (context) => const PageTextField(),
        '/counter': (context) => const PageCounter(),
      },
    );
  }
}
