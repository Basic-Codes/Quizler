import 'question.dart';

class QuizController {
  int curr_index = 0;

  final List<Question> _questions = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(q: 'I am sick.', a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'My name is Altair', a: false),
    Question(q: 'One Piece is the best shonen manga', a: true),
    Question(q: 'Berserk is not the best seinen manga', a: false),
    Question(q: 'Danny is not danny', a: false),
    Question(q: 'Michaels is the best M***', a: true),
  ];

  String getQues() {
    return _questions[curr_index].questionText;
  }

  bool getAns() {
    return _questions[curr_index].questionAnswer;
  }

  bool nextQues() {
    if (curr_index < _questions.length - 1) {
      curr_index++;
      return true;
    }
    return false;
  }
}
