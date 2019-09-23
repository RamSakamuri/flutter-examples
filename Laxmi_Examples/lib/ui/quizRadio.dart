import 'package:flutter/material.dart';

import './Question_bank.dart';

QuizBrain quizBrain = QuizBrain();
SaiQuestionBank _saiQuestionBank = SaiQuestionBank();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Text("Sai Quiz"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SaiQuizPage(),
          ),
        ),
      ),
    );
  }
}

class SaiQuizPage extends StatefulWidget {
  @override
  _SaiQuizPageState createState() => _SaiQuizPageState();
}

class _SaiQuizPageState extends State<SaiQuizPage> {
  List<Icon> scoreKeeper = [];
  int radioValue = 0;

  @override
  void initState() {
    setState(() {
      radioValue = 0;
    });
    super.initState();
  }

  Widget _CheckAns(){
    return Row( children: <Widget>[
      Expanded( child: Divider(height: 55.0, color: Colors.orangeAccent) ),
      _VButtonWidget('Check Answer', Colors.lightBlueAccent),
      Expanded(child: Divider(height: 55.0, color: Colors.orangeAccent) ),
    ]
    );
  }
  Widget _ButtonRow(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Expanded( child: Divider(height: 55.0, color: Colors.orangeAccent) ),
          _VButtonWidget('Check Answer', Colors.lightBlueAccent),
          Expanded(child: Divider(height: 55.0, color: Colors.orangeAccent) ),
          _NButtonWidget('Next Question', Colors.lightBlueAccent),
          Expanded(child: Divider(height: 55.0, color: Colors.orangeAccent) ),
        ]
    );
  }
  Widget _VButtonWidget(String btnName, Color btnClr,) {
    return RaisedButton(
      //textColor: Colors.black,
      color: btnClr,
      child: Text(
        btnName,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
      ),
      onPressed: () {
        OnhandleRVC();
      },
    );
  }
  Widget _NButtonWidget(String btnName, Color btnClr,) {
    return RaisedButton(
      color: btnClr,
      child: Text(
        btnName,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
      ),
      onPressed: () {
        MoveNext();
      },
    );
  }
  Widget _RadioWidget(int iIndex) {
    double fntSize = 18;

    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Radio<int>(
              activeColor: Colors.black,
              value: iIndex,
              groupValue: radioValue,
              onChanged: handleRVC),
          RaisedButton(
            disabledColor: Colors.white70,
            child: Text(
              _saiQuestionBank.getOptionText(iIndex).toString(),
              softWrap: true,
              style: new TextStyle(fontSize: fntSize, color: Colors.black),
            ),)
        ]);
  }

  void MoveNext()
  {
    _saiQuestionBank.nextQuestion();
    //initState();
  }
  void handleRVC(int value) {
    setState(() {
      radioValue = value;
    });
  }

  void OnhandleRVC() {
    int correctAnswer = _saiQuestionBank.getCorrectAnswerIndex();
    print('correctAnswer = $correctAnswer');
    int userPickedAnswer = radioValue;

    setState(() {
      /*   switch (radioValue)
          {
        case 0: //Answer option 1
          userPickedAnswer = 1;
          break;
        case 1: //Answer option 2
          userPickedAnswer = 2;
          break;
        case 2: //Answer option 3
          userPickedAnswer = 3;
          break;
        case 3: //Answer option 4
          userPickedAnswer = 4;
          break;
      }*/
      print('RadioValue = $radioValue');
      print('userPickedAnswer = $userPickedAnswer');
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      //_saiQuestionBank.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row( children: <Widget>[
          Expanded( child: Divider(height: 55.0, color: Colors.orangeAccent) ),
          Text(         "Question ${_saiQuestionBank.getQuestionNbr()}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Expanded(child: Divider(height: 55.0, color: Colors.orangeAccent) ),
        ]
        ),
        Container(
            child: Text(
              _saiQuestionBank.getQuestionText(),
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, color: Colors.black),
            )),
        _RadioWidget(1),
        _RadioWidget(2),
        _RadioWidget(3),
        _RadioWidget(4),
        _ButtonRow(),
        //_CheckAns(),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
