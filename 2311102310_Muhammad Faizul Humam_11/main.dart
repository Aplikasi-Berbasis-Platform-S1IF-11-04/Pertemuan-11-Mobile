import 'package:flutter/material.dart';

void main() {
  runApp(const AplikasiGabungan());
}

class AplikasiGabungan extends StatelessWidget {
  const AplikasiGabungan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Eksplorasi Widget v2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HalamanNavigasiUtama(),
    );
  }
}

class HalamanNavigasiUtama extends StatefulWidget {
  const HalamanNavigasiUtama({super.key});

  @override
  State<HalamanNavigasiUtama> createState() => _HalamanNavigasiUtamaState();
}

class _HalamanNavigasiUtamaState extends State<HalamanNavigasiUtama> {
  int _selectedIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Fungsi khusus untuk menampilkan Notifikasi (SnackBar)
  void TampilkanNotifikasi(BuildContext context, String pesan) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar(); // Hapus notifikasi sebelumnya agar tidak antre lama
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(pesan),
        duration: const Duration(seconds: 2), // Notifikasi muncul selama 2 detik
        backgroundColor: Colors.deepPurple,
        behavior: SnackBarBehavior.floating, // Membuat notifikasi melayang
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // SEKARANG SUDAH ADA 6 HALAMAN (MEMENUHI SYARAT TUGAS MODUL 7)
    final List<Widget> _halaman = [
      // Halaman 1
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("ini data saya ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                // Notifikasi pas menekan tombol
                TampilkanNotifikasi(context, "Tombol login berhasil ditekan!");
              },
              style: OutlinedButton.styleFrom(backgroundColor: Colors.amberAccent),
              child: const Text("login"),
            ),
          ],
        ),
      ),

      // Halaman 2
      Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          decoration: const BoxDecoration(
              color: Colors.red,
              border: Border(
                bottom: BorderSide(width: 3, color: Colors.black12),
                left: BorderSide(width: 3, color: Colors.black12),
                right: BorderSide(width: 3, color: Colors.deepPurpleAccent),
                top: BorderSide(width: 3, color: Colors.teal),
              )),
          width: double.infinity,
          height: 100,
          child: const Center(child: Text("belajar container", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        ),
      ),

      // Halaman 3
      SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text("FORM LOGIN", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(20),
              child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), hintText: "silahkan masukan username")),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: TextField(obscureText: true, decoration: InputDecoration(border: OutlineInputBorder(), hintText: "silahkan masukan password")),
            ),
            ElevatedButton(
              onPressed: () {
                TampilkanNotifikasi(context, "Data Berhasil Disimpan!");
              },
              child: const Text("data"),
            ),
          ],
        ),
      ),

      // Halaman 4
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),

      // Halaman 5
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: TextField(
            maxLength: 20,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                filled: true,
                fillColor: Colors.blue.shade100,
                labelText: "username",
                hintText: "silahkan masukan user name ",
                helperText: "masukan hanya 20 karakter",
                prefixIcon: const Icon(Icons.supervisor_account)),
          ),
        ),
      ),

      // HALAMAN 6 (MENU BARU TAMBAHAN)
      const Center(
        child: Text(
          "Ini Halaman Informasi Modul 7",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    ];

    final List<String> _judulAppBar = [
      "Tombol & Teks",
      "Belajar Container",
      "Form Login",
      "Counter Page",
      "Kustom TextField",
      "Halaman Modul 7" // Judul halaman ke-6
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_judulAppBar[_selectedIndex]),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _halaman[_selectedIndex],
      floatingActionButton: _selectedIndex == 3
          ? FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Penting agar muat hingga 6 tombol bawah
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          // MEMENUHI SYARAT: MUNCILLKAN NOTIFIKASI SAAT PERPINDAHAN HALAMAN!
          TampilkanNotifikasi(context, "Anda berpindah ke: ${_judulAppBar[index]}");
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.touch_app), label: 'Tombol'),
          BottomNavigationBarItem(icon: Icon(Icons.crop_square), label: 'Kotak'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Counter'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Input'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'), // Ikon halaman ke-6
        ],
      ),
    );
  }
}