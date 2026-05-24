<h3 align="center">LAPORAN PRAKTIKUM</h3>
<h3 align="center">APLIKASI BERBASIS PLATFORM</h3>
<h3 align="center">Modul 7</h3>

<br>
<p align="center">
  <img src="Screenshot Output/logo telkom university.png" width="150"/>
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

## 1. Home Page (`home_page.dart`)

Halaman Home merupakan halaman utama yang pertama kali muncul ketika aplikasi dijalankan. Halaman ini menampilkan informasi pengguna dan menu navigasi menuju halaman Button serta Profile.

---

### Import Package

Kode:

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/feature_card.dart';
import 'button_page.dart';
import 'profile_page.dart';
```

Penjelasan:

* `material.dart`

  Digunakan untuk mengakses widget bawaan Flutter.

* `google_fonts.dart`

  Digunakan untuk menambahkan font dari Google Fonts.

* `feature_card.dart`

  Digunakan untuk menampilkan card menu.

* `button_page.dart`

  Digunakan sebagai tujuan navigasi Button Page.

* `profile_page.dart`

  Digunakan sebagai tujuan navigasi Profile Page.

---

### Widget HomePage

Kode:

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(
      BuildContext context) {

    return SingleChildScrollView();
  }
}
```

Penjelasan:

`StatelessWidget` digunakan karena halaman Home tidak memerlukan perubahan data atau state.

---

### Container Gradient

Kode:

```dart
Container(
  height: 180,
  width: double.infinity,

  decoration: BoxDecoration(
    borderRadius:
        BorderRadius.circular(
            25),

    gradient:
        const LinearGradient(
      colors: [

        Color(0xff6A11CB),

        Color(0xff2575FC),

      ],
    ),
  ),
)
```

Penjelasan:

Fungsi:

* Menampilkan informasi pengguna
* Menambahkan desain gradasi warna
* Membuat tampilan lebih menarik

---

### Feature Card

Kode:

```dart
FeatureCard(
  icon:
      Icons.smart_button,

  title:
      "Button",

  subtitle:
      "Implementasi project button",
)
```

Penjelasan:

Fungsi:

* Menampilkan icon
* Menampilkan judul
* Menampilkan deskripsi menu

---

### Navigation

Kode:

```dart
Navigator.push(
  context,

  MaterialPageRoute(
    builder: (_) =>
        const ButtonPage(),
  ),
);
```

Penjelasan:

Fungsi:

* Berpindah halaman
* Mengarahkan pengguna ke halaman Button atau Profile

---

### Notification

Kode:

```dart
ScaffoldMessenger.of(
        context)
    .showSnackBar(

  const SnackBar(

    content: Text(
      "Membuka halaman Button",
    ),
  ),
);
```

Penjelasan:

Digunakan untuk:

* Menampilkan notifikasi ketika tombol ditekan
* Memberikan informasi kepada pengguna

---

# 2. Button Page (`button_page.dart`)

Button Page digunakan untuk menampilkan berbagai komponen interaktif.

---

### Stateful Widget

Kode:

```dart
class ButtonPage
    extends StatefulWidget {

  const ButtonPage({
    super.key,
  });

  @override
  State<ButtonPage>
      createState() =>
          _ButtonPageState();
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

Kode:

```dart
bool isLiked = false;

String selectedValue =
    "Flutter";

TextEditingController
    namaController =
    TextEditingController();
