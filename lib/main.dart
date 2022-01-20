import 'package:flutter/material.dart';
import 'top_bar.dart';
import 'add_button.dart';

Map<String, Color> appColors = {
  "background": const Color(0xffEEEFF2),
  "main": const Color(0xff4043A2),
  "light": const Color(0xffEAECFC),
  "highlight": const Color(0xffFF570C),
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
            appBar: TopBar(
              appBar: AppBar(),
            ),
            body: SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  AddButton(),
                ],
              ),
            )));
  }
}
