import 'package:flutter/material.dart';
import 'add.dart';
import 'detail.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  static List<String> names = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Nama")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddPage()),
          );

          if (result != null) {
            setState(() => names.add(result));

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Data berhasil ditambahkan")),
            );
          }
        },
      ),
      body: names.isEmpty
          ? const Center(child: Text("Belum ada data"))
          : ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(names[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
                          name: names[index],
                          index: index,
                          names: names,
                        ),
                      ),
                    ).then((_) => setState(() {}));
                  },
                );
              },
            ),
    );
  }
}