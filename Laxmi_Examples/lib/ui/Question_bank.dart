import 'Question.dart';

class SaiQuestionBank{
  int _quesNo = 0;
  List<SaiQuestion> _sqB = [
    SaiQuestion('Which leela inspired Hemadpanth to write Sri Sai Satcharitra?'
          , new AnsOption('Baba Sleeping on a plank', false)
        , new AnsOption('Grinding Wheat', true)
        , new AnsOption('Lamps leela', false)
        , new AnsOption('Baba returning from Samadhi', false)
        , 'SSC - Chapter 1'
    ),
    SaiQuestion('Who is the devotee in the context to whom Sri SaiBaba shouted \"Do not climb up, vile priest! Don\'t you dare to climb! Get out! Get down!'
        , new AnsOption('Shyama', true)
        , new AnsOption('Grinding Amir Shakkar', false)
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

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  //TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }
}
