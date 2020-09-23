import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormDemoScreen extends StatefulWidget {
  static const routeName = '/formdemoScreen';

  @override
  State<StatefulWidget> createState() {
    return _FormDemoState();
  }
}
class _FormDemoState extends State<FormDemoScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Form Demo"), 
      ),
    );
  }
 

}