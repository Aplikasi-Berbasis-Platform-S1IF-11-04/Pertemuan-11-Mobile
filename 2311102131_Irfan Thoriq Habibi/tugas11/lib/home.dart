import 'package:flutter/material.dart';
import 'list.dart';
import 'logout.dart';

class HomePage extends StatelessWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        //LOGOUT
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: () {
              LogoutHelper.showLogoutDialog(context); 
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Selamat datang, $userName",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            
            ElevatedButton(
              child: const Text("Kelola Data"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ListPage()),
                );
              },
            ),
            
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}