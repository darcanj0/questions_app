// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import './question.dart';

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
    final List<String> questions = [
      "What's your favourite color?",
      "What's your favourite animal?"
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Questions App'),
        ),
        body: Column(children: [
          Question(questions.elementAt(_selectedQuestion)),
          OutlinedButton(
              onPressed: _answerQuestion, child: const Text('Answer 1')),
          OutlinedButton(
              onPressed: _answerQuestion, child: const Text('Answer 2')),
          OutlinedButton(
              onPressed: _answerQuestion, child: const Text('Answer 3'))
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
