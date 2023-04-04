// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'question.dart';
import 'answer_button.dart';

void main(List<String> args) {
  runApp(QuestionsApp(
    key: GlobalKey(debugLabel: 'main key'),
  ));
}

class _QuestionsAppState extends State<QuestionsApp> {
  int _selectedQuestion = 0;

  void _answerQuestion() {
    print('Question answered');
    setState(() {
      _selectedQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> questions = [
      {
        "question": "What's your favourite color?",
        "answers": ["Blue", "Yellow", "Red", "Pink", "Black"]
      },
      {
        "question": "What's your favourite animal?",
        "answers": ["Camel", "Horse", "Morse", "Cat", "Dog"],
      },
      {
        "question": "What's your favourite programming language?",
        "answers": ["C#", "Java", "Javascript", "Dart", "C++"]
      }
    ];

    getAnswers() {
      return questions[_selectedQuestion].cast()['answers'] as List<String>;
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Questions App'),
        ),
        body: Column(children: [
          Question(questions[_selectedQuestion]['question'].toString()),
          ...(getAnswers().map((answer) => AnswerButton(answer, _answerQuestion)))
        ]),
      ),
    );
  }
}

class QuestionsApp extends StatefulWidget {
  const QuestionsApp({super.key});

  @override
  _QuestionsAppState createState() {
    return _QuestionsAppState();
  }
}
