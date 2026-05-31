import 'package:flutter/material.dart';

class HalamanGaleri extends StatelessWidget {
  const HalamanGaleri({super.key});

  static const List<Map<String, dynamic>> kategori = [
    {'icon': Icons.fastfood_rounded, 'judul': 'Makanan', 'jumlah': 'Rp 450.000', 'warna': Color(0xFFF59E0B)},
    {'icon': Icons.directions_bus_rounded, 'judul': 'Transportasi', 'jumlah': 'Rp 200.000', 'warna': Color(0xFF3B82F6)},
    {'icon': Icons.school_rounded, 'judul': 'Pendidikan', 'jumlah': 'Rp 500.000', 'warna': Color(0xFF00875A)},
    {'icon': Icons.movie_rounded, 'judul': 'Hiburan', 'jumlah': 'Rp 150.000', 'warna': Color(0xFF8B5CF6)},
    {'icon': Icons.shopping_bag_rounded, 'judul': 'Belanja', 'jumlah': 'Rp 300.000', 'warna': Color(0xFFEC4899)},
    {'icon': Icons.home_rounded, 'judul': 'Rumah Tangga', 'jumlah': 'Rp 100.000', 'warna': Color(0xFF14B8A6)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F2),
      appBar: AppBar(title: const Text('Kategori Pengeluaran')),
      body: Column(
        children: [
          // Summary banner
          Container(
            color: const Color(0xFF00875A),
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Pengeluaran', style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 12)),
                      const SizedBox(height: 4),
                      const Text('Rp 1.700.000', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Bulan Ini', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: kategori.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.05,
              ),
              itemBuilder: (context, index) {
                final item = kategori[index];
                final color = item['warna'] as Color;

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade100),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: color.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(item['icon'] as IconData, color: color, size: 22),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['judul'] as String,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1A1A2E)),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item['jumlah'] as String,
                                  style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 6),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(3),
                                  child: LinearProgressIndicator(
                                    value: 0.4 + (index * 0.08),
                                    backgroundColor: color.withValues(alpha: 0.1),
                                    valueColor: AlwaysStoppedAnimation<Color>(color),
                                    minHeight: 4,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
