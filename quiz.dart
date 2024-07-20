import 'package:flutter/material.dart';
import 'answer.dart'; // Assuming Answer widget is defined in 'answer.dart'
import 'question.dart'; // Assuming Question widget is defined in 'question.dart'

class Quiz extends StatelessWidget {
  final Function(int) answerQuestion;
  final int questionIndex;
  final List<Map<String, Object>> questions;

// Below code is a constructor, now what is constructor? answer is special type of function called to create an object.
  const Quiz({
    super.key,
    required this.answerQuestion,
    required this.questionIndex,
    required this.questions,
  }); // Use Key? key instead of super.key in constructor

  @override
  Widget build(BuildContext context) {
    if(questionIndex >= 0 && questionIndex < questions.length) {
      String questionText = questions[questionIndex]['questionText']?.toString() ?? '';
      String questionImage = questions[questionIndex]['questionImage']?.toString() ?? '';

    return Column(
      children: <Widget>[
        Question( // Fix: Added () after toString
          questionText,
          questionImage,
          key: ValueKey('question-$questionIndex'),
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) => Answer(
                  answer['text']?.toString() ?? '',
                  () => answerQuestion(answer['score'] as int),
                  key: ValueKey('answer-${answer['text']}'),
               )),// Added .toList() to ensure correct mapping
      ],
    );
  } else {
    return const Text('Invalid question index');
  }
 }
}

