import 'package:flutter/material.dart';

class Rowdancollom1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
    appBar:AppBar(title: 
      Text("login ")) ,
    body: Column(
      children: [
        Text("FROM LOGIN"),
        Padding(
          padding:EdgeInsets.all(20) ,
          child: TextField( decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "silahkan masukan username"
          ),
          ),
          ),
        Padding(
          padding:EdgeInsets.all(20) ,
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "silahkan masukan password"
          )),
          ),
        
        ElevatedButton(onPressed: (){} ,child: Text("data")),
        
      ],
    ),
    
    ),
    ); 
  }

}