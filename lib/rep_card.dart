import "package:flutter/material.dart";
import 'package:gym_app/database.dart';
import 'package:gym_app/main.dart';

class repCard extends Card {
  final String reps;
  final String weight;
  final String date;

  repCard(this.reps, this.weight, this.date);

  Widget build(BuildContext context) {
    return Card(
      color: appColors["light"],
      margin: const EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(reps),
          Text(weight),
          Text(date),
        ],
      ),
    );
  }
}
