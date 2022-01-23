import "package:flutter/material.dart";
import 'package:gym_app/database.dart';
import 'package:gym_app/main.dart';

class ExerciseCard extends StatefulWidget {
  final String _exerciseTitle;
  final Function refreshParent;

  const ExerciseCard(this._exerciseTitle, this.refreshParent, {Key? key}) : super(key: key);

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  late final List<Card> _repCard = [];
  
  void deleteCard(){
    setState(() {
      LocalDatabase().deleteName(widget._exerciseTitle);
      widget.refreshParent();
    });
    
  }

  void _buttonPressed() {
    setState(() {
      // variable for input
      String _reps = "null";
      String _weight = "null";
      String _date = "null";

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
                child: AlertDialog(
              title: const Text("Enter details:"),
              content: Wrap(
                runSpacing: 20,
                children: [
                  // Reps
                  const Text("Enter reps:"),
                  TextField(
                    controller: TextEditingController(),
                    onChanged: (String value) {
                      _reps = value;
                    },
                  ),

                  // Weight
                  const Text("Enter weight:"),
                  TextField(
                    controller: TextEditingController(),
                    onChanged: (String value) {
                      _weight = value;
                    },
                  ),

                  // Date
                  const Text("Enter date:"),
                  TextField(
                    controller: TextEditingController(),
                    onChanged: (String value) {
                      _date = value;
                    },
                  ),

                  // Add button
                  TextButton(
                    child: const Text("Add"),
                    onPressed: () {
                      setState(() {
                        if ((_reps != "null") &
                            (_weight != "null") &
                            (_date != "null")) {
                          _repCard.add(
                            Card(
                              color: appColors["light"],
                              margin: const EdgeInsets.only(
                                  left: 6, right: 6, top: 6, bottom: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(_reps),
                                  Text(_weight),
                                  Text(_date),
                                ],
                              ),
                            ),
                          );
                        }
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                ],
              ),
            ));
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Exercise card
    return Card(
      child: Column(
        children: [
          //Top row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Header / Exercise name
              SizedBox(
                width: 300,
                child: ListTile(
                  title: Text(widget._exerciseTitle,
                      style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
                  textColor: appColors["main"],
                ),
              ),

              //Delete button
              Container(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  onPressed: deleteCard
                ),
              ),
            ],
          ),

          // Titles
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Reps",
                style: TextStyle(color: appColors["main"]),
              ),
              Text("Weight", style: TextStyle(color: appColors["main"])),
              Text("Date", style: TextStyle(color: appColors["main"])),
            ],
          ),

          // Background of sets
          Container(
            decoration: BoxDecoration(
              color: appColors["dark"],
              borderRadius: BorderRadius.circular(7),
            ),
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _repCard.length,
                itemBuilder: (BuildContext context, int index) {
                  return _repCard[index];
                }),
          ),

          // Container for button
          Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.bottomRight,
            child:

                //Add button
                FloatingActionButton.small(
              backgroundColor: appColors["main"],
              child: const Icon(Icons.add),
              onPressed: _buttonPressed,
            ),
          ),
        ],
      ),
    );
  }
}
