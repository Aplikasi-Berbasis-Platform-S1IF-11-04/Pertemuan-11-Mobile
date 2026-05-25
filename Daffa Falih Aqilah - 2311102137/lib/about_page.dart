import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,

      appBar: AppBar(
        title: const Text("About"),
        centerTitle: true,
        backgroundColor: Colors.green,
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
                      color: Colors.green.shade100,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.info,
                      size: 80,
                      color: Colors.green,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "About Page",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Ini adalah halaman About yang berisi informasi aplikasi",
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

                      icon: const Icon(Icons.contact_page),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
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
                                  const Text("Peringatan"),

                              content: const Text(
                                "Pindah ke Contact?",
                              ),

                              actions: [

                                TextButton(

                                  onPressed: () {
                                    Navigator.pop(
                                        context);
                                  },

                                  child:
                                      const Text("Tidak"),
                                ),

                                ElevatedButton(

                                  style:
                                      ElevatedButton
                                          .styleFrom(
                                    backgroundColor:
                                        Colors.green,
                                    foregroundColor:
                                        Colors.white,
                                  ),

                                  onPressed: () {

                                    Navigator.pop(
                                        context);

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

                      label: const Text(
                        "Contact",
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