import 'package:flutter/material.dart';

class ListDemoScreen extends StatefulWidget {
  static const routeName = '/listDemoScreen';

  @override
  State<StatefulWidget> createState() {
    return _ListDemoScreen();
  }
}

class _ListDemoScreen extends State<ListDemoScreen> {
  int count = 0;
  _Controller con;
  @override
  void initState() {
    super.initState();
    con = _Controller(this);

  }

  void render(fn) {
    setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Life Cycle'),
      ),
      body: Column(),
    );
  }
}

class _Controller {
  _Controller(_ListDemoScreen _listDemoScreen);
}
