import 'package:flutter/material.dart';

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F2),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
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
                    Positioned(
                      top: -20,
                      right: -20,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.06),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white.withValues(alpha: 0.5), width: 2),
                            ),
                            child: CircleAvatar(
                              radius: 44,
                              backgroundColor: Colors.white.withValues(alpha: 0.2),
                              child: const Icon(Icons.person_rounded, size: 48, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Abdee Alamsyah Noer Siyam',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Georgia',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'abdee@email.com',
                            style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 13),
                          ),
                        ],
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
                  const Text(
                    'Ringkasan Keuangan',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 12),

                  _ProfileCard(
                    icon: Icons.savings_rounded,
                    iconColor: const Color(0xFF3B82F6),
                    title: 'Target Tabungan',
                    value: 'Rp 10.000.000',
                    progress: 0.25,
                    progressColor: const Color(0xFF3B82F6),
                  ),
                  const SizedBox(height: 10),
                  _ProfileCard(
                    icon: Icons.account_balance_wallet_rounded,
                    iconColor: const Color(0xFF00875A),
                    title: 'Saldo Saat Ini',
                    value: 'Rp 2.500.000',
                    progress: null,
                    progressColor: Colors.transparent,
                  ),
                  const SizedBox(height: 10),
                  _ProfileCard(
                    icon: Icons.flag_rounded,
                    iconColor: const Color(0xFFF59E0B),
                    title: 'Target Tahun Ini',
                    value: 'Laptop Baru',
                    progress: null,
                    progressColor: Colors.transparent,
                  ),

                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit_outlined, size: 18),
                      label: const Text('Edit Profil'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF00875A),
                        side: const BorderSide(color: Color(0xFF00875A)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final double? progress;
  final Color progressColor;

  const _ProfileCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.progress,
    required this.progressColor,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                    const SizedBox(height: 2),
                    Text(
                      value,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (progress != null) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: progressColor.withValues(alpha: 0.1),
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                minHeight: 6,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${(progress! * 100).toInt()}% tercapai',
              style: TextStyle(fontSize: 11, color: progressColor, fontWeight: FontWeight.w500),
            ),
          ],
        ],
      ),
    );
  }
}
