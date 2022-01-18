import 'package:flutter/material.dart';
import "./topBar.dart";

Map<String, Color> appColors = {
  "background" : const Color(0xff04052E),
  "topbar" : const Color(0xff140152),
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        appBar: topBar(
          appBar: AppBar(),
        )
      )
    );
  }
}