```

Penjelasan:

`isLiked`

Digunakan untuk menyimpan status tombol favorit.

`selectedValue`

Digunakan untuk menyimpan pilihan dropdown.

`namaController`

Digunakan untuk menyimpan input nama.

---

### TextField

Kode:

```dart
TextField(
  controller:
      namaController,

  decoration:
      InputDecoration(

    hintText:
        "Masukkan nama",

    prefixIcon:
        const Icon(
      Icons.person,
    ),

    filled: true,

    fillColor:
        Colors.white,

    border:
        OutlineInputBorder(

      borderRadius:
          BorderRadius.circular(
              18),

      borderSide:
          BorderSide.none,
    ),
  ),
)
```

Penjelasan:

Fungsi:

* Input nama pengguna
* Menampilkan placeholder
* Menampilkan icon

---

### Custom Dropdown

Kode:

```dart
CustomDropdown(
  value:
      selectedValue,

  onChanged:
      (value) {

    setState(() {

      selectedValue =
          value!;

    });
  },
)
```

Penjelasan:

Fungsi:

* Menampilkan pilihan teknologi
* Menyimpan pilihan pengguna

Pilihan:

* Flutter
* Dart
* Firebase

---

### Tombol Like

Kode:

```dart
OutlinedButton.icon(

  onPressed: () {

    setState(() {

      isLiked =
          !isLiked;

    });
  },

  icon: Icon(

    isLiked
        ? Icons.favorite
        : Icons.favorite_border,

    color:
        Colors.red,
  ),

  label: Text(

    isLiked
        ? "Disukai"
        : "Suka",
  ),
)
```

Penjelasan:

Fungsi:

* Menyimpan status favorit
* Mengubah icon secara otomatis
* Menampilkan popup

---

### Popup Notification

Kode:

```dart
showDialog(

  context:
      context,

  builder:
      (context) {

    return AlertDialog(

      title:
          const Text(
        "Berhasil",
      ),

      content:
          const Text(
        "Data berhasil disimpan",
      ),
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

Kode:

```dart
ElevatedButton(

  onPressed: () {

    showPopup(
      title:
          "Berhasil",

      message:
          "Data berhasil disimpan",
    );
  },

  child:
      const Text(
    "Submit",
  ),
)
```

Penjelasan:

Fungsi:

* Menyimpan data
* Menampilkan popup notifikasi

---

# 3. Profile Page (`profile_page.dart`)

Halaman Profile digunakan untuk menampilkan identitas pengguna.

---

### Circle Avatar

Kode:

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

Fungsi:

* Menampilkan foto profil default

---

### Informasi Pengguna

Kode:

```dart
Text(
  "D'sharlendita Febianda Aurelia"
),

Text(
  "2311102069"
)
```

Penjelasan:

Digunakan untuk menampilkan:

* Nama
* NIM

---

### Stat Card

Kode:

```dart
stat(
  "6",
  "Semester",
)
```

Penjelasan:

Fungsi:

Menampilkan:

* Semester
* Praktikum
* Project

---

# 4. Custom Dropdown (`custom_dropdown.dart`)

Kode:

```dart
DropdownButton<String>(

  value: value,

  items: const [

    DropdownMenuItem(
      value: 'Flutter',
      child:
          Text('Flutter'),
    ),

    DropdownMenuItem(
      value: 'Dart',
      child:
          Text('Dart'),
    ),

    DropdownMenuItem(
      value: 'Firebase',
      child:
          Text('Firebase'),
    ),
  ],

  onChanged:
      onChanged,
)
```

Penjelasan:

Fungsi:

* Menampilkan daftar pilihan
* Mengirim nilai ke halaman Button

---

# 5. Feature Card (`feature_card.dart`)

Kode:

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

Fungsi:

* Menampilkan icon
* Menampilkan judul
* Menampilkan deskripsi

---

# 6. Stat Card (`stat_card.dart`)

Kode:

```dart
Container(

  width: 100,

  padding:
      const EdgeInsets.all(
          18),
)
```

Penjelasan:

Fungsi:

* Menampilkan informasi dalam bentuk card
* Membuat tampilan profile lebih menarik

```

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
![Home Page](Screenshot%20Output/Output%201.png)

### Button Page
![Button Page](Screenshot%20Output/Output%203.png)

### Profile Page
![Profile Page](Screenshot%20Output/Output%205.png)

### Notification Submit
![Notification Submit](Screenshot%20Output/Output%209.png)

### Notification Like
![Notification Like](Screenshot%20Output/Output%207.png)

### Notification Unlike
![Notification Unlike](Screenshot%20Output/Output%208.png)

