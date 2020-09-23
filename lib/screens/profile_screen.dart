import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson2/model/profile.dart';
import 'package:lesson2/screens/profileedit_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profileScreen';
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<ProfileScreen> {
  _Controller con;

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile "),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: con.edit,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          color: Colors.blue[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Name: ${con.profile.name}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Age: ${con.profile.age}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Classification: ${con.profile.classification.toString().split(".")[1]}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Major: ${con.profile.major.toString().split(".")[1]}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Language Proficiency',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: con.profile.languages[Language.Dart],
                    onChanged: null,
                  ),
                  Text("Dart"),
                ],
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: con.profile.languages[Language.Java],
                    onChanged: null,
                  ),
                  Text("Java"),
                ],
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: con.profile.languages[Language.CPP],
                    onChanged: null,
                  ),
                  Text("C++"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Controller {
  _ProfileState _state;
  Profile profile = Profile();
  _Controller(this._state);

  void edit(){
    Navigator.pushNamed(_state.context, ProfileEditScreen.routeName, arguments: profile);
  }
}
