import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              // INPUT NAMA
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Masukkan Nama",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // TOMBOL MASUK
              ElevatedButton(
                onPressed: () {
                  if (nameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Nama tidak boleh kosong"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            HomePage(userName: nameController.text.trim()),
                      ),
                    );
                  }
                },
                child: const Text("Masuk"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}