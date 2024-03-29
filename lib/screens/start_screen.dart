import 'package:flutter/material.dart';
import 'package:lesson2/screens/profile_screen.dart';
import 'package:lesson2/screens/tapoplist_screen.dart';
import 'package:lesson2/screens/widgetlifecycle.dart';

import 'counterdemo_screen.dart';
import 'formdemo_screen.dart';
import 'listdemo_screen.dart';

class StartScreen extends StatelessWidget {
  static const routeName = '/startScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Start Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, CounterDemoScreen.routeName),
              child: Text("Counter Demo"),
            ),
            RaisedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, WidgetLifeCycle.routeName),
              child: Text("Widget LifeCycle Demo"),
            ),
            RaisedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, ListDemoScreen.routeName),
              child: Text("List Demo"),
            ),
                        RaisedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, TapOnListScreen.routeName),
              child: Text('Tap on List Demo'),
            ),
            RaisedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, FormDemoScreen.routeName),
              child: Text('Form Demo'),
            ),
             RaisedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, ProfileScreen.routeName),
              child: Text('Profile Edit Demo'),
            ),
          ],
        ),
      ),
    );
  }
}
