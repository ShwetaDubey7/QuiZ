import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  final String questionImage;

  const Question(this.questionText, this.questionImage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          questionText,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
        ),
        if (questionImage.isNotEmpty)
          Image.asset(questionImage),
      ],
    );
  }
}
