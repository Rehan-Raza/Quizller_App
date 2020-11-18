import 'question.dart';
class QuizBrain {
   int _questionNo = 0;
   List<Question> _questionBank = [
    Question(q: 'You can lead a cow down stairs but not upstairs.', a: false),
    Question(q: 'Approximate one quarter of human bones are in feet.', a: true),
    Question(q: 'A slug\s blood is green.', a: true)
  ];

  void next(){
    if (_questionNo < _questionBank.length - 1)
    _questionNo++;
  }

  String getQuestionText(){
    return _questionBank[_questionNo].questionText;
}

  bool getCorrectAnswer(){
    return _questionBank[_questionNo].questionAnswer;
  }
}