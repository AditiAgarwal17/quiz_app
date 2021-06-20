import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  var _quesIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'Q1. What is the name of a shape with 10 sides?',
      'answers': [
        {'text': 'Hexagon', 'score': -2},
        {'text': 'Pentagon', 'score': -2},
        {'text': 'Octagon ', 'score': -2},
        {'text': 'Decagon', 'score': 10},
      ],
    },
    {
      'questionText': 'Q2. How many bones are there in the human body?',
      'answers': [
        {'text': '206', 'score': 10},
        {'text': '115', 'score': -2},
        {'text': '418', 'score': -2},
        {'text': '320', 'score': -2},
      ],
    },
    {
      'questionText': 'Q3. Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': -2},
        {'text': 'Adobe', 'score': -2},
        {'text': 'Google', 'score': 10},
        {'text': 'Microsoft', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q4. There are more cells in your body than stars in the galaxy.',
      'answers': [
        {'text': 'True', 'score': 10},
        {'text': 'False', 'score': -2},
      ],
    },
    {
      'questionText': 'Q5. Which programing language is used by Flutter?',
      'answers': [
        {'text': 'Ruby', 'score': -2},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': -2},
        {'text': 'Kotlin', 'score': -2},
      ],
    },
  ];
  void _reset() {
    setState(() {
      _quesIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _quesIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          backgroundColor: Colors.purple[900],
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _quesIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questions: _questions,
                  quesIndex: _quesIndex)
              : Result(_totalScore, _reset),
        ),
      ),
    );
  }
}
