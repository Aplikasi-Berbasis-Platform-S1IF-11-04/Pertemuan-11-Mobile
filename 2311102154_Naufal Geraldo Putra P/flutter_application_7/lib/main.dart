import 'package:flutter/material.dart';
import 'screens/button.dart';
import 'screens/container.dart';
import 'screens/flutter1.dart';
import 'screens/rowdancollom.dart';
import 'screens/tessting.dart';
import 'screens/textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blue)),
      home: const MyHomePage(title: 'Modul 7 - Pertemuan 12'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indexNow = 0;
  void _onItemTapped(int index) {
    setState(() {
      _indexNow = index;
    });

    final List<String> labels = [
      'Button',
      'Container',
      'My App',
      'Row Dan Column',
      'Testing',
      'Textfield',
    ];

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berhasil ke halaman ${labels[index]}'),
        backgroundColor: Colors.green, 
        duration: const Duration(
          milliseconds: 800,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      Button1(),
      Container1(),
      Myapp1(),
      Rowdancollom1(),
      Tessting1(),
      Textfield1(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: screens[_indexNow],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexNow,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_button),
            label: 'Button',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.square), 
            label: 'Container',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_shortcut_outlined),
            label: 'My App',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_3x3),
            label: 'Row Dan Collumn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.developer_mode),
            label: 'Testing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Textfield',
          ),
        ],
      ),
    );
  }
}
