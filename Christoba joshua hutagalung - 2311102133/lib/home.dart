import 'package:flutter/material.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController namaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.home,
              size: 100,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Masukkan Nama",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(

              onPressed: () {

                if (namaController.text.isEmpty) {

                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                          "Nama tidak boleh kosong"),
                      backgroundColor: Colors.red,
                    ),
                  );

                } else {

                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                          "Berhasil ke halaman Profile"),
                      backgroundColor: Colors.green,
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProfilePage(
                        nama:
                        namaController.text,
                      ),
                    ),
                  );
                }
              },

              child: const Text("Masuk"),
            ),
          ],
        ),
      ),
    );
  }
}