import "package:flutter/material.dart";
import 'package:gym_app/main.dart';

class exerciseCard extends StatelessWidget {
  const exerciseCard({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: 100,
      height: 100,
      child: Card(
       child: ListTile(title: Text("Exercise"))
      )
    );
  }
}