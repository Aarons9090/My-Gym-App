import "package:flutter/material.dart";
import 'package:gym_app/exercise_card.dart';
import 'package:gym_app/main.dart';
import "database.dart";

class AddButton extends StatefulWidget {

  const AddButton({Key? key,}) : super(key: key);
  
  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  final List<Widget> cardList = [];

  //called when a card is deleted
  void refresh(){
    setState(() {
    });
  }

  void deleteCards() {
    setState(() {
      cardList.clear();
    });
  }

  void createNewCard(ExerciseCard e) {
    cardList.add(e);
  }

  // Add exercise button clicked
  void addButtonPressed() {
    setState(() {
      late TextEditingController _controller = TextEditingController();
      // variable for exercise name input
      String _input = "null";
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
                child: AlertDialog(
              title: const Text("Enter exercise:"),
              content: Column(
                children: [
                  TextField(
                    controller: _controller,
                    onChanged: (String value) {
                      _input = value;
                    },
                  ),
                  TextButton(
                    child: const Text("Add"),
                    onPressed: () {
                      setState(() {
                        if (_input != "null") {
                          LocalDatabase().addName(_input);
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
    return FutureBuilder(
        future: LocalDatabase().getNames(), 
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          cardList.clear();
          if (snapshot.hasData) {
            for (var nimi in snapshot.data) {
              if (nimi == null) {
                continue;
              }

              ExerciseCard newCard = ExerciseCard(nimi, refresh);

              cardList.add(newCard);
            }

            return Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: SizedBox(
                    height: 610,
                    child: ListView.builder(
                        itemCount: cardList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return cardList[index];
                        }),
                  ),
                ),

                // add exercise button
                Positioned(
                  bottom: 10,
                  left: 110,
                  child: FloatingActionButton.extended(
                    label: const Text("Add exercise"),
                    icon: const Icon(Icons.add),
                    onPressed: addButtonPressed,
                    backgroundColor: appColors["main"],
                  ),
                )

                
              ],
            );
          } else {
            return const Text("Couldn't receive data");
          }
        });
  }
}
