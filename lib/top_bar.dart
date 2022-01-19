import "package:flutter/material.dart";
import 'package:gym_app/main.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  
  const TopBar({Key? key, required AppBar appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("My Gym App"),
      backgroundColor: appColors["main"],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
