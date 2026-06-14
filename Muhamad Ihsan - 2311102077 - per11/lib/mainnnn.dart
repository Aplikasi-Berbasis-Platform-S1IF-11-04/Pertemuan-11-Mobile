import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Product.dart';

void main() => runApp(const MyApp12());

class MyApp12 extends StatefulWidget {
  const MyApp12({super.key});

  @override
  State<MyApp12> createState() => MyAppState();
}

class MyAppState extends State<MyApp12> {
  late Future<List<Product>> products;

  // Fungsi untuk mengambil data dari API Laravel
  Future<List<Product>> fetchProduct() async {
    // Alamat IP disesuaikan dengan IP laptop kamu agar bisa diakses device/emulator
    final res = await http.get(
      Uri.parse('http://172.16.0.245:8000/api/product'),
    );

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      // Mengambil data dari dalam key 'list' sesuai format JSON Laravel kamu
      var parsed = data['list'].cast<Map<String, dynamic>>();
      return parsed.map<Product>((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  void initState() {
    super.initState();
    products =
        fetchProduct(); // Memanggil fungsi fetch saat aplikasi pertama kali jalan
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network',
      theme: ThemeData(primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: FutureBuilder<List<Product>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      'Tidak ada data',
                      style: TextStyle(color: Colors.teal, fontSize: 28),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {}, // Tambahkan aksi jika card diklik
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, top: 15),
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].name,
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 28,
                                ),
                              ),
                              Text(
                                "Rp ${snapshot.data![index].price}",
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'));
              }

              // Loading screen saat mengambil data
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
