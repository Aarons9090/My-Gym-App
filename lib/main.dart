import 'package:flutter/material.dart';
import "./topBar.dart";

Map<String, Color> appColors = {
  "background": const Color(0xff04052E),
  "main": const Color(0xff140152),
  "white": const Color(0xffffffff),
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
      backgroundColor: appColors["background"],
      appBar: topBar(
        appBar: AppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          addButton()
          
        ],
      ),
    ));
  }
}
