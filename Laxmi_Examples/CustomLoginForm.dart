import 'package:flutter/material.dart';

class CustomLoginForm extends StatefulWidget {
  @override
  _CustomLoginFormState createState() => _CustomLoginFormState();
}

class _LoginData{
  String name = "";
  String password = "";
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>();

  _LoginData _data  = new _LoginData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Image.asset("images/face.png", color: Colors.white, width: 100, height: 100,fit: BoxFit.fill,),
          Center(
            child: Container(
                width: 100.0,
                height: 100.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/images/face.png'),
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Name: ",
                  border: OutlineInputBorder(
                      gapPadding: 3.3,
                      borderRadius: BorderRadius.circular(3.3))),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter name";
                } else {
                  _data.name = value;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Password: ",
                  border: OutlineInputBorder(
                      gapPadding: 3.3,
                      borderRadius: BorderRadius.circular(3.3))),
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter Password";
                } else {
                  _data.password = value;
                }
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          _data.name = _data.name;
                          _data.password =_data.password;
                        });
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("All is GOOOD")));
                      }
                    },
                    child: Text("Submit"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _data.name = "";
                      });
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.reset();
                      }
                    },
                    child: Text("Clear"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
                child: _data.name.isEmpty ? Text("**") : Text(
              "Welcome ${_data.name} !!",
              style: TextStyle(fontWeight: FontWeight.bold,
            color:  Colors.redAccent, fontSize: 19.0),)),
          ),
        ],
      ),
    );
  }
}
