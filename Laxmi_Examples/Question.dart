

class Question {
  String questionText;
  bool questionAnswer;

  Question(String q, bool a) {
    questionText = q;
    questionAnswer = a;
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
