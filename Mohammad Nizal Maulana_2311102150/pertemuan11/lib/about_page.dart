import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("About"),
      ),

      body: Center(

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.info,
              size: 100,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            const Text(
              "Ini halaman About",
              style: TextStyle(
                fontSize: 24,
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
                      const Text("Peringatan"),

                      content: const Text(
                          "Pindah ke Contact?"),

                      actions: [

                        TextButton(

                          onPressed: () {

                            Navigator.pop(context);

                          },

                          child: const Text("Tidak"),
                        ),

                        TextButton(

                          onPressed: () {

                            Navigator.pop(context);

                            Navigator.pushNamed(
                              context,
                              '/contact',
                            );
                          },

                          child: const Text("Ya"),
                        ),
                      ],
                    );
                  },
                );
              },

              child: const Text("Contact"),
            )
          ],
        ),
      ),
    );
  }
}