import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Gallery"),
      ),

      body: Center(

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.photo,
              size: 100,
              color: Colors.purple,
            ),

            const SizedBox(height: 20),

            ElevatedButton(

              onPressed: () {

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content:
                    Text("Masuk halaman About"),
                  ),
                );

                Navigator.pushNamed(
                  context,
                  '/about',
                );
              },

              child: const Text("About"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(

              onPressed: () {

                Navigator.pop(context);

              },

              child: const Text("Kembali"),
            )
          ],
        ),
      ),
    );
  }
}