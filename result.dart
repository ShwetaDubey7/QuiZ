import 'package:flutter/material.dart';

class QuizResult extends StatelessWidget {
  final int totalScore;

  const QuizResult(this.totalScore, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your Score: $totalScore',
              style: const TextStyle(fontSize: 24),
            ),
            // Additional widgets can be added here based on your UI requirements
          ],
        ),
      ),
    );
  }
}
