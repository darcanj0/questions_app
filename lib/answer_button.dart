import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this._answer, this._onPressed, {super.key});
  final String _answer;
  final void Function() _onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _onPressed,
      child: Text(_answer),
    );
  }
}
