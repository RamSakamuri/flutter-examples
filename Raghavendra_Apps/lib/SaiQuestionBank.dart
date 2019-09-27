import 'SaiQuestion.dart';

class SaiQuestionBank {
  int _questionNumber = 0;
  List<SaiQuestion> questionBank = [
    SaiQuestion(
        'Which leela inspired Hemadpanth to write Sri Sai Satcharitra?',
        OptionText(
            'Baba Sleeping on a plank, Baba Sleeping on a plank, Baba Sleeping on a plank',
            false),
        OptionText('Grinding Wheat', true),
        OptionText('Lamps leela', false),
        OptionText(
            'Baba returning from Samadhi. Baba returning from Samadhi. Baba returning from Samadhi Baba returning from Samadhi. Baba returning from Samadhi. Baba returning from Samadhi Baba returning from Samadhi. Baba returning from Samadhi. Baba returning from Samadhi',
            false),
        'SSC - Chapter 1'),
    SaiQuestion(
        'Who is the devotee in the context to whom Sri SaiBaba shouted \"Do not climb up, vile priest! Don\'t you dare to climb! Get out! Get down! Who is the devotee in the context to whom Sri SaiBaba shoutedWho is the devotee in the context to whom Sri SaiBaba shoutedWho is the devotee in the context to whom Sri SaiBaba shoutedWho is the devotee in the context to whom Sri SaiBaba shoutedWho is the devotee in the context to whom Sri SaiBaba shoutedWho is the devotee in the context to whom Sri SaiBaba shoutedWho is the devotee in the context to whom Sri SaiBaba shoutedWho is the devotee in the c Sri SaiBaba shoutedWho is the devotee in the context to whom Sri SaiBaba shoutedWho is the devotee in the context to whom Sri SaiBaba shoutedWho is the devotee in the context to whom Sri SaiBaba shoutedWho is the devotee in the context to whom Sri SaiBaba shoutedWho is the devotee in the context to whom Sri SaiBaba shouted',
        OptionText('Shyama', true),
        OptionText('Amir Shakkar', false),
        OptionText('Dasaganu Maharaj', false),
        OptionText('Nanasaheb Chandorkar', false),
        'SSC - Chapter 1'),
    SaiQuestion(
        'Who drank only the water came from Baba\'s channel after had his bath or washed his hands and feet?',
        OptionText('Balaji Patil Nevaskar', true),
        OptionText('Kondya', false),
        OptionText('Bhagoji Shinde', false),
        OptionText('Raghu Patel', false),
        'SSC - Chapter 12'),
    SaiQuestion(
        'To whom did Sri Sai Baba say the following words? - \"Yesterday I had a severe bout of coughing. Could this be the result of an evil eye?',
        OptionText('Lala Lakshmichand', false),
        OptionText('Bapusaheb Jog', false),
        OptionText('Shama', true),
        OptionText('Megha', false),
        'SSC - Chapter 28'),
    SaiQuestion(
        'Identify the temple which Kakaji Vaidya was priest?',
        OptionText('Maruti', false),
        OptionText('Saptashringi', true),
        OptionText('Vaishnavi Devi', false),
        OptionText('None of the above', false),
        'SSC - Chapter 29'),
  ];

  void nextQuestion() {
    if (_questionNumber < questionBank.length - 1) {
      _questionNumber++;
    } else {
      _questionNumber = 0;
    }
    print('question number $_questionNumber');
  }

  void prevQuestion() {
    if (_questionNumber >= 1) {
      --_questionNumber;
    }
    print('question number $_questionNumber');
  }

  int getQuestionNumber() {
    return _questionNumber + 1;
  }

  bool isLastQuestion(int questionNumber) {

   return (questionNumber == questionBank.length);
  }

  String getQuestionText() {
    return questionBank[_questionNumber].questionText;
  }

  String getOptionText(int index) {
    String optionText = "";
    switch (index) {
      case 1:
        {
          optionText = questionBank[_questionNumber].option1.optionText;
          break;
        }
      case 2:
        {
          optionText = questionBank[_questionNumber].option2.optionText;
          break;
        }
      case 3:
        {
          optionText = questionBank[_questionNumber].option3.optionText;
          break;
        }
      case 4:
        {
          optionText = questionBank[_questionNumber].option4.optionText;
          break;
        }
    }
    return optionText;
  }


  String getCorrectAnswer() {
    String answer;
    if (questionBank[_questionNumber].option1.isCorrect) {
      answer = 'A';
    }
    if (questionBank[_questionNumber].option2.isCorrect) {
      answer = 'B';
    }
    if (questionBank[_questionNumber].option3.isCorrect) {
      answer = 'C';
    }
    if (questionBank[_questionNumber].option4.isCorrect) {
      answer = 'D';
    }
    return answer;
  }

  List<SaiQuestion> getQuestionBank(){
    return questionBank;
  }
}