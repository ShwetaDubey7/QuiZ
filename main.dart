import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  //final _QuizState state = _QuizState();
  const Quiz({super.key});

  @override
  State <Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': -2},
        {'text': 'Adobe', 'score': -2},
        {'text': 'Google', 'score': 10},
        {'text': 'Microsoft', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. What is Flutter?',
      'answers': [
        {'text': 'Android Development Kit', 'score': -2},
        {'text': 'IOS Development Kit', 'score': -2},
        {'text': 'Web Development Kit', 'score': -2},
        {
          'text': 'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
          'score': 10,
        },
      ],
    },
    {
      'questionText': 'Q3. Which programming language is used by Flutter?',
      'answers': [
        {'text': 'Ruby', 'score': -2},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': -2},
        {'text': 'Kotlin', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. What language is Dart written in?',
      'answers': [
        {'text': 'C++', 'score': 10},
        {'text': 'C', 'score': -2},
        {'text': 'C#', 'score': -2},
        {'text': 'Java', 'score': -2},
      ],
    },
    {
      'questionText': 'Q5. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {'text': 'Yes', 'score': -2},
        {'text': 'No', 'score': 10},
      ],
    },
  ];


  int _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
         child: Text('QuiZ',
         style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold))
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(92.0),
        child: _questionIndex < _questions.length
            ? QuizPage(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : result(_totalScore, _resetQuiz),
      ),
    );
  }

  Widget result(int totalScore, VoidCallback resetQuiz) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Quiz Completed!',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          Text(
            'Your Score: $totalScore',
            style: const TextStyle(fontSize: 30.0),
          ),
          TextButton(onPressed: resetQuiz,
            child: const Text('Restart Quiz',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w300),
          ),
          ),
        ],
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const QuizPage({super.key,
    required this.questions,
    required this.questionIndex,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          questions[questionIndex]['questionText'] as String,
          style: const TextStyle(fontSize: 22.0),
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return ElevatedButton(
            onPressed: () => answerQuestion(answer['score'] as int),
            child: Text(answer['text'] as String),
          );
        }),
      ],
    );
  }
}
