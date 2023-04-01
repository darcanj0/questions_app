// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(QuestionsApp(key: GlobalKey(debugLabel: 'main key'),));
}

class QuestionsApp extends StatelessWidget {
  const QuestionsApp({super.key});

  void answerQuestion() {
    print('Question answered');
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
        body: Column(
          children: [
            Text(questions.elementAt(0)),
            OutlinedButton(onPressed: answerQuestion, child: const Text('Answer 1')),
            OutlinedButton(onPressed: answerQuestion, child: const Text('Answer 2')),
            OutlinedButton(onPressed: answerQuestion, child: const Text('Answer 3'))
          ]
        ),
      ),
    );
  }
}
