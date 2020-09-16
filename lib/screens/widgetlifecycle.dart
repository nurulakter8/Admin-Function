import 'package:flutter/material.dart';

class WidgetLifeCycle extends StatefulWidget {
  static const routeName = '/widgetlifeCycle';

  @override
  State<StatefulWidget> createState() {
    return _WidgetLifeCycle();
  }
}

class _WidgetLifeCycle extends State<WidgetLifeCycle> {
  int count = 0;
  _Controller con;
  @override
  void initState() {
    super.initState();
    con = _Controller(this);
    print("******** initialState()");
    print("             = e.g, GPS listner, Camera con");
  }

  void render(fn) {
    setState(fn);
  }

  @override
  void dispose() {
    print("******** dispose()");
    print("             = e.g, GPS listner, Camera con");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("******** build()");
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Life Cycle'),
      ),
      body: Column(
        children: <Widget>[
          Text(count.toString()),
          RaisedButton(
            onPressed: con.buttonPressed,
            child: Text("Increase"),
          )
        ],
      ),
    );
  }
}

class _Controller {
  _WidgetLifeCycle _state;
  _Controller(this._state);
  void buttonPressed() {
    _state.render(() {
      ++_state.count;
    });
  }
}
