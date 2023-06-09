import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question(this.template, {super.key});

  final String template;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      child: Text(
        template,
        style: const TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }
}
