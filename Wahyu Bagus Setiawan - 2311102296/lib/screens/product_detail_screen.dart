import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product item;
  const ProductDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DEKRAUSI DETIL', style: TextStyle(fontSize: 14, letterSpacing: 1))),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500), // Perbaikan maxWidth
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xff161b22),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xff00b3ff).withValues(alpha: 0.2)),
              boxShadow: [
                BoxShadow(color: const Color(0xff00b3ff).withValues(alpha: 0.03), blurRadius: 20, spreadRadius: 5)
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: const Color(0xff00b3ff).withValues(alpha: 0.1), shape: BoxShape.circle),
                  child: const Icon(Icons.token, size: 50, color: Color(0xff00b3ff)),
                ),
                const SizedBox(height: 16),
                Text(item.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Divider(color: Color(0xff00b3ff), thickness: 1, indent: 50, endIndent: 50),
                ),
                const SizedBox(height: 8),
                Table(
                  children: [
                    _buildNeonRow('ID SKU', item.sku),
                    _buildNeonRow('Grup Kategori', item.category),
                    _buildNeonRow('Volume Stok', '${item.stock} Unit Available'),
                    _buildNeonRow('Kalkulasi Nilai', 'Rp ${item.price.toStringAsFixed(0)}'),
                  ],
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color(0xff161b22),
                    foregroundColor: const Color(0xff00b3ff),
                    side: const BorderSide(color: Color(0xff00b3ff)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, size: 18),
                  label: const Text('KEMBALI KE VAULT', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TableRow _buildNeonRow(String key, String value) {
    return TableRow(
      children: [
        Padding(padding: const EdgeInsets.all(12.0), child: Text(key, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))),
        Padding(padding: const EdgeInsets.all(12.0), child: Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500))),
      ],
    );
  }
}