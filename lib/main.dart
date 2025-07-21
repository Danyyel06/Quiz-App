import 'package:flutter/material.dart';
import 'package:quizzlerapp/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizApp(),
          ),
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> scoreKeeper = [];

  void answerChecker(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getAnswersQuestion();
    if (userPickedAnswer == correctAnswer) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
    } else {
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    }
    setState(() {
      quizBrain.nextQuestion();
      if (quizBrain.isFinished()) {
        Alert(
          context: context,

          title: "Finished",
          style: AlertStyle(
            titleStyle: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          desc: "You've reached the end of the quiz.",
          buttons: [
            DialogButton(
              child: Text(
                "CANCEL",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Colors.blueAccent,
              width: 120,
            ),
          ],
        ).show();

        quizBrain = QuizBrain();
        scoreKeeper = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Center(
            child: Text(
              quizBrain.getQuestionString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, color: Colors.black),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                answerChecker(true);
              },
              child: Text(
                "True",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                answerChecker(false);
              },
              child: Text(
                "False",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Row(children: scoreKeeper),
      ],
    );
  }
}
