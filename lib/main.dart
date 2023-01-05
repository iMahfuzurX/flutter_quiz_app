import 'package:flutter/material.dart';
import 'package:test_app/quiz.dart';
import 'package:test_app/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Yellow', 'score': 3},
        {'text': 'Green', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Ant', 'score': 10},
        {'text': 'Lion', 'score': 6},
        {'text': 'Tiger', 'score': 3},
        {'text': 'Bear', 'score': 2}
      ]
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answers': [
        {'text': 'Angela Yu', 'score': 10},
        {'text': 'Maxmillian', 'score': 6},
        {'text': 'Mosh Hamedani', 'score': 4},
        {'text': 'GoogleDevs', 'score': 1}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  void _restartQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
                questions: _questions)
            : Result(
                score: _totalScore,
                resetQuiz: _restartQuiz,
              ),
      ),
    );
  }
}
