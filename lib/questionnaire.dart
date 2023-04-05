import 'package:flutter/material.dart';
import 'package:questions_app/answer_button.dart';
import 'package:questions_app/question.dart';

class Questionnaire extends StatelessWidget {
  final int selectedQuestion;
  final List<Map<String, Object>> questions;
  final void Function(int score) onAnswer;

  const Questionnaire({
    super.key,
    required this.questions,
    required this.onAnswer,
    required this.selectedQuestion,
  });

  bool get _hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  List<Map<String, Object>> getAnswers() {
    return _hasSelectedQuestion
        ? questions[selectedQuestion].cast()['answers']
            as List<Map<String, Object>>
        : [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[selectedQuestion]['question'].toString()),
        ...getAnswers()
            .map((answer) => AnswerButton(
                  answer: answer['text'] as String,
                  onPressed: () => onAnswer(answer['score'] as int),
                ))
            .toList()
      ],
    );
  }
}
