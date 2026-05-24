import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(
              0xffF5F7FA),

      appBar: AppBar(
        title:
            const Text(
                "Profile"),

        backgroundColor:
            Colors.transparent,
      ),

      body:
          SingleChildScrollView(

        padding:
            const EdgeInsets.all(
                20),

        child: Column(
          children: [

            CircleAvatar(
              radius:70,

              backgroundColor:
                  Colors.blue
                      .shade100,

              child:
                  const Icon(
                Icons.person,
                size:80,
                color:
                    Colors.blue,
              ),
            ),

            const SizedBox(
                height:20),

            Text(
              "D'sharlendita Febianda Aurelia",

              textAlign:
                  TextAlign.center,

              style:
                  GoogleFonts
                      .poppins(

                fontSize:24,

                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
                height:10),

            Text(
              "2311102069",
            ),

            const SizedBox(
                height:40),

            Row(
              children:[

                stat(
                  "6",
                  "Semester",
                ),

                const SizedBox(
                    width:10),

                stat(
                  "ABP",
                  "Praktikum",
                ),

                const SizedBox(
                    width:10),

                stat(
                  "10",
                  "Project",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget stat(
      String value,
      String title){

    return Expanded(

      child: Container(

        height:120,

        decoration:
            BoxDecoration(

          color:
              Colors.white,

          borderRadius:
              BorderRadius.circular(
                  20),

          boxShadow:[

            BoxShadow(
              color:
                  Colors.black12,

              blurRadius:6,
            )
          ],
        ),

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment
                  .center,

          children: [

            Text(
              value,

              style:
                  const TextStyle(
                fontSize:28,
                fontWeight:
                    FontWeight.bold,
                color:
                    Colors.blue,
              ),
            ),

            Text(
              title,

              textAlign:
                  TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}