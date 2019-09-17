import 'package:flutter/material.dart';

class PlanetX extends StatefulWidget {
  @override
  _PlanetXState createState() => _PlanetXState();

 /* @override
  State<StatefulWidget>createState(){
    return new _PlanetXState();
  }*/
}

class _PlanetXState extends State<PlanetX> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('assets/images/planet.png')
          ],
        ),
      ),
    );
  }
}
