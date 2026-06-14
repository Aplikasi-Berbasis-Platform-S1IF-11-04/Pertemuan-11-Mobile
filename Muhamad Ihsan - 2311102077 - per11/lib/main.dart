import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blueAccent, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const HalamanUtama(),
        '/profil': (ctx) => const HalamanProfil(),
        '/form': (ctx) => const HalamanForm(),
        '/galeri': (ctx) => const HalamanGaleri(),
        '/pengaturan': (ctx) => const HalamanPengaturan(),
        '/notifikasi': (ctx) => const HalamanNotifikasi(),
        '/tentang': (ctx) => const HalamanTentang(),
      },
    );
  }
}

// ── Helper: SnackBar ringan ────────────────────────────────────────────────
void snack(BuildContext ctx, String msg, {Color color = Colors.blueAccent}) =>
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
      ),
    );

// ── Helper: Popup Alert Dialog ─────────────────────────────────────────────
Future<void> popupAlert(
  BuildContext ctx, {
  required String judul,
  required String isi,
  IconData icon = Icons.info_outline,
  Color iconColor = Colors.blueAccent,
  String tombolOk = 'OK',
  String? tombolBatal,
  VoidCallback? onOk,
}) {
  return showDialog(
    context: ctx,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titlePadding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      title: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: iconColor.withOpacity(.12),
            child: Icon(icon, color: iconColor, size: 30),
          ),
          const SizedBox(height: 12),
          Text(
            judul,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: Text(
        isi,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14, color: Colors.black54),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
      actions: [
        if (tombolBatal != null)
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: iconColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => Navigator.pop(ctx),
            child: Text(tombolBatal, style: TextStyle(color: iconColor)),
          ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: iconColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pop(ctx);
            onOk?.call();
          },
          child: Text(tombolOk),
        ),
      ],
    ),
  );
}

