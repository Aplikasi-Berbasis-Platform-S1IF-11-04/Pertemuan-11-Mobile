import 'package:flutter/material.dart';
import 'detail.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Contact"),
      ),

      body: Center(

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.contact_phone,
              size: 100,
              color: Colors.red,
            ),

            const SizedBox(height: 20),

            ElevatedButton(

              onPressed: () {

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                        "Mengirim data ke Detail"),
                  ),
                );

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) =>
                    const DetailPage(
                      pesan:
                      "Data berhasil dikirim dari Contact Page",
                    ),
                  ),
                );
              },

              child: const Text("Detail"),
            )
          ],
        ),
      ),
    );
  }
}