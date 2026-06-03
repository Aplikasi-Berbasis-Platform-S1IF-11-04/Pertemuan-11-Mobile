import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/custom_dropdown.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() =>
      _ButtonPageState();
}

class _ButtonPageState
    extends State<ButtonPage> {

  bool isLiked = false;

  String selectedValue = "Flutter";

  TextEditingController
      namaController =
      TextEditingController();

  // POP UP CUSTOM
  void showPopup({
    required String title,
    required String message,
    required IconData icon,
    required Color color,
  }) {

    showDialog(
      context: context,

      builder: (context) {

        return AlertDialog(

          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(
                    20),
          ),

          content: Column(
            mainAxisSize:
                MainAxisSize.min,

            children: [

              CircleAvatar(
                radius: 35,
                backgroundColor:
                    color.withOpacity(
                        0.2),

                child: Icon(
                  icon,
                  color: color,
                  size: 40,
                ),
              ),

              const SizedBox(
                  height: 15),

              Text(
                title,

                style:
                    GoogleFonts
                        .poppins(
                  fontSize: 18,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(
                  height: 10),

              Text(
                message,

                textAlign:
                    TextAlign.center,

                style:
                    GoogleFonts
                        .poppins(),
              ),

              const SizedBox(
                  height: 20),

              ElevatedButton(

                style:
                    ElevatedButton
                        .styleFrom(

                  backgroundColor:
                      color,

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                            12),
                  ),
                ),

                onPressed: () {
                  Navigator.pop(
                      context);
                },

                child:
                    const Text(
                  "OK",
                  style: TextStyle(
                    color:
                        Colors.white,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xffF5F7FA),

      appBar: AppBar(
        title: const Text(
          "Button",
        ),
        backgroundColor:
            Colors.transparent,
      ),

      body:
          SingleChildScrollView(

        padding:
            const EdgeInsets.all(
                20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment
                  .start,

          children: [

            Text(
              "Interactive Components",

              style:
                  GoogleFonts
                      .poppins(
                fontSize: 30,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
                height: 10),

            Text(
              "Pilih teknologi favoritmu",
            ),

            const SizedBox(
                height: 30),

            TextField(
              controller:
                  namaController,

              decoration:
                  InputDecoration(

                hintText:
                    "Masukkan nama",

                filled: true,

                fillColor:
                    Colors.white,

                prefixIcon:
                    const Icon(
                  Icons.person,
                ),

                border:
                    OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(
                          18),

                  borderSide:
                      BorderSide.none,
                ),
              ),
            ),

            const SizedBox(
                height: 30),

            CustomDropdown(

              value:
                  selectedValue,

              onChanged:
                  (value) {

                setState(() {

                  selectedValue =
                      value!;

                });
              },
            ),

            const SizedBox(
                height: 30),

            Center(
              child:
                  OutlinedButton.icon(

                onPressed: () {

                  setState(() {
                    isLiked =
                        !isLiked;
                  });

                  if (isLiked) {

                    showPopup(
                      title:
                          "Berhasil",

                      message:
                          "Ditambahkan ke favorit",

                      icon:
                          Icons.favorite,

                      color:
                          Colors.red,
                    );

                  } else {

                    showPopup(
                      title:
                          "Informasi",

                      message:
                          "Dihapus dari favorit",

                      icon:
                          Icons.favorite_border,

                      color:
                          Colors.orange,
                    );
                  }
                },

                icon: Icon(

                  isLiked
                      ? Icons.favorite
                      : Icons.favorite_border,

                  color:
                      Colors.red,
                ),

                label: Text(
                  isLiked
                      ? "Disukai"
                      : "Suka",
                ),
              ),
            ),

            const SizedBox(
                height: 30),

            Container(

              width:
                  double.infinity,

              padding:
                  const EdgeInsets
                      .all(20),

              decoration:
                  BoxDecoration(

                borderRadius:
                    BorderRadius.circular(
                        20),

                gradient:
                    const LinearGradient(

                  colors: [

                    Color(
                        0xff6A11CB),

                    Color(
                        0xff2575FC)
                  ],
                ),
              ),

              child: Column(
                children: [

                  const Icon(
                    Icons.code,
                    color:
                        Colors.white,
                    size: 50,
                  ),

                  const SizedBox(
                      height: 10),

                  Text(
                    selectedValue,

                    style:
                        GoogleFonts
                            .poppins(

                      color:
                          Colors.white,

                      fontSize: 24,

                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
                height: 40),

            SizedBox(

              width:
                  double.infinity,

              height: 55,

              child:
                  ElevatedButton(

                style:
                    ElevatedButton
                        .styleFrom(

                  backgroundColor:
                      Colors.green,

                  shape:
                      RoundedRectangleBorder(

                    borderRadius:
                        BorderRadius.circular(
                            15),
                  ),
                ),

                onPressed: () {

                  showPopup(

                    title:
                        "Berhasil",

                    message:
                        "Data anda berhasil disimpan",

                    icon:
                        Icons.check_circle,

                    color:
                        Colors.green,
                  );
                },

                child:
                    const Text(
                  "Submit",

                  style:
                      TextStyle(
                    color:
                        Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}