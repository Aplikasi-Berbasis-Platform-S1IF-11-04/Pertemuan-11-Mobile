<h3 align="center">LAPORAN PRAKTIKUM</h3>
<h3 align="center">APLIKASI BERBASIS PLATFORM</h3>
<h3 align="center">Modul 12 & 13 </h3>

<br>
<p align="center">
  <img src="screenshot/logo telkom university.png" width="150"/>
</p>
<br>

<p align="center">
Disusun oleh:
<br><br>
D’SHARLENDITA FEBIANDA AURELIA  
<br>
2311102069  
<br>
S1 IF-11-04  
</p>

<br>

<p align="center">
Dosen Pengampu:
<br>
Cahyo Prihantoro, S.Kom., M.Eng  
</p>

<br><br>

<p align="center">
PROGRAM STUDI S1 INFORMATIKA  
<br>
FAKULTAS INFORMATIKA  
<br>
TELKOM UNIVERSITY PURWOKERTO  
<br>
2026  
</p>

---

# Deskripsi Program

Program ini merupakan aplikasi Flutter yang menerapkan konsep **Navigation**, **Interactive Component**, dan **Notification**. Aplikasi terdiri dari beberapa halaman utama yaitu:

1. Home Page
2. Button Page (Action Page)
3. Profile Page

Selain navigasi antar halaman, program juga menambahkan notifikasi dalam bentuk **popup card (Alert Dialog)** untuk memberikan informasi kepada pengguna ketika melakukan aksi tertentu.

---

# Struktur Program

```
lib
│
├── components
│   └── custom_dropdown.dart
│
├── pages
│   ├── home_page.dart
│   ├── button_page.dart
│   └── profile_page.dart
│
├── widgets
│   ├── feature_card.dart
│   └── stat_card.dart
│
└── main.dart
```

---

# Penjelasan Setiap File

## 1. Home Page

File: `home_page.dart`

Halaman Home berfungsi sebagai tampilan utama aplikasi.

Komponen yang digunakan:

### Container Gradient

Digunakan untuk menampilkan kartu informasi pengguna.

```dart
Container(
height:180,
decoration: BoxDecoration(
gradient: LinearGradient()
)
)
```

Fungsi:

* Menampilkan ucapan selamat datang
* Menampilkan nama dan NIM
* Menambahkan desain visual menggunakan warna gradasi

---

### Feature Card

Digunakan untuk menampilkan menu Button dan Profile.

```dart
FeatureCard(
icon: Icons.smart_button,
title:"Button"
)
```

Fungsi:

* Menampilkan icon
* Menampilkan judul
* Menampilkan deskripsi menu

---

### Navigator

Digunakan untuk berpindah halaman.

```dart
Navigator.push(
context,
MaterialPageRoute(
builder:(_)=>ButtonPage()
)
);
```

Fungsi:

* Mengarahkan pengguna menuju halaman tertentu
* Mengimplementasikan navigation pada Flutter

---

### SnackBar Notification

Digunakan untuk memberikan informasi saat pengguna berpindah halaman.

```dart
ScaffoldMessenger.of(context)
.showSnackBar(
SnackBar()
);
```

Fungsi:

* Menampilkan notifikasi singkat
* Memberi informasi bahwa halaman sedang dibuka

---

# 2. Button Page

File: `button_page.dart`

Halaman ini berisi berbagai komponen interaktif.

Komponen:

### TextField

```dart
TextField(
controller:namaController
)
```

Fungsi:

* Input nama pengguna
* Menyimpan data teks menggunakan TextEditingController

---

### Custom Dropdown

```dart
CustomDropdown(
value:selectedValue
)
```

Fungsi:

* Menampilkan pilihan teknologi

* Memungkinkan pengguna memilih:

* Flutter

* Dart

* Firebase

---

### Like Button

```dart
OutlinedButton.icon()
```

Fungsi:

* Menyukai teknologi pilihan
* Mengubah icon menjadi favorite
* Menampilkan popup notifikasi

---

### AlertDialog Popup

```dart
showDialog()
```

Fungsi:

Menampilkan card popup ketika:

1. Like ditekan

```
Ditambahkan ke favorit 
```

2. Unlike ditekan

```
Dihapus dari favorit 
```

3. Submit ditekan

```
Data anda berhasil disimpan 
```

---

### Submit Button

```dart
ElevatedButton()
```

Fungsi:

* Menyimpan data
* Menampilkan popup berhasil

---

# 3. Profile Page

File: `profile_page.dart`

Halaman untuk menampilkan profil pengguna.

Komponen:

### CircleAvatar

```dart
CircleAvatar()
```

Fungsi:

* Menampilkan foto profil default

---

### Informasi Pengguna

```dart
Text(
"D'sharlendita Febianda Aurelia"
)
```

Fungsi:

Menampilkan:

* Nama
* NIM

---

### Stat Card

```dart
StatCard()
```

Fungsi:

Menampilkan informasi:

* Semester
* Praktikum
* Project

---

# 4. Custom Dropdown

File: `custom_dropdown.dart`

Widget reusable untuk dropdown pilihan teknologi.

```dart
DropdownButton()
```

Fungsi:

* Menampilkan list pilihan
* Mengirim nilai ke halaman utama

Pilihan:

* Flutter
* Dart
* Firebase

---

# 5. Feature Card

File: `feature_card.dart`

Widget reusable untuk menu Home.

Komponen:

```dart
Icon()
Text()
```

Fungsi:

* Menampilkan icon menu
* Menampilkan judul
* Menampilkan deskripsi

---

# 6. Stat Card

File: `stat_card.dart`

Widget reusable untuk statistik profile.

Komponen:

```dart
Container()
```

Fungsi:

* Menampilkan informasi dalam bentuk card

---

# Implementasi Modul 7

Fitur yang diterapkan:

### Navigation

Digunakan untuk berpindah halaman:

* Home → Button
* Home → Profile

Menggunakan:

```dart
Navigator.push()
```

---

### Notification

Menggunakan:

1. SnackBar

Fungsi:

* Menampilkan notifikasi perpindahan halaman

2. Alert Dialog

Fungsi:

* Menampilkan popup card saat aksi dilakukan

---

# Output Program

