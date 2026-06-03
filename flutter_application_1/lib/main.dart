import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigasi & Data Mahasiswa',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      initialRoute: '/',
      routes: {
        '/': (context) => const CommonPage(title: 'Home'),
        '/profil': (context) => const CommonPage(title: 'Profil'),
        '/kuliah': (context) => const CommonPage(title: 'Kuliah'),
        '/tugas': (context) => const CommonPage(title: 'Tugas Kuliah'),
        '/jadwal': (context) => const CommonPage(title: 'Jadwal'),
        '/kontak': (context) => const CommonPage(title: 'Kontak Kami'),
        '/tentang': (context) => const CommonPage(title: 'Tentang Aplikasi'),
      },
    );
  }
}

// Model data sederhana untuk menampung Nama dan NIM
class Mahasiswa {
  final String nama;
  final String nim;
  Mahasiswa(this.nama, this.nim);
}

class CommonPage extends StatefulWidget {
  final String title;
  const CommonPage({super.key, required this.title});

  @override
  State<CommonPage> createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  // List untuk menyimpan objek Mahasiswa
  final List<Mahasiswa> _daftarMahasiswa = [];

  // Controller untuk mengambil input dari dua TextField
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();

  void notifyNavigation(String routeName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berpindah ke $routeName'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 500),
      ),
    );
    Navigator.pushNamed(context, routeName);
  }

  void showInputDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Input Data Mahasiswa'),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Agar dialog tidak terlalu tinggi
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: "Nama Lengkap",
                hintText: "Contoh: Randy Lambas",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _nimController,
              decoration: const InputDecoration(
                labelText: "NIM",
                hintText: "Contoh: 2311102096",
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _namaController.clear();
              _nimController.clear();
              Navigator.pop(context);
            },
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_namaController.text.isNotEmpty &&
                  _nimController.text.isNotEmpty) {
                setState(() {
                  // Menambahkan data baru ke dalam list
                  _daftarMahasiswa.add(
                    Mahasiswa(_namaController.text, _nimController.text),
                  );
                });
                _namaController.clear();
                _nimController.clear();
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Data Mahasiswa Berhasil Ditambahkan!'),
                  ),
                );
              }
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
              accountName: Text("Randy Lambas Batubara"),
              accountEmail: Text("2311102096"),
            ),
            _buildDrawerItem(Icons.home, 'Home', '/'),
            _buildDrawerItem(Icons.person, 'Profil', '/profil'),
            _buildDrawerItem(Icons.school, 'Kuliah', '/kuliah'),
            _buildDrawerItem(Icons.assignment, 'Tugas', '/tugas'),
            _buildDrawerItem(Icons.calendar_today, 'Jadwal', '/jadwal'),
            _buildDrawerItem(Icons.contact_mail, 'Kontak', '/kontak'),
            _buildDrawerItem(Icons.info, 'Tentang', '/tentang'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              "Halaman: ${widget.title}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: showInputDialog,
              icon: const Icon(Icons.person_add),
              label: const Text('Tambah Data Mahasiswa'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const Divider(height: 40, thickness: 2),
            const Text(
              "Daftar Mahasiswa Terinput:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: _daftarMahasiswa.isEmpty
                  ? const Center(child: Text("Belum ada data yang dimasukkan."))
                  : ListView.builder(
                      itemCount: _daftarMahasiswa.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text(
                                _daftarMahasiswa[index].nama[0].toUpperCase(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(
                              _daftarMahasiswa[index].nama,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "NIM: ${_daftarMahasiswa[index].nim}",
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                setState(() {
                                  _daftarMahasiswa.removeAt(index);
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        if (ModalRoute.of(context)?.settings.name != route) {
          notifyNavigation(route);
        }
      },
    );
  }
}
