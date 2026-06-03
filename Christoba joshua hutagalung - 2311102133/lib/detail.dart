import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  final String pesan;

  const DetailPage({
    super.key,
    required this.pesan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Detail"),
      ),

      body: Center(

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.teal,
            ),

            const SizedBox(height: 20),

            Text(
              pesan,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(

              onPressed: () {

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content:
                    Text("Kembali ke halaman sebelumnya"),
                  ),
                );

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