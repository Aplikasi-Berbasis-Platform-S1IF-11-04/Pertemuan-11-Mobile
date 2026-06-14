import 'package:flutter/material.dart';
import 'gallery_page.dart';

class ProfilePage extends StatelessWidget {

  final String nama;

  const ProfilePage({
    super.key,
    required this.nama,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,

      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

            child: Padding(
              padding: const EdgeInsets.all(25),

              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [

                  Container(
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.orange,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Halo, $nama 👋",
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Selamat datang di halaman Profile",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,

                    child: ElevatedButton.icon(

                      icon:
                          const Icon(Icons.photo_library),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                      ),

                      onPressed: () {

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

                              title:
                                  const Text("Notifikasi"),

                              content: const Text(
                                "Masuk ke Gallery",
                              ),

                              actions: [

                                TextButton(

                                  onPressed: () {

                                    Navigator.pop(
                                        context);

                                    Navigator.pushReplacement(
                                      context,

                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const GalleryPage(),
                                      ),
                                    );
                                  },

                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      },

                      label: const Text(
                        "Gallery",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}