// ═══════════════════════════════════════════════════════════════════════════
// HALAMAN 1 – UTAMA
// ═══════════════════════════════════════════════════════════════════════════
class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});
  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _tabIdx = 0;
  String _dropdown = 'Flutter';

  static const _menu = [
    {
      'label': 'Profil',
      'icon': Icons.person,
      'route': '/profil',
      'color': Colors.purple,
    },
    {
      'label': 'Form',
      'icon': Icons.edit_note,
      'route': '/form',
      'color': Colors.teal,
    },
    {
      'label': 'Galeri',
      'icon': Icons.photo_library,
      'route': '/galeri',
      'color': Colors.orange,
    },
    {
      'label': 'Pengaturan',
      'icon': Icons.settings,
      'route': '/pengaturan',
      'color': Colors.grey,
    },
    {
      'label': 'Notifikasi',
      'icon': Icons.notifications,
      'route': '/notifikasi',
      'color': Colors.red,
    },
    {
      'label': 'Tentang',
      'icon': Icons.info_outline,
      'route': '/tentang',
      'color': Colors.indigo,
    },
  ];

  void _goto(String route, String label) {
    Navigator.pushNamed(context, route);
    snack(context, 'Membuka $label…');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gabungan Menu & Tombol'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Kartu identitas
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person, size: 40, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Muhamad Ihsan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '2311102077',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Tab aktif: $_tabIdx',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol dengan popup alert
            ElevatedButton.icon(
              icon: const Icon(Icons.touch_app),
              label: const Text('Klik Saya'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => popupAlert(
                context,
                judul: 'Button Ditekan!',
                isi: 'Kamu berhasil menekan tombol ini.',
                icon: Icons.check_circle,
                iconColor: Colors.green,
              ),
            ),
            const SizedBox(height: 20),

            // Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                value: _dropdown,
                underline: const SizedBox(),
                isExpanded: true,
                items: ['Flutter', 'Laravel', 'UI Design']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (v) {
                  setState(() => _dropdown = v!);
                  popupAlert(
                    context,
                    judul: 'Pilihan Diubah',
                    isi: 'Kamu memilih: $v',
                    icon: Icons.swap_horiz,
                    iconColor: Colors.indigo,
                  );
                },
              ),
            ),
            const SizedBox(height: 4),
            Text('Pilihan: $_dropdown'),
            const SizedBox(height: 24),

            // Grid menu
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Menu Halaman',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: _menu.map((m) {
                final color = m['color'] as Color;
                return InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () =>
                      _goto(m['route'] as String, m['label'] as String),
                  child: Container(
                    decoration: BoxDecoration(
                      color: color.withOpacity(.1),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: color.withOpacity(.4)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(m['icon'] as IconData, color: color, size: 32),
                        const SizedBox(height: 6),
                        Text(
                          m['label'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIdx,
        selectedItemColor: Colors.blueAccent,
        onTap: (i) {
          setState(() => _tabIdx = i);
          popupAlert(
            context,
            judul: 'Tab Dipilih',
            isi: 'Kamu menekan tab: ${['Home', 'Button', 'Profil'][i]}',
            icon: Icons.tab,
            iconColor: Colors.blueAccent,
          );
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_button),
            label: 'Button',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// HALAMAN 2 – PROFIL
// ═══════════════════════════════════════════════════════════════════════════
class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => popupAlert(
        context,
        judul: 'Selamat Datang!',
        isi: 'Kamu membuka halaman Profil.',
        icon: Icons.waving_hand,
        iconColor: Colors.purple,
      ),
    );

    final info = [
      [Icons.school, 'Jurusan', 'Teknik Informatika'],
      [Icons.calendar_today, 'Angkatan', '2023'],
      [Icons.location_on, 'Kota', 'Purwokerto'],
      [Icons.email, 'Email', 'muhamadihsan1001@mahasiswa.ac.id'],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Center(
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.purple,
              child: Icon(Icons.person, size: 55, color: Colors.white),
            ),
          ),
          const SizedBox(height: 14),
          const Center(
            child: Text(
              'Muhamad Ihsan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const Center(
            child: Text('2311102077', style: TextStyle(color: Colors.grey)),
          ),
          const SizedBox(height: 20),
          ...info.map(
            (r) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(r[0] as IconData, color: Colors.purple),
                title: Text(
                  r[1] as String,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                subtitle: Text(
                  r[2] as String,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            icon: const Icon(Icons.edit),
            label: const Text('Edit Profil'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => popupAlert(
              context,
              judul: 'Edit Profil',
              isi:
                  'Fitur edit profil akan segera tersedia di versi berikutnya.',
              icon: Icons.edit_note,
              iconColor: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// HALAMAN 3 – FORM INPUT
// ═══════════════════════════════════════════════════════════════════════════
class HalamanForm extends StatefulWidget {
  const HalamanForm({super.key});
  @override
  State<HalamanForm> createState() => _HalamanFormState();
}

class _HalamanFormState extends State<HalamanForm> {
  final _key = GlobalKey<FormState>();
  final _nama = TextEditingController();
  final _email = TextEditingController();
  String _gender = 'Laki-laki';

  InputDecoration _deco(String label, IconData icon) => InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon, color: Colors.teal),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.teal, width: 2),
    ),
  );

  void _submit() {
    if (!_key.currentState!.validate()) {
      popupAlert(
        context,
        judul: 'Form Tidak Lengkap',
        isi: 'Harap isi semua field yang wajib diisi sebelum mengirim.',
        icon: Icons.warning_amber_rounded,
        iconColor: Colors.red,
      );
      return;
    }
    popupAlert(
      context,
      judul: 'Data Terkirim!',
      isi: 'Nama: ${_nama.text}\nEmail: ${_email.text}\nGender: $_gender',
      icon: Icons.check_circle,
      iconColor: Colors.teal,
      tombolBatal: 'Tutup',
      tombolOk: 'Reset Form',
      onOk: () {
        _nama.clear();
        _email.clear();
        setState(() => _gender = 'Laki-laki');
        snack(context, 'Form direset', color: Colors.teal);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Input'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Isi Data Diri',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: _nama,
                decoration: _deco('Nama Lengkap', Icons.person),
                validator: (v) => v!.isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _email,
                decoration: _deco('Email', Icons.email),
                keyboardType: TextInputType.emailAddress,
                validator: (v) => v!.isEmpty
                    ? 'Wajib diisi'
                    : (!v.contains('@') ? 'Email tidak valid' : null),
              ),
              const SizedBox(height: 14),
              const Text(
                'Jenis Kelamin',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: ['Laki-laki', 'Perempuan']
                    .map(
                      (g) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio<String>(
                            value: g,
                            groupValue: _gender,
                            activeColor: Colors.teal,
                            onChanged: (v) => setState(() => _gender = v!),
                          ),
                          Text(g),
                        ],
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.send),
                  label: const Text('Kirim Data'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _submit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// HALAMAN 4 – GALERI
// ═══════════════════════════════════════════════════════════════════════════
class HalamanGaleri extends StatelessWidget {
  const HalamanGaleri({super.key});

  static const _items = [
    [Icons.landscape, 'Alam', Colors.green],
    [Icons.directions_car, 'Otomotif', Colors.red],
    [Icons.food_bank, 'Kuliner', Colors.orange],
    [Icons.sports_soccer, 'Olahraga', Colors.blue],
    [Icons.music_note, 'Musik', Colors.pink],
    [Icons.computer, 'Teknologi', Colors.indigo],
    [Icons.travel_explore, 'Travel', Colors.teal],
    [Icons.palette, 'Seni', Colors.purple],
    [Icons.architecture, 'Arsitektur', Colors.brown],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: _items.map((r) {
          final color = r[2] as Color;
          return InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => popupAlert(
              context,
              judul: r[1] as String,
              isi:
                  'Kamu membuka kategori "${r[1]}".\nFitur galeri lengkap segera hadir!',
              icon: r[0] as IconData,
              iconColor: color,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: color.withOpacity(.1),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: color.withOpacity(.4)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(r[0] as IconData, color: color, size: 34),
                  const SizedBox(height: 6),
                  Text(
                    r[1] as String,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// HALAMAN 5 – PENGATURAN
// ═══════════════════════════════════════════════════════════════════════════
class HalamanPengaturan extends StatefulWidget {
  const HalamanPengaturan({super.key});
  @override
  State<HalamanPengaturan> createState() => _HalamanPengaturanState();
}

class _HalamanPengaturanState extends State<HalamanPengaturan> {
  bool _notif = true, _dark = false, _suara = true;

  Widget _switchTile(
    String title,
    String sub,
    IconData icon,
    bool val,
    Function(bool) cb,
  ) => SwitchListTile(
    title: Text(title),
    subtitle: Text(sub),
    secondary: Icon(icon),
    value: val,
    activeColor: Colors.blueAccent,
    onChanged: (v) {
      setState(() => cb(v));
      popupAlert(
        context,
        judul: title,
        isi: '$title telah ${v ? "diaktifkan" : "dinonaktifkan"}.',
        icon: v ? Icons.check_circle : Icons.cancel,
        iconColor: v ? Colors.green : Colors.grey,
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.grey[800],
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              'PREFERENSI',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                letterSpacing: 1.2,
              ),
            ),
          ),
          _switchTile(
            'Notifikasi',
            'Terima pemberitahuan aplikasi',
            Icons.notifications,
            _notif,
            (v) => _notif = v,
          ),
          _switchTile(
            'Mode Gelap',
            'Aktifkan tema dark mode',
            Icons.dark_mode,
            _dark,
            (v) => _dark = v,
          ),
          _switchTile(
            'Suara',
            'Aktifkan efek suara',
            Icons.volume_up,
            _suara,
            (v) => _suara = v,
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text(
              'AKUN',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                letterSpacing: 1.2,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.lock_reset, color: Colors.red),
            title: const Text('Reset Pengaturan'),
            subtitle: const Text('Kembalikan ke setelan awal'),
            onTap: () => popupAlert(
              context,
              judul: 'Reset Pengaturan?',
              isi: 'Semua pengaturan akan dikembalikan ke nilai default.',
              icon: Icons.warning_amber_rounded,
              iconColor: Colors.red,
              tombolBatal: 'Batal',
              tombolOk: 'Reset',
              onOk: () {
                setState(() {
                  _notif = true;
                  _dark = false;
                  _suara = true;
                });
                snack(
                  context,
                  'Pengaturan berhasil direset!',
                  color: Colors.red,
                );
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Keluar Akun'),
            subtitle: const Text('Logout dari aplikasi'),
            onTap: () => popupAlert(
              context,
              judul: 'Keluar Akun?',
              isi: 'Apakah kamu yakin ingin logout dari aplikasi?',
              icon: Icons.logout,
              iconColor: Colors.red,
              tombolBatal: 'Batal',
              tombolOk: 'Logout',
              onOk: () => snack(context, 'Berhasil logout', color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// HALAMAN 6 – NOTIFIKASI
// ═══════════════════════════════════════════════════════════════════════════
class HalamanNotifikasi extends StatefulWidget {
  const HalamanNotifikasi({super.key});
  @override
  State<HalamanNotifikasi> createState() => _HalamanNotifikasiState();
}

class _HalamanNotifikasiState extends State<HalamanNotifikasi> {
  final List<Map<String, dynamic>> _list = [
    {
      'judul': 'Selamat Datang!',
      'isi': 'Aplikasi berhasil dijalankan.',
      'icon': Icons.celebration,
      'color': Colors.green,
      'dibaca': false,
    },
    {
      'judul': 'Update Tersedia',
      'isi': 'Versi 1.1.0 siap diunduh.',
      'icon': Icons.system_update,
      'color': Colors.blue,
      'dibaca': false,
    },
    {
      'judul': 'Pengingat Tugas',
      'isi': 'Deadline besok pukul 23:59.',
      'icon': Icons.assignment_late,
      'color': Colors.orange,
      'dibaca': true,
    },
    {
      'judul': 'Pesan Baru',
      'isi': 'Ada pesan masuk dari dosen.',
      'icon': Icons.mail,
      'color': Colors.purple,
      'dibaca': false,
    },
    {
      'judul': 'Peringatan Sistem',
      'isi': 'Login dari perangkat baru.',
      'icon': Icons.security,
      'color': Colors.red,
      'dibaca': true,
    },
  ];

  void _bukaNotif(int i) {
    final n = _list[i];
    setState(() => _list[i]['dibaca'] = true);
    popupAlert(
      context,
      judul: n['judul'] as String,
      isi: n['isi'] as String,
      icon: n['icon'] as IconData,
      iconColor: n['color'] as Color,
    );
  }

  @override
  Widget build(BuildContext context) {
    final unread = _list.where((n) => !(n['dibaca'] as bool)).length;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        actions: [
          if (unread > 0)
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Badge(
                label: Text('$unread'),
                child: const Icon(Icons.notifications),
              ),
            ),
        ],
      ),
      body: _list.isEmpty
          ? const Center(
              child: Text(
                'Tidak ada notifikasi',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              separatorBuilder: (_, __) => const SizedBox(height: 6),
              itemCount: _list.length,
              itemBuilder: (ctx, i) {
                final n = _list[i];
                final color = n['color'] as Color;
                final dibaca = n['dibaca'] as bool;
                return Dismissible(
                  key: ValueKey('$i-${n['judul']}'),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (_) async {
                    bool konfirm = false;
                    await popupAlert(
                      ctx,
                      judul: 'Hapus Notifikasi?',
                      isi: 'Notifikasi "${n['judul']}" akan dihapus permanen.',
                      icon: Icons.delete_forever,
                      iconColor: Colors.red,
                      tombolBatal: 'Batal',
                      tombolOk: 'Hapus',
                      onOk: () => konfirm = true,
                    );
                    return konfirm;
                  },
                  onDismissed: (_) {
                    setState(() => _list.removeAt(i));
                    snack(context, 'Notifikasi dihapus', color: Colors.red);
                  },
                  child: Card(
                    color: dibaca ? null : color.withOpacity(.08),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: dibaca
                          ? BorderSide.none
                          : BorderSide(color: color.withOpacity(.4)),
                    ),
                    child: ListTile(
                      onTap: () => _bukaNotif(i),
                      leading: CircleAvatar(
                        backgroundColor: color.withOpacity(.15),
                        child: Icon(n['icon'] as IconData, color: color),
                      ),
                      title: Text(
                        n['judul'] as String,
                        style: TextStyle(
                          fontWeight: dibaca
                              ? FontWeight.normal
                              : FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(n['isi'] as String),
                      trailing: dibaca
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.grey,
                              size: 18,
                            )
                          : const Icon(
                              Icons.circle,
                              color: Colors.red,
                              size: 10,
                            ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.done_all),
        label: const Text('Baca Semua'),
        onPressed: () => popupAlert(
          context,
          judul: 'Tandai Semua Dibaca?',
          isi: 'Semua notifikasi akan ditandai sebagai sudah dibaca.',
          icon: Icons.done_all,
          iconColor: Colors.red,
          tombolBatal: 'Batal',
          tombolOk: 'Ya, Tandai',
          onOk: () {
            setState(() {
              for (var n in _list) n['dibaca'] = true;
            });
            snack(context, 'Semua sudah dibaca', color: Colors.green);
          },
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// HALAMAN 7 – TENTANG
// ═══════════════════════════════════════════════════════════════════════════
class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => popupAlert(
        context,
        judul: 'Tentang Aplikasi',
        isi: 'Praktikum   Muhamad Ihsan',
        icon: Icons.info_outline,
        iconColor: Colors.indigo,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.indigo, Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [
                Icon(Icons.apps, size: 60, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  'Aplikasi Flutter',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text('Versi 1.0.0', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Aplikasi ini dibuat sebagai tugas praktikum mata kuliah '
                'Pengembangan Aplikasi Mobile. Menampilkan fitur navigasi multi-halaman, '
                'form validasi, dan popup alert notification.',
                style: TextStyle(fontSize: 14, height: 1.6),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          const SizedBox(height: 12),
          ...[
            [Icons.person, 'Developer', 'Muhamad Ihsan'],
            [Icons.badge, 'NIM', '2311102077'],
            [Icons.code, 'Framework', 'Flutter & Dart'],
            [Icons.school, 'Kampus', 'Universitas Telkom Purwokerto'],
          ].map(
            (r) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(r[0] as IconData, color: Colors.indigo),
                title: Text(
                  r[1] as String,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                subtitle: Text(
                  r[2] as String,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.star),
            label: const Text('Beri Rating'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => popupAlert(
              context,
              judul: 'Terima Kasih! ⭐',
              isi:
                  'Rating kamu sangat berarti untuk pengembangan aplikasi ini.',
              icon: Icons.star,
              iconColor: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
