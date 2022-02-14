import "package:flutter/material.dart";
import 'package:gym_app/exercise_card.dart';
import 'package:gym_app/main.dart';
import "database.dart";
import "rep_card.dart";

class AddButton extends StatefulWidget {
  const AddButton({
    Key? key,
  }) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  final List<Widget> cardList = [];

  //called when a card is deleted
  void refresh() {
    setState(() {});
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
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              primary: appColors["main"],
                              side: BorderSide(
                                width: 2.0,
                                color: (appColors["main"])!,
                                style: BorderStyle.solid,
                              )),
                          child: const Text("Cancel"),
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          }),
                      ElevatedButton(
                        child: const Text("Add"),
                        style: ElevatedButton.styleFrom(
                            primary: appColors["main"]),
                        onPressed: () {
                          setState(() {
                            if (_input != "null") {
                              LocalDatabase().addExercise(_input);
                            }
                            Navigator.of(context).pop();
                          });
                        },
                      ),
                    ],
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
        future: LocalDatabase().getCards(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          cardList.clear();
          if (snapshot.hasData) {
            Map<String, List<Map<String, String>>> cards =
                snapshot.data as Map<String, List<Map<String, String>>>;
            List<repCard> repCards = [];

            cards.forEach((k, v) => {
                  repCards.clear(),
                  for (var rep in v)
                    {
                      repCards.add(repCard(rep["reps"]!, rep["weight"]!, rep["date"]!))
                    },
                  cardList.add(ExerciseCard(k, refresh, List.from(repCards))),
                });

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
                    bottom: MediaQuery.of(context).size.height * 0.01,
                    left: MediaQuery.of(context).size.width / 4,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: FloatingActionButton.extended(
                        label: const Text("Add exercise"),
                        icon: const Icon(Icons.add),
                        onPressed: addButtonPressed,
                        backgroundColor: appColors["main"],
                      ),
                    ))
              ],
            );
          } else {
            return const Text("Couldn't receive data");
          }
        });
  }
}
