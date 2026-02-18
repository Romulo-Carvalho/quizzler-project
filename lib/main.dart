import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(child: QuizPage()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  int finalScore = 0;
  int finalSize = 0;

  void checkAnswer(bool userPikedAnswer) {
    bool corretAnswer = quizBrain.getCorrectAnswer();

    setState(() {

      if (userPikedAnswer == corretAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        finalScore++;
        finalSize++;
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        finalSize++;
      }

      if (quizBrain.isFinished() == true) {
        Alert(
          style: AlertStyle(
            backgroundColor: Color(0xff1e1e2e),
            titleStyle: TextStyle(color: Color(0xfff1f5f9)),
            descStyle: TextStyle(color: Color(0xfff1f5f9)),
          ),
          context: context,
          type: AlertType.none,
          title: "Fim do quiz!",
          desc:
              "Parabéns! \n Sua pontuação foi: \n $finalScore/$finalSize",
          buttons: [
            DialogButton(
              color: Color(0xff8b5cf6),
              onPressed: () {
                setState(() {
                  quizBrain.reset();
                  scoreKeeper.clear();
                  finalScore = 0;
                  finalSize = 0;
                });
                Navigator.pop(context);
              },
              width: 120,
              child: Text(
                "Reiniciar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ).show();
      }

      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [Color(0xff2d0b31), Color(0xff1a0a20)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text(
                  'True',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Wrap(children: scoreKeeper),
        ],
      ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
