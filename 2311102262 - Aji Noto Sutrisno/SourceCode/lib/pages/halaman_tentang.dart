import 'package:flutter/material.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F2),
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // App header card
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00875A), Color(0xFF005C3B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.account_balance_wallet_rounded, size: 52, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Personal Finance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Georgia',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Versi 1.0.0',
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.75), fontSize: 13),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Description
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: const Text(
              'Aplikasi ini membantu kamu mencatat pemasukan, pengeluaran, dan memantau kondisi keuangan pribadi sehari-hari dengan mudah dan efisien.',
              style: TextStyle(fontSize: 14, color: Color(0xFF374151), height: 1.6),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 16),

          // Feature highlights
          _InfoGroup(title: 'Fitur Unggulan', children: [
            _InfoRow(icon: Icons.add_card_rounded, color: const Color(0xFF00875A), text: 'Catat transaksi pemasukan & pengeluaran'),
            _InfoRow(icon: Icons.category_rounded, color: const Color(0xFFF59E0B), text: 'Kategorisasi pengeluaran otomatis'),
            _InfoRow(icon: Icons.notifications_active_rounded, color: const Color(0xFFEC4899), text: 'Notifikasi pengingat keuangan'),
            _InfoRow(icon: Icons.savings_rounded, color: const Color(0xFF3B82F6), text: 'Pantau target tabungan'),
          ]),

          const SizedBox(height: 16),

          _InfoGroup(title: 'Developer', children: [
            _InfoRow(icon: Icons.person_rounded, color: const Color(0xFF8B5CF6), text: 'Aji Noto Sutrisno'),
            _InfoRow(icon: Icons.email_rounded, color: const Color(0xFF3B82F6), text: 'aji@email.com'),
          ]),

          const SizedBox(height: 16),

          _InfoGroup(title: 'Teknologi', children: [
            _InfoRow(icon: Icons.flutter_dash_rounded, color: const Color(0xFF38BDF8), text: 'Flutter'),
            _InfoRow(icon: Icons.code_rounded, color: const Color(0xFF6B7280), text: 'Dart'),
          ]),

          const SizedBox(height: 32),
          Center(
            child: Text(
              '© 2025 Personal Finance App',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _InfoGroup extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _InfoGroup({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF9CA3AF), letterSpacing: 1.2),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Column(
            children: children.asMap().entries.map((e) {
              final isLast = e.key == children.length - 1;
              return Column(
                children: [
                  e.value,
                  if (!isLast) Divider(height: 1, color: Colors.grey.shade100, indent: 56),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _InfoRow({required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 16),
          ),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 14, color: Color(0xFF374151))),
        ],
      ),
    );
  }
}
