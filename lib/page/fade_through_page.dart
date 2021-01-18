import 'package:animations/animations.dart';
import 'package:animations_fadethrough_example/main.dart';
import 'package:flutter/material.dart';

import 'first_page.dart';
import 'second_page.dart';

class FadeThroughPage extends StatefulWidget {
  @override
  _FadeThroughPageState createState() => _FadeThroughPageState();
}

class _FadeThroughPageState extends State<FadeThroughPage> {
  int index = 0;

  final pages = [
    FirstPage(),
    SecondPage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: PageTransitionSwitcher(
          duration: Duration(seconds: 1),
          transitionBuilder: (child, animation, secondaryAnimation) =>
              FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
          child: pages[index],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.white,
          currentIndex: index,
          onTap: (int index) => setState(() => this.index = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              label: 'Page 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              label: 'Page 2',
            ),
          ],
        ),
      );
}
