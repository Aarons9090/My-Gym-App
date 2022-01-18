import "package:flutter/material.dart";
import 'package:gym_app/main.dart';

class topBar extends StatelessWidget implements PreferredSizeWidget {
  

  const topBar({required AppBar appBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("My Gym App"),
      backgroundColor: appColors["topbar"],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
