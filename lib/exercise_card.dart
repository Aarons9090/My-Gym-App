import "package:flutter/material.dart";

class ExerciseCard extends StatelessWidget {
  final Text exerciseTitle;

  const ExerciseCard(this.exerciseTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Card(
       child: ListTile(title: exerciseTitle)
      )
    );
  }
}