class OptionText {
  String optionText;
  bool isCorrect;

  OptionText(this.optionText, this.isCorrect);
}

class SaiQuestion {
  String questionText;
  OptionText option1;
  OptionText option2;
  OptionText option3;
  OptionText option4;
  String source;

  //String answer;
  //int userSelectedOption;

  SaiQuestion(this.questionText, this.option1, this.option2, this.option3,
      this.option4, this.source);
}
