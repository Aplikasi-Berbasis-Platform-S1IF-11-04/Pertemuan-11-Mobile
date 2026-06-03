import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _navigateTo(BuildContext context, String route, String label) {
    Navigator.pushNamed(context, route);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Membuka halaman: $label'),
        backgroundColor: Colors.indigo,
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menus = [
      {
        'label': 'Halaman 1 - Text Dasar',
        'route': '/text-dasar',
        'icon': Icons.text_fields,
        'color': Colors.blue,
      },
      {
        'label': 'Halaman 2 - Button',
        'route': '/button',
        'icon': Icons.touch_app,
        'color': Colors.amber,
      },
      {
        'label': 'Halaman 3 - Container',
        'route': '/container',
        'icon': Icons.crop_square,
        'color': Colors.red,
      },
      {
        'label': 'Halaman 4 - Login Form',
        'route': '/login-form',
        'icon': Icons.login,
        'color': Colors.green,
      },
      {
        'label': 'Halaman 5 - TextField',
        'route': '/textfield',
        'icon': Icons.edit,
        'color': Colors.purple,
      },
      {
        'label': 'Halaman 6 - Counter',
        'route': '/counter',
        'icon': Icons.add_circle,
        'color': Colors.teal,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Modul 7 — Navigasi & Notifikasi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text(
              'Pilih Halaman',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Navigasi ke 6 halaman dari modul sebelumnya',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: menus.length,
                itemBuilder: (context, index) {
                  final menu = menus[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        backgroundColor:
                            (menu['color'] as Color).withOpacity(0.15),
                        child: Icon(
                          menu['icon'] as IconData,
                          color: menu['color'] as Color,
                        ),
                      ),
                      title: Text(
                        menu['label'] as String,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                      onTap: () => _navigateTo(
                        context,
                        menu['route'] as String,
                        menu['label'] as String,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
