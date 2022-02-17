import "package:flutter/material.dart";
import 'package:gym_app/main.dart';

class RepCard extends Card {
  final String _reps;
  final String _weight;
  final String _date;
  final String _exerciseName;

  RepCard(this._exerciseName, this._reps, this._weight, this._date);

  String getReps(){
    return _reps;
  }

  String getWeight(){
    return _weight;
  }

  String getDate(){
    return _date;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appColors["light"],
      margin: const EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(_reps),
          Text(_weight),
          Text(_date),
        ],
      ),
    );
  }
}
