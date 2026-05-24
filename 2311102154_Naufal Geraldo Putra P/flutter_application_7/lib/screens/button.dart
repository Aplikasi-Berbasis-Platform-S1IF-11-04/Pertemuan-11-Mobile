import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
    appBar:AppBar(title: Text("ini aplikasi saya ")) ,
    body: Center(child: 
    OutlinedButton(
      onPressed: (){
        print("button di tekan ");
        
      }, 
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.amberAccent
      ),
      child: new Text("login")
      ),),
    ),
    ); 
  }

}