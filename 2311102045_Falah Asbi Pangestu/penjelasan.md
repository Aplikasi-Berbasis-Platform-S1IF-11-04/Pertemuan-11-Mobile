Analisis Kode: Multi-Page Flutter App
Aplikasi ini dirancang sebagai sistem manajemen navigasi yang komprehensif, mencakup 7 halaman utama dengan alur kerja yang terintegrasi.

Struktur Utama & Navigasi
Named Routing: Menggunakan map routes di dalam MaterialApp. Ini adalah metode profesional untuk berpindah halaman menggunakan alamat (String) seperti '/', '/profil', '/form', dll.

Global Helpers:

snack(): Fungsi shortcut untuk menampilkan SnackBar (notifikasi kecil di bawah layar) agar kode tidak redundan.

popupAlert(): Fungsi reusable untuk membuat AlertDialog kustom yang seragam di seluruh aplikasi, lengkap dengan ikon, tombol aksi, dan callback.

Komponen Halaman
HalamanUtama (/): Berfungsi sebagai dashboard yang menampilkan kartu profil, tombol interaktif, dropdown dinamis, dan Grid Menu untuk navigasi ke halaman lain.

HalamanProfil (/profil): Menampilkan detail data diri menggunakan ListView dan Card, serta menggunakan WidgetsBinding untuk memicu popup otomatis saat halaman dibuka.

HalamanForm (/form): Menggunakan Form dan TextFormField dengan validasi input sederhana (nama & email) serta elemen Radio untuk pilihan gender.

HalamanGaleri (/galeri): Menampilkan daftar kategori menggunakan GridView dengan styling yang dinamis berdasarkan data.

HalamanPengaturan (/pengaturan): Implementasi SwitchListTile untuk pengaturan preferensi pengguna (notifikasi, mode gelap, suara) dengan manajemen state lokal.

HalamanNotifikasi (/notifikasi): Fitur paling kompleks yang menggunakan Dismissible (untuk hapus item dengan swipe) dan Badge untuk menandai jumlah notifikasi yang belum dibaca.

HalamanTentang (/tentang): Halaman statis yang menggunakan gradasi warna (LinearGradient) dan kartu informasi sebagai penutup.

Konsep Teknis yang Diterapkan
State Management: Menggunakan StatefulWidget untuk mengelola data yang berubah secara real-time seperti _tabIdx, _dropdown, _gender, dan status notifikasi (dibaca).

Clean Code: Pemisahan logika UI ke dalam fungsi-fungsi kecil (seperti _deco untuk dekorasi form) membuat kode lebih mudah dibaca dan dipelihara.

Interaktivitas: Setiap navigasi dan aksi tombol tidak hanya berpindah halaman, tetapi juga memberikan umpan balik (feedback) berupa SnackBar atau Alert Dialog.