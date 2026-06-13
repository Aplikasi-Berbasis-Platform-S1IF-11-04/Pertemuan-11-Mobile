import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/app_notification_service.dart';

class ItemContributionScreen extends StatefulWidget {
  final Function(Product) onSave;
  const ItemContributionScreen({super.key, required this.onSave});

  @override
  State<ItemContributionScreen> createState() => _ItemContributionScreenState();
}

class _ItemContributionScreenState extends State<ItemContributionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _stockCtrl = TextEditingController();
  final _priceCtrl = TextEditingController();
  
  String _selectedCat = 'Elektronik';
  final List<String> _categories = ['Elektronik', 'Aksesoris', 'Furnitur', 'Lainnya'];

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      final generatedSku = 'SKU-${DateTime.now().millisecondsSinceEpoch % 1000}';
      
      final incomingItem = Product(
        sku: generatedSku,
        title: _titleCtrl.text.trim(),
        stock: int.parse(_stockCtrl.text.trim()),
        price: double.parse(_priceCtrl.text.trim()),
        category: _selectedCat,
      );

      widget.onSave(incomingItem);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('"${incomingItem.title}" masuk log data!'),
          backgroundColor: const Color(0xff00ffcc),
        ),
      );

      AppNotificationService.instance.triggerAlert(
        head: 'Katalog Bertambah',
        body: 'Arsip produk ${incomingItem.title} aman tersimpan.',
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Operasi ditolak. Format isian salah!'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SUBMIT INVENTARIS BARU', style: TextStyle(fontSize: 14, letterSpacing: 1))),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500), // Perbaikan maxWidth
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: const Color(0xff161b22), borderRadius: BorderRadius.circular(20)),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleCtrl,
                    decoration: const InputDecoration(labelText: 'Nama Produk', border: OutlineInputBorder(), focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff00ffcc)))),
                    validator: (val) => (val == null || val.length < 4) ? 'Gunakan nama resmi minimal 4 karakter' : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _stockCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Volume Stok', border: OutlineInputBorder(), focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff00ffcc)))),
                    validator: (val) => (val == null || int.tryParse(val) == null || int.parse(val) <= 0) ? 'Masukkan kuantitas angka positif' : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _priceCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Harga Satuan (Rp)', border: OutlineInputBorder(), focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff00ffcc)))),
                    validator: (val) => (val == null || double.tryParse(val) == null) ? 'Harga tidak valid' : null,
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    initialValue: _selectedCat, // Perbaikan warning 'value' deprecated
                    decoration: const InputDecoration(labelText: 'Sektor Kategori', border: OutlineInputBorder()),
                    items: _categories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                    onChanged: (v) => setState(() => _selectedCat = v!),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: const Color(0xff00ffcc),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _validateAndSubmit,
                    child: const Text('ENKRIPSI & SIMPAN DATA', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}