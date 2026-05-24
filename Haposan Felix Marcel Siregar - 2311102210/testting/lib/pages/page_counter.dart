import 'package:flutter/material.dart';

class PageCounter extends StatefulWidget {
  const PageCounter({super.key});

  @override
  State<PageCounter> createState() => _PageCounterState();
}

class _PageCounterState extends State<PageCounter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });

    if (_counter == 5) {
      Future.delayed(const Duration(milliseconds: 100), () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 28),
                SizedBox(width: 8),
                Text('Pencapaian!'),
              ],
            ),
            content: const Text(
              'Kamu sudah menekan tombol sebanyak 5 kali!\nTerus semangat belajar Flutter!',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Lanjutkan'),
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () {
                  setState(() => _counter = 0);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Counter direset ke 0'),
                      backgroundColor: Colors.teal,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                },
                child: const Text('Reset',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Counter: $_counter — tekan ${5 - _counter} lagi untuk pencapaian!'),
          backgroundColor: Colors.teal,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          duration: const Duration(milliseconds: 800),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman 6 — Counter'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Kamu telah menekan tombol sebanyak:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Text(
                '$_counter',
                key: ValueKey(_counter),
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: _counter >= 5 ? Colors.amber : Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _counter < 5
                  ? 'Tekan ${5 - _counter} lagi untuk pencapaian!'
                  : 'Pencapaian tercapai!',
              style: TextStyle(
                color: _counter >= 5 ? Colors.amber : Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        backgroundColor: Colors.teal,
        tooltip: 'Tambah',
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
