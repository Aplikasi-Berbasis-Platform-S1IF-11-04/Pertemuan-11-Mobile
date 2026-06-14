import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AplikasiPraktikum());
}

class AplikasiPraktikum extends StatelessWidget {
  const AplikasiPraktikum({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Poster & Papan Skor'),
          backgroundColor: Colors.blue,
        ), // AppBar

        body: const PenghitungMahasiswa(),
      ), // Scaffold
    ); // MaterialApp
  }
}

class PenghitungMahasiswa extends StatefulWidget {
  const PenghitungMahasiswa({super.key});

  @override
  State<PenghitungMahasiswa> createState() {
    return PenghitungMahasiswaState();
  }
}

class PenghitungMahasiswaState extends State<PenghitungMahasiswa> {
  int jumlahHadir = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Tambahan tulisan
          Text(
            'Jumlah Praktikan yang Hadir',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 20),

          // Angka counter
          Text(
            '$jumlahHadir',
            style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ), // Text

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              setState(() {
                jumlahHadir++;
              });
            },

            child: Text(
              'Tambah Mahasiswa',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
          ), // ElevatedButton
        ],
      ), // Column
    ); // Center
  }
}
