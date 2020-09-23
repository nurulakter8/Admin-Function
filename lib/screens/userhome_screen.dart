import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  static const routeName = '/formDemoScreen/userHomeScreen';
  @override
  Widget build(BuildContext context) {
    Map userInfo = ModalRoute.of(context).settings.arguments;
    return WillPopScope(
      onWillPop: () => Future.value(false), // disable back button
          child: Scaffold(
        appBar: AppBar(
          title: Text('User Home'),
        ),
        body: Text("Email: ${userInfo['email']} \n Password: ${userInfo['password']}",style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
