import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';


void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}
QuizBrain newQuizBrain = QuizBrain();
class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  // List<String> questions = [
  // 'You can lead a cow down stairs but not upstairs.',
  //'Approximate one quarter of human bones are in feet.',
  //'A slug\s blood is green.',
  //];
  
  //List<bool> answers = [false, true, true];

//Question q1 = Question(q:'You can lead a cow down stairs but not upstairs.', a: false);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                newQuizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer = newQuizBrain.getCorrectAnswer();
                if (correctAnswer == true) {
                  print('right');
                } else {
                  print('wrong!');
                }
                setState(
                  () {
                   newQuizBrain.next();
                    scoreKeeper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  },
                );
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer = newQuizBrain.getCorrectAnswer();
                if (correctAnswer == false) {
                  print('right');
                } else {
                  print('wrong!');
                }
                setState(
                  () {
                    newQuizBrain.next();
                    scoreKeeper.add(Icon(
                      Icons.notifications_paused,
                    ));
                  },
                );

                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ), //TODo: Add a Row here as your score keeper
      ],
    );
  }
}
