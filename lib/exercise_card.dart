import "package:flutter/material.dart";

class ExerciseCard extends StatelessWidget {
  final String _exerciseTitle;

  const ExerciseCard(this._exerciseTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(
              child: ListTile(
                  title: Text(_exerciseTitle,
                      style: const TextStyle(fontSize: 30.0)))),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Text("Reps"),
                Text("Weigth"),
                Text("Date"),
              ])
        ],
      ),
    );
  }
}
