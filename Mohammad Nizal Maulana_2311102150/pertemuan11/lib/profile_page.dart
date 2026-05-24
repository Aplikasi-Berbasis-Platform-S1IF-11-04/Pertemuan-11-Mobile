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

      appBar: AppBar(
        title: const Text("Profile"),
      ),

      body: Center(

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.person,
              size: 100,
              color: Colors.orange,
            ),

            const SizedBox(height: 20),

            Text(
              "Halo, $nama",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(

              onPressed: () {

                showDialog(
                  context: context,

                  builder: (context) {

                    return AlertDialog(
                      title:
                      const Text("Notifikasi"),

                      content: const Text(
                          "Masuk ke Gallery"),

                      actions: [

                        TextButton(

                          onPressed: () {

                            Navigator.pop(context);

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

              child: const Text("Gallery"),
            )
          ],
        ),
      ),
    );
  }
}