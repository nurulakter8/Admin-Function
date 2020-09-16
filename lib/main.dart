import 'package:flutter/material.dart';
import 'package:lesson2/screens/counterdemo_screen.dart';
import 'package:lesson2/screens/listdemo_screen.dart';
import 'package:lesson2/screens/start_screen.dart';
import 'package:lesson2/screens/widgetlifecycle.dart';

void main() {
  runApp(Lesson2App());
}

class Lesson2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartScreen.routeName,
      routes: {
        StartScreen.routeName: (context) => StartScreen(),
        CounterDemoScreen.routeName: (context) => CounterDemoScreen(),
        WidgetLifeCycle.routeName: (context) => WidgetLifeCycle(),
        ListDemoScreen.routeName: (context) => ListDemoScreen(),
      },
    );
  }
}
