import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_notes_taking_app/login.dart';
import 'package:flutter_notes_taking_app/main.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MaterialApp(
            title: 'Notes App',
            home: Login_Page(),
            theme: ThemeData(
                primarySwatch: Colors.green)))));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage('images/abc.jpg'), height: 300),
          Text("Mohsin Raza", style: TextStyle(fontSize: 20,color: Color(0xFFFD5872))),
          SizedBox(
            height: 10,
          ),
          Text("FA17-BSE-079", style: TextStyle(fontSize: 20,color: Color(0xFFFD5872))),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
            backgroundColor: Color(0xFFFD5872),
          )
        ],
      ),
    );
  }
}