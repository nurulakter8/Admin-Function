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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: con.save,
          ),
        ],
      ),
      body: Form(
          key: formKey,
          child: SingleChildScrollView(
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(
                  height: 20,
                ),
                Text('Major'),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.blue),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RadioListTile(
                          title: Text(Major.CS.toString().split('.')[1]),
                          value: Major.CS,
                          groupValue: profile.major,
                          onChanged: con.onChangedMajor,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          title: Text(Major.SE.toString().split('.')[1]),
                          value: Major.SE,
                          groupValue: profile.major,
                          onChanged: con.onChangedMajor,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          title: Text(Major.Other.toString().split('.')[1]),
                          value: Major.Other,
                          groupValue: profile.major,
                          onChanged: con.onChangedMajor,
                        ),
                      ),
                    ],
                  ),
                ),
                Text('Classification'),
                DropdownButtonFormField(
                  hint: Text('classification'),
                  value: profile.classification,
                  onChanged: con.onChangedClassification,
                  items: con.getClassificationList(),
                ),
                Text('Language Proficience'),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: profile.languages[Language.Dart],
                      onChanged: con.onChangedDart,
                    ),
                    Text(Language.Dart.toString().split('.')[1]),
                    Checkbox(
                      value: profile.languages[Language.Java],
                      onChanged: con.onChangedJava,
                    ),
                    Text(Language.Java.toString().split('.')[1]),
                    Checkbox(
                      value: profile.languages[Language.CPP],
                      onChanged: con.onChangedCPP,
                    ),
                    Text('C++'),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class _Controller {
  _ProfileEditState _state;
  _Controller(this._state);
  void save() {
    if (_state.formKey.currentState.validate()) {
      _state.formKey.currentState.save();
      Navigator.pop(_state.context, _state.profile);
    }
  }

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

  void onChangedMajor(Major m) {
    _state.render(() {
      _state.profile.major = m;
    });
  }

  List getClassificationList() {
    return Classification.values.map((c) {
      return DropdownMenuItem(
        value: c,
        child: Text(c.toString().split('.')[1]),
      );
    }).toList();
  }

  void onChangedClassification(Classification c) {
    _state.profile.classification = c;
  }

  void onChangedDart(bool checked) {
    _state.render(() {
      _state.profile.languages[Language.Dart] = checked;
    });
  }

  void onChangedJava(bool checked) {
    _state.render(() {
      _state.profile.languages[Language.Java] = checked;
    });
  }

  void onChangedCPP(bool checked) {
    _state.render(() {
      _state.profile.languages[Language.CPP] = checked;
    });
  }
}
