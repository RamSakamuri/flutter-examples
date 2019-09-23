import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


SaiQuestionBank _saiQuestionBank = SaiQuestionBank();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Text("Home /  SaiQuiz"),
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
      Expanded( child: Divider(height: 100.0, color: Colors.amberAccent) ),
      _VButtonWidget('CHECK ANSWER', Colors.lightBlueAccent),
      Expanded(child: Divider(height: 100.0, color: Colors.amberAccent) ),
    ]
    );
  }
  Widget _ButtonRow(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Expanded( child: Divider(height: 55.0, color: Colors.amberAccent) ),
          _VButtonWidget('Check Answer', Colors.lightBlueAccent),
          Expanded(child: Divider(height: 55.0, color: Colors.amberAccent) ),
          _NButtonWidget('Next Question', Colors.lightBlueAccent),
          Expanded(child: Divider(height: 55.0, color: Colors.amberAccent) ),
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
          color: Colors.white,
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
  Widget renderCircle(String OptText) {
    return Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.amberAccent, style: BorderStyle.solid, width: 2),
        ),
        child: new Center(
          child: Text(
            OptText,
            style: TextStyle(fontSize: 15, color: Colors.amberAccent),
          ),
        )
    );
  }

  Widget _RadioWidget(int iIndex, String OptText) {
    double fntSize = 18;

    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          renderCircle(OptText),
          
          Flexible(
            child: RaisedButton(
              disabledColor: Colors.white,
              onPressed: (){handleRVC(iIndex);},
              child: Text(
                _saiQuestionBank.getOptionText(iIndex).toString(),
                softWrap: true,
                style: new TextStyle(fontSize: fntSize, color: Colors.black),
              ),
            ),
          )
        ]);
  }

  Widget _QstHeader(int iIndex ) {
    return Row( children: <Widget>[
      Expanded( child: Divider(height: 100.0, color: Colors.amberAccent) ),
      Text("Question ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      CircleAvatar( backgroundColor: Colors.amberAccent,
          foregroundColor: Colors.redAccent,
        child: Text("$iIndex", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white70),)),
      Expanded(child: Divider(height: 100.0, color: Colors.amberAccent) ),
    ]
    );
  }

  Widget _Question(String strQues) {
    return Container(
        child: Text( strQues,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ));
  }
  void MoveNext()  {
    _saiQuestionBank.nextQuestion();
    //initState();
  }

  void handleRVC(int value) {
    setState(() {
      radioValue = value;
    });
   }

  void OnhandleRVC() {
    MoveNext();
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
    int i;
    i=_saiQuestionBank.getQuestionNbr();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _QstHeader(i),
        _Question(_saiQuestionBank.getQuestionText()),
        _RadioWidget(1, 'A'),
        _RadioWidget(2, 'B'),
        _RadioWidget(3, 'C'),
        _RadioWidget(4, 'D'),
        //_ButtonRow(),
        _CheckAns(),
        Row( children: scoreKeeper, )
      ],
    );
  }
}


class SaiQuestionBank{
  int _quesNo = 0;
  List<SaiQuestion> _sqB = [
    SaiQuestion('Which leela inspired Hemadpanth to write Sri Sai Satcharitra?'
        , new AnsOption('Baba Sleeping on a plank, Baba Sleeping on a plank, Baba Sleeping on a plank', false)
        , new AnsOption('Grinding Wheat', true)
        , new AnsOption('Lamps leela', false)
        , new AnsOption('Baba returning from Samadhi. Baba returning from Samadhi. Baba returning from Samadhi', false)
        , 'SSC - Chapter 1'
    ),
    SaiQuestion('Who is the devotee in the context to whom Sri SaiBaba shouted \"Do not climb up, vile priest! Don\'t you dare to climb! Get out! Get down!'
        , new AnsOption('Shyama', true)
        , new AnsOption('Amir Shakkar', false)
        , new AnsOption('Dasaganu Maharaj', false)
        , new AnsOption('Nanasaheb Chandorkar', false)
        , 'SSC - Chapter 1'
    ),
    SaiQuestion('Who drank only the water came from Baba\'s channel after had his bath or washed his hands and feet?'
        , new AnsOption('Balaji Patil Nevaskar', true)
        , new AnsOption('Kondya', false)
        , new AnsOption('Bhagoji Shinde', false)
        , new AnsOption('Raghu Patel', false)
        , 'SSC - Chapter 12'
    ),
    SaiQuestion('To whom did Sri Sai Baba say the following words? - \"Yesterday I had a severe bout of coughing. Could this be the result of an evil eye?'
        , new AnsOption('Lala Lakshmichand', false)
        , new AnsOption('Bapusaheb Jog', false)
        , new AnsOption('Shama', true)
        , new AnsOption('Megha', false)
        , 'SSC - Chapter 28'
    ),
    SaiQuestion('Identify the temple which Kakaji Vaidya was priest?'
        , new AnsOption('Maruti', false)
        , new AnsOption('Saptashringi', true)
        , new AnsOption('Vaishnavi Devi', false)
        , new AnsOption('None of the above', false)
        , 'SSC - Chapter 29'
    ),
  ];

  void nextQuestion() {
    if (_quesNo < _sqB.length - 1) {
      _quesNo++;
    }
    else {
      _quesNo=0;
    }
    print(_quesNo);
  }

  int getQuestionNbr() {
    return _quesNo+1;
  }

  String getQuestionText() {
    return _sqB[_quesNo].questionText;
  }

  String getOptionText(int Index)
  {
    switch(Index) {
      case 1:
        {
          return _sqB[_quesNo].a1.answerText;
          break;
        }
      case 2:
        {
          return _sqB[_quesNo].a2.answerText;
          break;
        }
      case 3:
        {
          return _sqB[_quesNo].a3.answerText;
          break;
        }
      case 4:
        {
          return _sqB[_quesNo].a4.answerText;
          break;
        }
    }
  }

  int getCorrectAnswerIndex() {
    int Res;
    if (_sqB[_quesNo].a1.Iscorrect){ Res= 1;}
    if (_sqB[_quesNo].a2.Iscorrect){ Res= 2;}
    if (_sqB[_quesNo].a3.Iscorrect){ Res= 3;}
    if (_sqB[_quesNo].a4.Iscorrect){ Res= 4;}
    return Res;
  }
}


class AnsOption{
  String answerText;
  bool Iscorrect;
  AnsOption(String c_answerText, bool c_Iscorrect)
  {
    answerText = c_answerText;
    Iscorrect = c_Iscorrect;
  }
}

class SaiQuestion {
  String questionText;
  String source;
  AnsOption a1;
  AnsOption a2;
  AnsOption a3;
  AnsOption a4;

  SaiQuestion(String c_questionText, AnsOption c_a1, AnsOption c_a2,AnsOption c_a3,AnsOption c_a4,String c_source)
  {
    questionText= c_questionText;
    a1 = c_a1;
    a2 = c_a2;
    a3 = c_a3;
    a4 = c_a4;
    source = c_source;
  }
}
