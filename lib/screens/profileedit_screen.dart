import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson2/model/profile.dart';

class ProfileEditScreen extends StatefulWidget {
  static const routeName = '/profileScreen/profileEditScreen';
  @override
  State<StatefulWidget> createState() {
    return _ProfileEditState();
  }
}

class _ProfileEditState extends State<ProfileEditScreen> {
  _Controller con;
  var formKey = GlobalKey<FormState>();
  Profile profile;

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  void render(fn) => setState(fn);

  @override
  Widget build(BuildContext context) {
    profile = ModalRoute.of(context)
        .settings
        .arguments; // thats how to read info sent from prev screen
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit profile"),
      ),
      body: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.face), labelText: "Name: "),
                autocorrect: false,
                initialValue: profile.name,
                validator: con.validatorName,
                onSaved: con.onSavedName,
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.today), labelText: "Age: "),
                keyboardType: TextInputType.number,
                initialValue: profile.age.toString(),
                validator: con.validatorAge,
                onSaved: con.onSavedAge,
              ),
            ],
          )),
    );
  }
}

class _Controller {
  _ProfileEditState _state;
  _Controller(this._state);

  String validatorName(String value) {
    if (value.length < 2)
      return 'min 2 chars';
    else
      return null;
  }

  void onSavedName(String value) {
    _state.profile.name = value;
  }

  String validatorAge(String value) {
    try {
      int age = int.parse(value);
      if (age > 5)
        return null;
      else
        return "Required: Age > 5";
    } catch (e) {
      return "Not an Integer";
    }
}
    void onSavedAge(String value) {
      _state.profile.age = int.parse(value);
    }
  
}
