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
                          cardList.add(ExerciseCard(Text(_input)));
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
