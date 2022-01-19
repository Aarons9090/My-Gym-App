import "package:flutter/material.dart";

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 100,
      height: 100,
      child: Card(
       child: ListTile(title: Text("Exercise"))
      )
    );
  }
}