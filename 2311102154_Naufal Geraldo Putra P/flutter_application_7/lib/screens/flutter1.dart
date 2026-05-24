import 'package:flutter/material.dart';

class Myapp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
    appBar:AppBar(title: Text("ini aplikasi saya ")) ,
    body: Text("ini data saya "),
    ),); 
  }

}