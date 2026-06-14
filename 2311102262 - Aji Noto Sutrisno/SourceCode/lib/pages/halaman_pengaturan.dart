import 'package:flutter/material.dart';

class HalamanPengaturan extends StatefulWidget {
  const HalamanPengaturan({super.key});

  @override
  State<HalamanPengaturan> createState() => _HalamanPengaturanState();
}

class _HalamanPengaturanState extends State<HalamanPengaturan> {
  bool notifikasi = true;
  bool darkMode = false;
  bool biometrik = false;
  String mataUang = 'Rupiah';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F2),
      appBar: AppBar(title: const Text('Pengaturan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionLabel('Preferensi'),
          const SizedBox(height: 8),
          _SettingsGroup(children: [
            _ToggleTile(
              icon: Icons.notifications_outlined,
              iconColor: const Color(0xFFEC4899),
              title: 'Notifikasi',
              subtitle: 'Aktifkan notifikasi transaksi',
              value: notifikasi,
              onChanged: (v) => setState(() => notifikasi = v),
            ),
            _Divider(),
            _ToggleTile(
              icon: Icons.dark_mode_outlined,
              iconColor: const Color(0xFF8B5CF6),
              title: 'Mode Gelap',
              subtitle: 'Ubah tampilan ke mode gelap',
              value: darkMode,
              onChanged: (v) => setState(() => darkMode = v),
            ),
            _Divider(),
            _ToggleTile(
              icon: Icons.fingerprint_rounded,
              iconColor: const Color(0xFF3B82F6),
              title: 'Biometrik',
              subtitle: 'Login menggunakan sidik jari',
              value: biometrik,
              onChanged: (v) => setState(() => biometrik = v),
            ),
          ]),

          const SizedBox(height: 20),
          _SectionLabel('Umum'),
          const SizedBox(height: 8),
          _SettingsGroup(children: [
            _NavigationTile(
              icon: Icons.attach_money_rounded,
              iconColor: const Color(0xFF00875A),
              title: 'Mata Uang',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(mataUang, style: const TextStyle(color: Color(0xFF6B7280), fontSize: 14)),
                  const SizedBox(width: 4),
                  const Icon(Icons.chevron_right_rounded, color: Color(0xFF9CA3AF), size: 20),
                ],
              ),
              onTap: () => _showCurrencyPicker(),
            ),
            _Divider(),
            _NavigationTile(
              icon: Icons.language_rounded,
              iconColor: const Color(0xFFF59E0B),
              title: 'Bahasa',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Indonesia', style: TextStyle(color: Color(0xFF6B7280), fontSize: 14)),
                  SizedBox(width: 4),
                  Icon(Icons.chevron_right_rounded, color: Color(0xFF9CA3AF), size: 20),
                ],
              ),
              onTap: () {},
            ),
          ]),

          const SizedBox(height: 20),
          _SectionLabel('Data'),
          const SizedBox(height: 8),
          _SettingsGroup(children: [
            _NavigationTile(
              icon: Icons.download_rounded,
              iconColor: const Color(0xFF3B82F6),
              title: 'Ekspor Data',
              trailing: const Icon(Icons.chevron_right_rounded, color: Color(0xFF9CA3AF), size: 20),
              onTap: () {},
            ),
            _Divider(),
            _NavigationTile(
              icon: Icons.delete_outline_rounded,
              iconColor: const Color(0xFFE53E3E),
              title: 'Hapus Semua Data',
              trailing: const Icon(Icons.chevron_right_rounded, color: Color(0xFF9CA3AF), size: 20),
              onTap: () {},
            ),
          ]),

          const SizedBox(height: 20),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.info_outline_rounded, size: 18),
            label: const Text('Tentang Aplikasi'),
            style: TextButton.styleFrom(foregroundColor: const Color(0xFF6B7280)),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _showCurrencyPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2))),
            const SizedBox(height: 16),
            const Text('Pilih Mata Uang', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...['Rupiah', 'Dollar', 'Euro', 'Yen'].map((c) => ListTile(
              title: Text(c),
              trailing: mataUang == c ? const Icon(Icons.check_circle_rounded, color: Color(0xFF00875A)) : null,
              onTap: () {
                setState(() => mataUang = c);
                Navigator.pop(context);
              },
            )),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF9CA3AF), letterSpacing: 1.2),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  final List<Widget> children;
  const _SettingsGroup({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(children: children),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: Colors.grey.shade100, indent: 60);
  }
}

class _ToggleTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xFF1A1A2E))),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _NavigationTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final Widget trailing;
  final VoidCallback onTap;

  const _NavigationTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xFF1A1A2E)))),
            trailing,
          ],
        ),
      ),
    );
  }
}
