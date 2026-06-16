<h3 align="center">LAPORAN PRAKTIKUM</h3>
<h3 align="center">APLIKASI BERBASIS PLATFORM</h3>
<h3 align="center">Modul 7</h3>
<h3 align="center">NAVIGASI & NOTIFIKASI (UNGUIDED)</h3>

<br>
<p align="center">
  <img src="output/logo telkom university.png" width="150"/>
</p>
<br>

<p align="center">
Disusun oleh:
<br><br>
Muhammad Rafiful Hana
<br>
2311102227
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

Program ini merupakan aplikasi Flutter bertema **Coffee Shop** yang menerapkan konsep **Navigation**, **Interactive Component**, dan **Notification**. Aplikasi terdiri dari beberapa halaman utama yaitu:

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

## 1. Home Page (`home_page.dart`)

Halaman Home merupakan halaman utama yang pertama kali muncul ketika aplikasi dijalankan. Halaman ini menampilkan informasi pengguna dan menu navigasi menuju halaman Button serta Profile.

---

### Import Package

```dart
import 'package:flutter/material.dart';
import '../widgets/feature_card.dart';
import 'button_page.dart';
import 'profile_page.dart';
```

Penjelasan:

* `material.dart` digunakan untuk mengakses widget bawaan Flutter.
* `feature_card.dart` digunakan untuk menampilkan card menu.
* `button_page.dart` digunakan sebagai tujuan navigasi Button Page.
* `profile_page.dart` digunakan sebagai tujuan navigasi Profile Page.

---

### Widget HomePage

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}
```

Penjelasan:
`StatelessWidget` digunakan karena halaman Home tidak memerlukan perubahan data atau state.

---

### Container Gradient

```dart
Container(
  height: 180,
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    gradient: const LinearGradient(
      colors: [
        Color(0xff6A11CB),
        Color(0xff2575FC),
      ],
    ),
  ),
)
```

Penjelasan:
* Menampilkan informasi pengguna (nama, NIM, icon coffee)
* Menambahkan desain gradasi warna
* Membuat tampilan lebih menarik

---

### Feature Card

```dart
FeatureCard(
  icon: Icons.smart_button,
  title: "Button",
  subtitle: "Implementasi interaktif",
)
```

Penjelasan:
* Menampilkan icon
* Menampilkan judul
* Menampilkan deskripsi menu

---

### Navigation

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const ButtonPage(),
  ),
);
```

Penjelasan:
* Berpindah halaman
* Mengarahkan pengguna ke halaman Button atau Profile

---

### Notification

```dart
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text("Membuka halaman Button"),
  ),
);
```

Penjelasan:
* Menampilkan notifikasi ketika tombol ditekan
* Memberikan informasi kepada pengguna

---

# 2. Button Page (`button_page.dart`)

Button Page digunakan untuk menampilkan berbagai komponen interaktif.

---

### Stateful Widget

```dart
class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}
```

Penjelasan:
`StatefulWidget` digunakan karena data pada halaman dapat berubah.

Contoh:
* Like berubah
* Dropdown berubah
* Input berubah

---

### Variabel State

```dart
bool isLiked = false;
String selectedValue = "Espresso";
TextEditingController namaController = TextEditingController();
```

Penjelasan:
* `isLiked` digunakan untuk menyimpan status tombol favorit.
* `selectedValue` digunakan untuk menyimpan pilihan dropdown menu coffee.
* `namaController` digunakan untuk menyimpan input nama pelanggan.

---

### TextField

```dart
TextField(
  controller: namaController,
  decoration: InputDecoration(
    hintText: "Masukkan nama",
    prefixIcon: const Icon(Icons.person),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide.none,
    ),
  ),
)
```

Penjelasan:
* Input nama pengguna
* Menampilkan placeholder
* Menampilkan icon

---

### Custom Dropdown

```dart
CustomDropdown(
  value: selectedValue,
  onChanged: (value) {
    setState(() {
      selectedValue = value!;
    });
  },
)
```

Penjelasan:
* Menampilkan pilihan menu coffee
* Menyimpan pilihan pengguna

Pilihan:
* Espresso
* Cappuccino
* Latte
* Mocha
* Americano

---

### Tombol Like

```dart
OutlinedButton.icon(
  onPressed: () {
    setState(() {
      isLiked = !isLiked;
    });
  },
  icon: Icon(
    isLiked ? Icons.favorite : Icons.favorite_border,
    color: Colors.red,
  ),
  label: Text(
    isLiked ? "Disukai" : "Suka",
  ),
)
```

Penjelasan:
* Menyimpan status favorit
* Mengubah icon secara otomatis
* Menampilkan popup

---

### Popup Notification

```dart
showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: const Text("Berhasil"),
      content: const Text("Data berhasil disimpan"),
    );
  },
)
```

Penjelasan:
Digunakan untuk menampilkan card popup ketika:
* Like ditekan
* Unlike ditekan
* Submit ditekan

---

### Tombol Submit

```dart
ElevatedButton(
  onPressed: () {
    showPopup(
      title: "Berhasil",
      message: "Data berhasil disimpan",
    );
  },
  child: const Text("Submit"),
)
```

Penjelasan:
* Menyimpan data pesanan
* Menampilkan popup notifikasi

---

# 3. Profile Page (`profile_page.dart`)

Halaman Profile digunakan untuk menampilkan identitas pengguna.

---

### Circle Avatar

```dart
CircleAvatar(
  radius: 70,
  child: Icon(
    Icons.person,
    size: 80,
  ),
)
```

Penjelasan:
* Menampilkan foto profil default

---

### Informasi Pengguna

```dart
Text("Muhammad Rafiful Hana"),
Text("2311102227")
```

Penjelasan:
* Nama
* NIM
* Kelas

---

### Stat Card

```dart
stat("6", "Semester"),
```

Penjelasan:
* Semester
* Praktikum
* Project

---

# 4. Custom Dropdown (`custom_dropdown.dart`)

```dart
DropdownButton<String>(
  value: value,
  items: const [
    DropdownMenuItem(value: 'Espresso', child: Text('Espresso')),
    DropdownMenuItem(value: 'Cappuccino', child: Text('Cappuccino')),
    DropdownMenuItem(value: 'Latte', child: Text('Latte')),
    DropdownMenuItem(value: 'Mocha', child: Text('Mocha')),
    DropdownMenuItem(value: 'Americano', child: Text('Americano')),
  ],
  onChanged: onChanged,
)
```

Penjelasan:
* Menampilkan daftar pilihan menu coffee
* Mengirim nilai ke halaman Button

---

# 5. Feature Card (`feature_card.dart`)

```dart
Container(
  child: Column(
    children: [
      Icon(icon),
      Text(title),
      Text(subtitle),
    ],
  ),
)
```

Penjelasan:
* Menampilkan icon
* Menampilkan judul
* Menampilkan deskripsi

---

# 6. Stat Card (`stat_card.dart`)

```dart
Container(
  width: 100,
  padding: const EdgeInsets.all(18),
)
```

Penjelasan:
* Menampilkan informasi dalam bentuk card
* Membuat tampilan profile lebih menarik

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

### Home Page
![Home Page](output/Output%201.png)

### Button Page
![Button Page](output/Output%202.png)

### Profile Page
![Profile Page](output/Output%203.png)

### Notification Submit
![Notification Submit](output/Output%204.png)

### Notification Like
![Notification Like](output/Output%205.png)

### Notification Unlike
![Notification Unlike](output/Output%206.png)