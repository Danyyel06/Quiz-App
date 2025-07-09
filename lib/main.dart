import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
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
  List<String> questions = [
    'The capital of Australia is Sydney.',
    'Water boils at 100 degrees Celsius at sea level.',
    'The human body has four lungs.',
    'Light travels faster than sound.',
    'Shakespeare wrote the novel "Pride and Prejudice".',
    'The chemical symbol for gold is Au.',
    'Bats are mammals.',
    'Mount Everest is the tallest mountain in the world.',
    'The Great Wall of China was built in the 20th century.',
    'Humans and dinosaurs coexisted at the same time.',
  ];

  List<bool> answers = [
    false,
    true,
    false,
    true,
    false,
    true,
    true,
    true,
    false,
    false,
  ];

  int questionNumber = 0;
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
              questions[questionNumber],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, color: Colors.white),
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
                bool correctAnswer = answers[questionNumber];
                if (correctAnswer == true) {
                  print("User got it right");
                } else {
                  print("User got it wrong");
                }
                setState(() {
                  questionNumber++;
                });
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
                bool correctAnswer = answers[questionNumber];
                if (correctAnswer == false) {
                  print("User got it right");
                } else {
                  print("User got it wrong");
                }
                setState(() {
                  questionNumber++;
                });
              },
              child: Text(
                "False",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Icon(Icons.check, color: Colors.green),
            Icon(Icons.close, color: Colors.red),
            Icon(Icons.close, color: Colors.red),
            Icon(Icons.close, color: Colors.red),
            Icon(Icons.close, color: Colors.red),
          ],
        ),
      ],
    );
  }
}
