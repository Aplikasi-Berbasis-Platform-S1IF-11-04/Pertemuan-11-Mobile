import 'package:flutter/material.dart';
import '../widgets/menu_card.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F2),
      body: CustomScrollView(
        slivers: [
          // Custom gradient app bar
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: const Color(0xFF00875A),
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF00875A), Color(0xFF005C3B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    // Decorative circles
                    Positioned(
                      top: -30,
                      right: -30,
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.06),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      left: -40,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.05),
                        ),
                      ),
                    ),
                    // Content
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Dashboard Keuangan',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () => Navigator.pushNamed(context, '/pengaturan'),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(Icons.settings_outlined, color: Colors.white, size: 18),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Saldo Saat Ini',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Rp 2.500.000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.5,
                                fontFamily: 'Georgia',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Income / Expense row
                  Row(
                    children: [
                      Expanded(child: _StatCard(
                        label: 'Pemasukan',
                        amount: 'Rp 4.000.000',
                        icon: Icons.arrow_downward_rounded,
                        color: const Color(0xFF00875A),
                      )),
                      const SizedBox(width: 12),
                      Expanded(child: _StatCard(
                        label: 'Pengeluaran',
                        amount: 'Rp 1.500.000',
                        icon: Icons.arrow_upward_rounded,
                        color: const Color(0xFFE53E3E),
                      )),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Menu section label
                  const Text(
                    'Menu Utama',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A2E),
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 12),

                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.1,
                    children: [
                      MenuCard(
                        title: 'Profil',
                        icon: Icons.person_outline_rounded,
                        iconColor: const Color(0xFF3B82F6),
                        onTap: () => Navigator.pushNamed(context, '/profil'),
                      ),
                      MenuCard(
                        title: 'Transaksi',
                        icon: Icons.add_card_rounded,
                        iconColor: const Color(0xFF00875A),
                        onTap: () => Navigator.pushNamed(context, '/form'),
                      ),
                      MenuCard(
                        title: 'Kategori',
                        icon: Icons.category_outlined,
                        iconColor: const Color(0xFFF59E0B),
                        onTap: () => Navigator.pushNamed(context, '/galeri'),
                      ),
                      MenuCard(
                        title: 'Notifikasi',
                        icon: Icons.notifications_outlined,
                        iconColor: const Color(0xFFEC4899),
                        onTap: () => Navigator.pushNamed(context, '/notifikasi'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Recent transactions
                  Row(
                    children: [
                      const Text(
                        'Transaksi Terbaru',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF00875A),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text('Lihat Semua', style: TextStyle(fontSize: 13)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade100),
                    ),
                    child: Column(
                      children: [
                        _TransactionTile(
                          icon: Icons.fastfood_rounded,
                          iconBg: Colors.orange.shade50,
                          iconColor: Colors.orange,
                          title: 'Makan Siang',
                          subtitle: 'Hari Ini',
                          amount: '- Rp 25.000',
                          amountColor: const Color(0xFFE53E3E),
                          isLast: false,
                        ),
                        _TransactionTile(
                          icon: Icons.school_rounded,
                          iconBg: Colors.green.shade50,
                          iconColor: const Color(0xFF00875A),
                          title: 'Bayar UKT',
                          subtitle: 'Kemarin',
                          amount: '- Rp 500.000',
                          amountColor: const Color(0xFFE53E3E),
                          isLast: true,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),

      // FAB
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/form'),
        backgroundColor: const Color(0xFF00875A),
        foregroundColor: Colors.white,
        elevation: 4,
        icon: const Icon(Icons.add),
        label: const Text('Tambah', style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String amount;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.label,
    required this.amount,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                const SizedBox(height: 2),
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;
  final bool isLast;

  const _TransactionTile({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xFF1A1A2E))),
                    const SizedBox(height: 2),
                    Text(subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))),
                  ],
                ),
              ),
              Text(
                amount,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: amountColor),
              ),
            ],
          ),
        ),
        if (!isLast)
          Divider(height: 1, color: Colors.grey.shade100, indent: 16, endIndent: 16),
      ],
    );
  }
}
