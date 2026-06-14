import 'package:flutter/material.dart';

class PageContainer extends StatefulWidget {
  const PageContainer({super.key});

  @override
  State<PageContainer> createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.palette, color: Colors.white),
              SizedBox(width: 8),
              Text('Halaman Container — perhatikan dekorasi border!'),
            ],
          ),
          backgroundColor: Colors.red.shade700,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman 3 — Container'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contoh Widget Container',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.red,
                border: Border(
                  bottom: BorderSide(width: 3, color: Colors.black12),
                  left: BorderSide(width: 3, color: Colors.black12),
                  right: BorderSide(width: 3, color: Colors.deepPurpleAccent),
                  top: BorderSide(width: 3, color: Colors.teal),
                ),
              ),
              width: double.infinity,
              height: 100,
              child: const Center(
                child: Text(
                  'belajar container',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Keterangan Border:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildBorderInfo('Atas', Colors.teal),
            _buildBorderInfo('Bawah', Colors.black26),
            _buildBorderInfo('Kiri', Colors.black26),
            _buildBorderInfo('Kanan', Colors.deepPurpleAccent),
          ],
        ),
      ),
    );
  }

  Widget _buildBorderInfo(String sisi, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(width: 16, height: 16, color: color),
          const SizedBox(width: 8),
          Text('Border $sisi'),
        ],
      ),
    );
  }
}
