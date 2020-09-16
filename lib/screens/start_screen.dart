import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  static const routeName = '/startScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Start Screen"),
      ),
      body: Text(''),
    );

  }

}