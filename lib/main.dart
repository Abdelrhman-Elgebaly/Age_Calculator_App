import 'package:flutter/material.dart';

import 'file:///F:/practice/lib/screens/home_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Age Calculator App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF0b0d31),
        primarySwatch: Colors.blueGrey,
      ),
      home: HomeScreen(),
    );
  }
}
