import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/home_page.dart';
import 'pages/button_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pertemuan 10 - 11',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),

      // TAMBAHAN ROUTE
      initialRoute: "/",

      routes: {
        "/": (context) => const MainNavigation(),
        "/button": (context) => const ButtonPage(),
        "/profile": (context) => const ProfilePage(),
      },
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() =>
      _MainNavigationState();
}

class _MainNavigationState
    extends State<MainNavigation> {

  int currentIndex = 0;

  final pages = const [
    HomePage(),
    ButtonPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xffF5F7FA),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Pertemuan 10 - 11',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: AnimatedSwitcher(
        duration:
            const Duration(
          milliseconds: 400,
        ),
        child:
            pages[currentIndex],
      ),

      bottomNavigationBar:
          NavigationBar(
        selectedIndex:
            currentIndex,

        onDestinationSelected:
            (index) {

          setState(() {
            currentIndex =
                index;
          });

          // TAMBAHAN NOTIFIKASI
          String pesan = "";

          if (index == 0) {
            pesan =
                "Masuk halaman Home";
          } else if (index == 1) {
            pesan =
                "Masuk halaman Button";
          } else {
            pesan =
                "Masuk halaman Profile";
          }

          ScaffoldMessenger.of(
                  context)
              .showSnackBar(
            SnackBar(
              content:
                  Text(pesan),
              duration:
                  const Duration(
                seconds: 1,
              ),
            ),
          );
        },

        destinations: const [

          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
            ),
            selectedIcon:
                Icon(Icons.home),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.smart_button_outlined,
            ),
            selectedIcon:
                Icon(Icons.smart_button),
            label: 'Action',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
            ),
            selectedIcon:
                Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}