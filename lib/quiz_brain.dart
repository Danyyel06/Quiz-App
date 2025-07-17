import 'package:quizzlerapp/questions.dart';

class QuizBrain {
  List<Question> _allQuestions = [
    Question('The capital of Australia is Sydney.', false),
    Question('Water boils at 100 degrees Celsius at sea level.', true),
    Question('The human body has four lungs.', false),
    Question('Light travels faster than sound.', true),
    Question('Shakespeare wrote the novel "Pride and Prejudice".', false),
    Question('The chemical symbol for gold is Au.', true),
    Question('Bats are mammals.', true),
    Question('Mount Everest is the tallest mountain in the world.', true),
    Question('The Great Wall of China was built in the 20th century.', false),
    Question('Humans and dinosaurs coexisted at the same time.', false),
  ];

  String getQuestionString(int questionNumber) {
    return _allQuestions[questionNumber].questionText;
  }

  bool getAnswersQuestion(int questionNumber) {
    return _allQuestions[questionNumber].questionAnswer;
  }
}
