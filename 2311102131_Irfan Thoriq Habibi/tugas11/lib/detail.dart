import 'package:flutter/material.dart';
import 'edit.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final int index;
  final List<String> names;

  const DetailPage({
    super.key,
    required this.name,
    required this.index,
    required this.names,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Nama")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text("Edit"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EditPage(
                      name: name,
                      index: index,
                      names: names,
                    ),
                  ),
                ).then((_) => Navigator.pop(context));
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Hapus"),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Konfirmasi"),
                    content: const Text("Yakin ingin menghapus data ini?"),
                    actions: [
                      TextButton(
                        child: const Text("Tidak"),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: const Text("Ya"),
                        onPressed: () {
                          names.removeAt(index);
                          Navigator.pop(context);
                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Data berhasil dihapus"),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}