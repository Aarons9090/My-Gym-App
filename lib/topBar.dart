import "package:flutter/material.dart";
import 'package:gym_app/main.dart';

class topBar extends StatelessWidget implements PreferredSizeWidget {
  

  topBar({required AppBar appBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("My Gym App"),
      backgroundColor: appColors["main"],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
