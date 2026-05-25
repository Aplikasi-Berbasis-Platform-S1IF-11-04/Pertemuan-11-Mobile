import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  final String name;
  final int index;
  final List<String> names;

  const EditPage({
    super.key,
    required this.name,
    required this.index,
    required this.names,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: name);

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Nama")),
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
              child: const Text("Update"),
              onPressed: () {
                if (controller.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Nama tidak boleh kosong"),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Konfirmasi"),
                      content: const Text(
                          "Yakin ingin menyimpan perubahan data?"),
                      actions: [
                        TextButton(
                          child: const Text("Tidak"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        TextButton(
                          child: const Text("Ya"),
                          onPressed: () {
                            names[index] = controller.text;

                            Navigator.pop(context); 
                            Navigator.pop(context); 

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Data berhasil diupdate"),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}