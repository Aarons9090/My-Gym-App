import 'package:flutter/material.dart';
import 'top_bar.dart';
import "main_scroll_area.dart";

Map<String, Color> appColors = {
  "background": const Color(0xffEEEFF2),
  "main": const Color(0xff4043A2),
  "light": const Color(0xffEAECFC),
  "highlight": const Color(0xffFF570C),
};


void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Page number
  int bottomSelectedIndex = 0;

  // Controller for multiple pages
  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  // swipe to change pages
  void pageSwipe(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  // User pressed bottom par
  void navigationBarPressed(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  // PageView for multiple pages
  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageSwipe(index);
      },
      children: const <Widget>[
        ScrollArea(),
        Center(
          child: Text('second page coming soon...'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            backgroundColor: appColors["background"],
            appBar: TopBar(
              appBar: AppBar(),
            ),
            bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.emoji_events),
                      label: "PRs",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.fitness_center),
                    label: 'Exercises',
                    
                  ),
                ],
                currentIndex: bottomSelectedIndex,
                selectedItemColor: Colors.orange,
                onTap: (index) {
                  navigationBarPressed(index);
                }),
            body: buildPageView()));
  }
}
