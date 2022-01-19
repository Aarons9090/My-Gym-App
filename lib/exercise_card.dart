import "package:flutter/material.dart";
import 'package:gym_app/main.dart';

class ExerciseCard extends StatefulWidget {
  final String _exerciseTitle;

  const ExerciseCard(this._exerciseTitle, {Key? key}) : super(key: key);

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  late List<Card> _repCard = [];

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
                        if ((_reps != "null") & (_weight != "null") & (_date != "null")) {
                          
                          _repCard.add(
                            Card(
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

          // Header / Exercise name
          SizedBox(
            child: ListTile(
              title: Text(widget._exerciseTitle,
                  style: const TextStyle(fontSize: 30.0)),
            ),
          ),

          // Titles
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              Text("Reps"),
              Text("Weight"),
              Text("Date"),
            ],
          ),

          // Background of sets
          
            Container(
              
              decoration: BoxDecoration(
    color: appColors["main"],
    
    
    borderRadius: BorderRadius.circular(7),
  ),



            margin: const EdgeInsets.only(left: 10, right: 10),
            
            child:ListView.builder(
                  shrinkWrap: true,
                    itemCount: _repCard.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _repCard[index];
                    }),
              ),
            
          
          
          // Container for button
          Container(
            
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.small(
              backgroundColor: Colors.black,
              child: const Icon(Icons.add),
              onPressed: _buttonPressed,
            ),
          )
        ],
      ),
    );
  }
}
