// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:questions_app/questionnaire.dart';
import 'result.dart';

void main(List<String> args) {
  runApp(QuestionsApp(
    key: GlobalKey(debugLabel: 'main key'),
  ));
}

class _QuestionsAppState extends State<QuestionsApp> {
  int selectedQuestion = 0;
  int totalScore = 0;

  bool get _hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  void onAnswer(int score) {
    print('Question answered');
    if (_hasSelectedQuestion) {
      setState(() {
        selectedQuestion++;
        totalScore += score;
      });
    }
  }

  void finishQuestionnaire() {
    setState(() {
      selectedQuestion = 0;
      totalScore = 0;
    });
  }

  final List<Map<String, Object>> questions = const [
    {
      "question": "What's your favourite color?",
      "answers": [
        {"text": "Blue", "score": 6},
        {"text": "Yellow", "score": 8},
        {"text": "Red", "score": 4},
        {"text": "Pink", "score": 1},
        {"text": "Black", "score": 10}
      ]
    },
    {
      "question": "What's your favourite animal?",
      "answers": [
        {"text": "Camel", "score": 10},
        {"text": "Horse", "score": 7},
        {"text": "Morse", "score": 8},
        {"text": "Cat", "score": 9},
        {"text": "Dog", "score": 7}
      ],
    },
    {
      "question": "What's your favourite programming language?",
      "answers": [
        {"text": "C#", "score": 7},
        {"text": "Java", "score": 8},
        {"text": "Javascript", "score": 10},
        {"text": "Dart", "score": 8},
        {"text": "C++", "score": 6},
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Questions App'),
        ),
        body: _hasSelectedQuestion
            ? Questionnaire(
                questions: questions,
                selectedQuestion: selectedQuestion,
                onAnswer: onAnswer,
              )
            : Result(
                totalScore: totalScore,
                onFinishQuestionnaire: finishQuestionnaire,
              ),
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
