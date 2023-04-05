import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(
      {super.key,
      required this.totalScore,
      required this.onFinishQuestionnaire}) {
    if (totalScore >= 8) {
      text = const Text(
        "Congrats!!",
        style: TextStyle(fontSize: 28),
      );
    } else if (6 < totalScore && totalScore < 8) {
      text = const Text(
        "You did well!",
        style: TextStyle(fontSize: 28),
      );
    } else {
      text = const Text(
        "You need to study more...",
        style: TextStyle(fontSize: 28),
      );
    }
  }

  final int totalScore;
  final void Function() onFinishQuestionnaire;
  late Text text;

  Text getText() {
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: text),
        FilledButton(
          onPressed: onFinishQuestionnaire,
          child: const Text('Restart Questionnaire'),
        )
      ],
    );
  }
}
