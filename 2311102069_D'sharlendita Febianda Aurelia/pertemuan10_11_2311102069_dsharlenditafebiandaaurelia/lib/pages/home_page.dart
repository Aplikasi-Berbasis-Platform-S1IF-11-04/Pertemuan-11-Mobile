import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/feature_card.dart';
import 'button_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Container(
            height: 180,
            width: double.infinity,

            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(25),

              gradient:
                  const LinearGradient(
                colors: [
                  Color(0xff6A11CB),
                  Color(0xff2575FC),
                ],
              ),
            ),

            child: Padding(
              padding:
                  const EdgeInsets.all(
                      24),

              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    "Selamat Datang 👋",

                    style:
                        GoogleFonts.poppins(
                      color:
                          Colors.white,

                      fontSize: 28,

                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    "D'sharlendita Febianda Aurelia | 2311102069",

                    style:
                        GoogleFonts.poppins(
                      color:
                          Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          Row(
            children: [

              // BUTTON CARD
              Expanded(
                child: SizedBox(
                  height: 190,

                  child:
                      GestureDetector(

                    onTap: () {

                      // Notifikasi
                      ScaffoldMessenger.of(
                              context)
                          .showSnackBar(

                        const SnackBar(

                          content: Text(
                            "Membuka halaman Button",
                          ),

                          duration:
                              Duration(
                            seconds: 1,
                          ),
                        ),
                      );

                      // Delay agar notif muncul dulu
                      Future.delayed(
                        const Duration(
                          milliseconds: 800,
                        ),

                        () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (_) =>
                                  const ButtonPage(),
                            ),
                          );

                        },
                      );
                    },

                    child:
                        const FeatureCard(
                      icon:
                          Icons.smart_button,

                      title:
                          "Button",

                      subtitle:
                          "Implementasi project button",
                    ),
                  ),
                ),
              ),

              const SizedBox(
                width: 15,
              ),

              // PROFILE CARD
              Expanded(
                child: SizedBox(
                  height: 190,

                  child:
                      GestureDetector(

                    onTap: () {

                      ScaffoldMessenger.of(
                              context)
                          .showSnackBar(

                        const SnackBar(

                          content: Text(
                            "Membuka halaman Profile",
                          ),

                          duration:
                              Duration(
                            seconds: 1,
                          ),
                        ),
                      );

                      Future.delayed(
                        const Duration(
                          milliseconds: 800,
                        ),

                        () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (_) =>
                                  const ProfilePage(),
                            ),
                          );

                        },
                      );
                    },

                    child:
                        const FeatureCard(
                      icon:
                          Icons.person,

                      title:
                          "Profile",

                      subtitle:
                          "Halaman profile",
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}