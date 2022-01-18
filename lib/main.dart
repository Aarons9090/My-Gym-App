import 'package:flutter/material.dart';
import "./topBar.dart";
import './exerciseCard.dart';
import './addButton.dart';

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
  List<Widget> dynamicList = [];

  void addButtonPressed() {
    setState(() {
      dynamicList.add(exerciseCard());
      print("added");
    });
  }

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
          Container(
            height: 600,
            child: ListView.builder(
                itemCount: dynamicList.length,
                itemBuilder: (BuildContext context, int index) {
                  return dynamicList[index];
                }),
          ),
          FloatingActionButton.extended(
            label: const Text("Add exercise"),
            icon: Icon(Icons.add),
            onPressed: addButtonPressed,
            backgroundColor: appColors["main"],
          ),
          
   
          ],
      ),
    ));
  }
}
