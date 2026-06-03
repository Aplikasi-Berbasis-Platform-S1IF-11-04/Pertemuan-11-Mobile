import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Nama")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Nama"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Simpan"),
              onPressed: () {
                if (controller.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Nama tidak boleh kosong"),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  Navigator.pop(context, controller.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}