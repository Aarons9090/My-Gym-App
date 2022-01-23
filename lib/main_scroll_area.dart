import "package:flutter/material.dart";
import "add_button.dart";

class ScrollArea extends StatefulWidget {
  const ScrollArea({Key? key}) : super(key: key);

  @override
  _ScrollAreaState createState() => _ScrollAreaState();
}

class _ScrollAreaState extends State<ScrollArea> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          
          AddButton(),
        ],
      ),
    );
  }
}