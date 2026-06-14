import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Praktikum Widget Flutter",
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Praktikum Widget Flutter"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          const Text(
            "Demo Widget Flutter-2311102243 - Siti Madina Halim Siregar",
            style: TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 20),

          //---------------------------------
          // 1. Container
          //---------------------------------

          const Text(
            "1. Container",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontSize: 22),
          ),

          const SizedBox(height: 10),

          Container(
            height: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Selamat Datang",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ),

          const SizedBox(height: 30),

          //---------------------------------
          // 2. GridView
          //---------------------------------

          const Text(
            "2. GridView",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontSize: 22),
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 300,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(6, (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Menu ${index + 1}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 20),

          //---------------------------------
          //3. ListView
          //---------------------------------

          const Text(
            "3. ListView",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontSize: 22),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.star),
              title: Text("Pilihan A"),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Pilihan B"),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.thumb_up),
              title: Text("Pilihan C"),
            ),
          ),

          const SizedBox(height: 20),

          //---------------------------------
          //4. ListView.builder
          //---------------------------------

          const Text(
            "4. ListView.builder",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontSize: 22),
          ),

          SizedBox(
            height: 220,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {

                List<String> minuman = [
                  "Kopi",
                  "Teh",
                  "Jus Jeruk",
                  "Susu"
                ];

                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.local_cafe),
                    title: Text(minuman[index]),
                    subtitle: Text("Minuman ke-${index + 1}"),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          //---------------------------------
          //5. ListView.separated
          //---------------------------------

          const Text(
            "5. ListView.separated",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontSize: 22),
          ),

          SizedBox(
            height: 220,
            child: ListView.separated(
              itemCount: 4,
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.deepPurple),
              itemBuilder: (context, index) {

                List<String> kendaraan = [
                  "Mobil",
                  "Motor",
                  "Sepeda",
                  "Bus"
                ];

                return ListTile(
                  leading: const Icon(Icons.directions_car),
                  title: Text(kendaraan[index]),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          //---------------------------------
          //6. Stack
          //---------------------------------

          const Text(
            "6. Stack",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontSize: 22),
          ),

          const SizedBox(height: 20),

          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [

                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                const Text(
                  "Flutter UI",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 50),

        ],
      ),
    );
  }
}