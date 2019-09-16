import 'package:flutter/material.dart';

//TODO: Step 2 - Import the rFlutter_Alert package here.
import 'package:rflutter_alert/rflutter_alert.dart';
import './ui/Question_bank.dart';

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

  Widget _RadioWidget(int iIndex) {
    double fntSize = 18;
    //if(iIndex == 4) {fntSize = 16;};
/*
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          height.toString(),
          style: kNumberTextStyle,
        ),
        Text(
          'cm',
          style: kLabelTextStyle,
        ),
      ],
    ),
*/

    const kNumberTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));

    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Radio<int>(
              activeColor: Colors.black,
              value: iIndex,
              groupValue: radioValue,
              onChanged: handleRVC),
          FlatButton(
          child: Text(
            _saiQuestionBank.getOptionText(iIndex).toString(),
            style: kNumberTextStyle,
            softWrap: true,
            //style: new TextStyle(fontSize: fntSize, color: Colors.black),
          ),)
        ]);
  }

  void MoveNext()
  {
    _saiQuestionBank.nextQuestion();
  }
  void handleRVC(int value) {
    radioValue = value;
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
            Container(
                //decoration: new BoxDecoration(
                  //border: new Border.all(color: Colors.blueAccent, width: 2),
                //),
                child: Text(
                  _saiQuestionBank.getQuestionText(),
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25, color: Colors.black),
                )),
        _RadioWidget(1),
        _RadioWidget(2),
        _RadioWidget(3),
        _RadioWidget(4),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  textColor: Colors.black,
                  color: Colors.blueAccent,
                  child: Text(
                    'Verify Ans',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    //The user picked true.
                    OnhandleRVC();
                  },
                ),
                FlatButton(
                  textColor: Colors.black,
                  color: Colors.blueAccent,
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    //The user picked true.
                    MoveNext();
                  },
                ),
              ],
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
