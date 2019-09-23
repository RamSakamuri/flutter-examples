import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

String NewMsg;
//void main() => runApp(MyHome());
void main() async{
  NewMsg = "No Data Yet";
  var data = await readData();
  if(data != null){
    String msg = await readData();
    NewMsg = msg;
    print(msg);
  }
  runApp(new MaterialApp(
    title: 'IO',
    home: new MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var _enterDataField = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Read/Write'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: new Container(
        // padding: const EdgeInsets.all(5.5),
        alignment: Alignment.topCenter,
        child: new ListTile(
          title: new TextField(
            controller: _enterDataField,
            decoration: new InputDecoration(
                labelText: "Start Writing here",
                hintText: 'Saibaba Babuji'
            ),
          ),
          subtitle: new FlatButton(onPressed: () {
            setState() {
              writeData(_enterDataField.text);
            }
          },
              child: new Column(
                children: <Widget>[
                  new Text('Save Data'),
                  new Padding(padding: new EdgeInsets.all(12)),
                  //new Text('Save data goes here'),
                  new FutureBuilder(
                    future: readData(),
                    builder: (BuildContext context, AsyncSnapshot<String> data){
                      if(data.hasData != null) {
                        return new Text(
                          data.data.toString(),
                          style: new TextStyle(
                              color: Colors.blueAccent
                          ),
                        );
                      }
                      else {
                        return new Text("No data!!");
                      }
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }
}


Future<String> get _localPath async{
  final directory = await getApplicationDocumentsDirectory();
  return directory.path; // home/directory/
}

Future<File> get _localFile async{
  final path = await _localPath;
  return new File('$path/NewFileName.txt'); // home/directory/NewFileName.txt
}

//write from file
Future<File> writeData(String msg) async{
  final file = await _localFile;
  return file.writeAsString('$msg');
}
//read from file
Future<String> readData() async{
  try {
    final file = await _localFile;
    String data= await file.readAsString();
    return data;
  }catch(e){
    return "Error file cant be read";
  }

}


