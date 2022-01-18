import "package:flutter/material.dart";
import 'package:gym_app/main.dart';

class addButton extends StatelessWidget {
  const addButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            child: FloatingActionButton(
            backgroundColor: appColors["main"],
            onPressed: null,
            
          ),
          margin: const EdgeInsets.only(top: 10.0),
          
    );
  }
}