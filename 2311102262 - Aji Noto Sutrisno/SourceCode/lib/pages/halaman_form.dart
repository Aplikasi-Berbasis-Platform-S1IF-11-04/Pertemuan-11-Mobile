import 'package:flutter/material.dart';

class HalamanForm extends StatefulWidget {
  const HalamanForm({super.key});

  @override
  State<HalamanForm> createState() => _HalamanFormState();
}

class _HalamanFormState extends State<HalamanForm> {
  final _formKey = GlobalKey<FormState>();
  final nominalController = TextEditingController();
  final keteranganController = TextEditingController();

  String jenis = 'Pengeluaran';
  String? selectedKategori;

  final List<Map<String, dynamic>> kategoriList = [
    {'label': 'Makanan', 'icon': Icons.fastfood_rounded},
    {'label': 'Transportasi', 'icon': Icons.directions_bus_rounded},
    {'label': 'Pendidikan', 'icon': Icons.school_rounded},
    {'label': 'Hiburan', 'icon': Icons.movie_rounded},
    {'label': 'Belanja', 'icon': Icons.shopping_bag_rounded},
    {'label': 'Lainnya', 'icon': Icons.more_horiz_rounded},
  ];

  void simpanData() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.check_circle_rounded, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text('Transaksi berhasil disimpan'),
            ],
          ),
          backgroundColor: const Color(0xFF00875A),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(12),
        ),
      );
      nominalController.clear();
      keteranganController.clear();
      setState(() {
        jenis = 'Pengeluaran';
        selectedKategori = null;
      });
    }
  }

  @override
  void dispose() {
    nominalController.dispose();
    keteranganController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F2),
      appBar: AppBar(title: const Text('Tambah Transaksi')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Jenis toggle
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: ['Pengeluaran', 'Pemasukan'].map((type) {
                    final selected = jenis == type;
                    final isIncome = type == 'Pemasukan';
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => jenis = type),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: selected
                                ? (isIncome ? const Color(0xFF00875A) : const Color(0xFFE53E3E))
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                isIncome ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
                                size: 16,
                                color: selected ? Colors.white : Colors.grey.shade600,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                type,
                                style: TextStyle(
                                  color: selected ? Colors.white : Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),
              _Label('Nominal'),
              const SizedBox(height: 8),
              TextFormField(
                controller: nominalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixText: 'Rp  ',
                  prefixStyle: TextStyle(color: Color(0xFF1A1A2E), fontWeight: FontWeight.w600),
                  hintText: '0',
                ),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Nominal wajib diisi';
                  return null;
                },
              ),

              const SizedBox(height: 16),
              _Label('Keterangan'),
              const SizedBox(height: 8),
              TextFormField(
                controller: keteranganController,
                decoration: const InputDecoration(hintText: 'Contoh: Makan siang, Bayar listrik...'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Keterangan wajib diisi';
                  return null;
                },
              ),

              const SizedBox(height: 16),
              _Label('Kategori'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: kategoriList.map((k) {
                  final selected = selectedKategori == k['label'];
                  return GestureDetector(
                    onTap: () => setState(() => selectedKategori = k['label'] as String),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected ? const Color(0xFF00875A) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selected ? const Color(0xFF00875A) : Colors.grey.shade200,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            k['icon'] as IconData,
                            size: 15,
                            color: selected ? Colors.white : Colors.grey.shade600,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            k['label'] as String,
                            style: TextStyle(
                              fontSize: 13,
                              color: selected ? Colors.white : Colors.grey.shade700,
                              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: simpanData,
                  child: const Text('Simpan Transaksi'),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color(0xFF374151),
      ),
    );
  }
}
