import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_detail_screen.dart';
import 'item_contribution_screen.dart';

class ProductCatalogScreen extends StatefulWidget {
  const ProductCatalogScreen({super.key});

  @override
  State<ProductCatalogScreen> createState() => _ProductCatalogScreenState();
}

class _ProductCatalogScreenState extends State<ProductCatalogScreen> {
  final List<Product> _items = [
    const Product(sku: 'SKU-771', title: 'Quantum Laptop i9', stock: 7, price: 32000000, category: 'Elektronik'),
    const Product(sku: 'SKU-892', title: 'Holographic Keyboard', stock: 18, price: 2150000, category: 'Aksesoris'),
    const Product(sku: 'SKU-403', title: 'Cyber Ergonomic Pod', stock: 3, price: 14500000, category: 'Furnitur'),
  ];

  void _removeProduct(Product item) async {
    final bool? verify = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xff161b22),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Colors.redAccent)),
        title: const Text('DESTRUKSI DATA', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, letterSpacing: 1)),
        content: Text('Apakah Anda yakin ingin menghapus arsip "${item.title}" dari pusat database?', style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('BATAL', style: TextStyle(color: Colors.grey))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('HAPUS PERMANEN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );

    if (verify == true) {
      final int originalIndex = _items.indexOf(item);
      setState(() => _items.remove(item));

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('"${item.title}" berhasil dieliminasi.'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'RESTORE DATA',
            textColor: Colors.white,
            onPressed: () {
              setState(() => _items.insert(originalIndex, item));
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _items.isEmpty
          ? const Center(child: Text('Gudang Kosong / Menunggu Pasokan', style: TextStyle(color: Colors.grey)))
          : ListView.builder(
              itemCount: _items.length,
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 80),
              itemBuilder: (context, idx) {
                final data = _items[idx];
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [const Color(0xff161b22), const Color(0xff161b22).withValues(alpha: 0.6)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xff00ffcc).withValues(alpha: 0.1), width: 1),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xff00ffcc).withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.layers, color: Color(0xff00ffcc)),
                      ),
                      title: Text(data.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6.0), // Perbaikan mutakhir di baris ini sayang
                        child: Text('${data.sku}  |  Stok: ${data.stock} Pcs', style: TextStyle(color: Colors.grey.shade400, fontSize: 13)),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_sweep, color: Colors.redAccent),
                        onPressed: () => _removeProduct(data),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) => ProductDetailScreen(item: data),
                            transitionsBuilder: (c, anim, a2, child) {
                              return FadeTransition(
                                opacity: anim,
                                child: SlideTransition(
                                  position: Tween<Offset>(begin: const Offset(0.0, 0.1), end: Offset.zero).animate(
                                    CurvedAnimation(parent: anim, curve: Curves.fastLinearToSlowEaseIn),
                                  ),
                                  child: child,
                                ),
                              );
                            },
                            transitionDuration: const Duration(milliseconds: 500),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff00ffcc),
        foregroundColor: Colors.black,
        elevation: 4,
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (c, a1, a2) => ItemContributionScreen(
                onSave: (newProduct) => setState(() => _items.add(newProduct)),
              ),
              transitionsBuilder: (c, anim, a2, child) {
                return ScaleTransition(
                  scale: Tween<double>(begin: 0.9, end: 1.0).animate(CurvedAnimation(parent: anim, curve: Curves.easeOutBack)),
                  child: FadeTransition(opacity: anim, child: child),
                );
              },
              transitionDuration: const Duration(milliseconds: 400),
            ),
          );
        },
        icon: const Icon(Icons.add, fontWeight: FontWeight.bold),
        label: const Text('REGISTRASI BARANG', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1)),
      ),
    );
  }
}