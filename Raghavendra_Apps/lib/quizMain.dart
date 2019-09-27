import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'SaiQuestionBank.dart';

SaiQuestionBank _saiQuestionBank = SaiQuestionBank();

void main() {
  runApp(SaiQuiz());
}

class SaiQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home /  SaiQuiz"),
          backgroundColor: Colors.blue,
          centerTitle: false,
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

  String userPickedAnswer = "";

  Map userAnswers = Map();

  Widget createButtonsRow(int questionNumber) {
    bool disableCheckAnswerButton = false;
    //If user already answered the question then disable the check answer button
    if (userAnswers.containsKey(questionNumber)) {
      disableCheckAnswerButton = true;
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Expanded(child: Divider(height: 55.0, color: Colors.amberAccent)),
          createButtonWidget('Prev', Colors.lightBlueAccent,
              (questionNumber == 1) ? true : false),
          Expanded(child: Divider(height: 100.0, color: Colors.amberAccent)),
          createButtonWidget(
              'Check Answer', Colors.lightBlueAccent, disableCheckAnswerButton),
          Expanded(child: Divider(height: 100.0, color: Colors.amberAccent)),
          createButtonWidget('Next', Colors.lightBlueAccent,
              _saiQuestionBank.isLastQuestion(questionNumber) ? true : false),
          Expanded(child: Divider(height: 55.0, color: Colors.amberAccent)),
        ]);
  }

  Widget createButtonWidget(String btnName, Color btnClr, bool disableButton) {
    return RaisedButton(
      color: btnClr,
      child: Text(
        btnName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      onPressed: onPressed(disableButton, btnName),
    );
  }

  Function onPressed(bool disableButton, String btnName) {
    return !disableButton
        ? (() {
            switch (btnName) {
              case "Prev":
                movePrev();
                break;
              case "Next":
                moveNext();
                break;
              case "Check Answer":
                checkAnswer();
                break;
            }
          })
        : null;
  }

  Widget renderCircle(String optText,
      {Color boxColor = Colors.white, Color borderColor = Colors.amberAccent}) {
    return Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          color: boxColor,
          shape: BoxShape.circle,
          border: Border.all(
              color: borderColor, style: BorderStyle.solid, width: 2),
        ),
        child: Center(
          child: Text(
            optText,
            style: TextStyle(fontSize: 15, color: Colors.amberAccent),
          ),
        ));
  }

  Widget renderOptionRow(int index, String optText) {
    double fntSize = 18;

    return GestureDetector(
      onTap: () {
        setState(() {
          print("option tapped $index");

          if (userAnswers.containsKey(_saiQuestionBank.getQuestionNumber())) {
            userPickedAnswer = "";
          } else {
            userPickedAnswer = optText;
          }
        });
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            renderCircle(optText),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
              child: Text(
                _saiQuestionBank.getOptionText(index),
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(fontSize: fntSize, color: Colors.black),
              ),
            )
          ]),
    );
  }

  Widget renderQuestionHeader(int iIndex) {
    return Row(children: <Widget>[
      Expanded(child: Divider(height: 100.0, color: Colors.amberAccent)),
      Text(
        "Question ",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      CircleAvatar(
          backgroundColor: Colors.amberAccent,
          foregroundColor: Colors.redAccent,
          child: Text(
            "$iIndex",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          )),
      Expanded(child: Divider(height: 100.0, color: Colors.amberAccent)),
    ]);
  }

  Widget renderQuestion(String question) {
    return Container(
        child: Text(
      question,
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: 20, color: Colors.black),
    ));
  }

  void moveNext() {
    setState(() {
      _saiQuestionBank.nextQuestion();
    });

    //initState();
  }

  void movePrev() {
    setState(() {
      _saiQuestionBank.prevQuestion();
    });
  }

  void checkAnswer() {
    print('userPickedAnswer $userPickedAnswer');

    if (userPickedAnswer.isNotEmpty) {
/*      if (userAnswers.containsKey(_saiQuestionBank.getQuestionNbr())) {
        showSnackBar("you are not allowed to answer more than once!");
        return;
      }*/
      String correctAnswer = _saiQuestionBank.getCorrectAnswer();
      print('correctAnswer is  = $correctAnswer');

      setState(() {
        print('userPickedAnswer = $userPickedAnswer');
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check_circle,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.highlight_off,
            color: Colors.red,
          ));
        }

/*        if (scoreKeeper.length == _saiQuestionBank.getQuestionBank().length) {
          scoreKeeper = [];
        }*/

        userAnswers[_saiQuestionBank.getQuestionNumber()] = userPickedAnswer;
        print(
            " question number : ${_saiQuestionBank.getQuestionNumber()} , user answer : ${userPickedAnswer}");
        userPickedAnswer = "";
        //moveNext();
      });
    } else {
      print("used didn't picked any option ");
      showSnackBar("pick any one option!");
      /*AlertDialog(
        content: Text("Please pic one option "),*/
    }
  }

  void showSnackBar(String text) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    int questionNumber;
    questionNumber = _saiQuestionBank.getQuestionNumber();
    return ListView(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        renderQuestionHeader(questionNumber),
        renderQuestion(_saiQuestionBank.getQuestionText()),
        SizedBox(
          height: 20,
        ),
        renderOptionRow(1, 'A'),
        SizedBox(
          height: 20,
        ),
        renderOptionRow(2, 'B'),
        SizedBox(
          height: 20,
        ),
        renderOptionRow(3, 'C'),
        SizedBox(
          height: 20,
        ),
        renderOptionRow(4, 'D'),
        SizedBox(
          height: 20,
        ),
        createButtonsRow(questionNumber),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
