import "package:flutter/material.dart";
import 'package:gym_app/exercise_card.dart';
import 'package:gym_app/main.dart';

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  List<Widget> cardList = [];

  void addButtonPressed() {
    setState(() {
      //cardList.add(ExerciseCard(Text("sd")));
      late TextEditingController _controller = TextEditingController();
      String input = "null";
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
                content: Column(
              children: [
                TextField(
                  controller: _controller,
                  onChanged: (String value) {
                    input = value;
                  },
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      if(input != "null"){
                        cardList.add(ExerciseCard(Text(input)));
                      }
                      Navigator.of(context).pop();
                    });
                  },
                  child: const Text("Ok"),
                )
              ],
            ));
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 600,
          child: ListView.builder(
              itemCount: cardList.length,
              itemBuilder: (BuildContext context, int index) {
                return cardList[index];
              }),
        ),
        FloatingActionButton.extended(
          label: const Text("Add exercise"),
          icon: const Icon(Icons.add),
          onPressed: addButtonPressed,
          backgroundColor: appColors["main"],
        ),
      ],
    );
  }
}
