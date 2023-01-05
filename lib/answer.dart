import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String string;
  final VoidCallback answerSelected;
  const Answer(this.string, this.answerSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: answerSelected,
        textColor: Colors.white,
        child: Text(string),
      ),
    );
  }
}
