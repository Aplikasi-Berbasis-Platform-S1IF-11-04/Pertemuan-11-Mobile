import 'package:flutter/material.dart';

class HalamanNotifikasi extends StatefulWidget {
  const HalamanNotifikasi({super.key});

  @override
  State<HalamanNotifikasi> createState() => _HalamanNotifikasiState();
}

class _HalamanNotifikasiState extends State<HalamanNotifikasi> {
  final List<Map<String, dynamic>> notif = [
    {
      'judul': 'Pengeluaran Meningkat',
      'pesan': 'Pengeluaran bulan ini meningkat 12% dari bulan lalu',
      'icon': Icons.trending_up_rounded,
      'color': Color(0xFFE53E3E),
      'waktu': '2 jam lalu',
      'dibaca': false,
    },
    {
      'judul': 'Target Hampir Tercapai',
      'pesan': 'Target tabungan kamu hampir tercapai! 75% sudah terkumpul',
      'icon': Icons.savings_rounded,
      'color': Color(0xFF00875A),
      'waktu': '5 jam lalu',
      'dibaca': false,
    },
    {
      'judul': 'Pengingat Harian',
      'pesan': 'Jangan lupa catat pengeluaran hari ini ya!',
      'icon': Icons.edit_note_rounded,
      'color': Color(0xFFF59E0B),
      'waktu': 'Kemarin',
      'dibaca': true,
    },
    {
      'judul': 'Saldo Diperbarui',
      'pesan': 'Saldo rekening kamu telah berhasil diperbarui',
      'icon': Icons.account_balance_wallet_rounded,
      'color': Color(0xFF3B82F6),
      'waktu': 'Kemarin',
      'dibaca': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final unreadCount = notif.where((n) => n['dibaca'] == false).length;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F2),
      appBar: AppBar(
        title: const Text('Notifikasi'),
        actions: [
          if (unreadCount > 0)
            TextButton(
              onPressed: () {
                setState(() {
                  for (final n in notif) {
                    n['dibaca'] = true;
                  }
                });
              },
              child: const Text('Tandai Semua', style: TextStyle(color: Colors.white, fontSize: 13)),
            ),
        ],
      ),
      body: notif.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_off_outlined, size: 60, color: Color(0xFFD1D5DB)),
                  SizedBox(height: 12),
                  Text('Tidak ada notifikasi', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15)),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: notif.length,
              separatorBuilder: (context, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final item = notif[index];
                final color = item['color'] as Color;
                final dibaca = item['dibaca'] as bool;

                return Dismissible(
                  key: Key('notif_$index'),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE53E3E),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.delete_rounded, color: Colors.white),
                  ),
                  onDismissed: (_) {
                    setState(() => notif.removeAt(index));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Notifikasi dihapus'),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.all(12),
                        action: SnackBarAction(label: 'Batal', onPressed: () {}),
                      ),
                    );
                  },
                  child: GestureDetector(
                    onTap: () => setState(() => item['dibaca'] = true),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: dibaca ? Colors.white : color.withValues(alpha: 0.04),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: dibaca ? Colors.grey.shade100 : color.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item['judul'] as String,
                                        style: TextStyle(
                                          fontWeight: dibaca ? FontWeight.w600 : FontWeight.bold,
                                          fontSize: 14,
                                          color: const Color(0xFF1A1A2E),
                                        ),
                                      ),
                                    ),
                                    if (!dibaca)
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  item['pesan'] as String,
                                  style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280), height: 1.4),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item['waktu'] as String,
                                  style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
