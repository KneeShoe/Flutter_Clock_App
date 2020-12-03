import 'package:flutter/material.dart';

import 'home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Clock",
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: new homePage(),
    );
  }
}
