import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int quesIndex;
  Quiz(
      {@required this.answerQuestion,
      @required this.questions,
      @required this.quesIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[quesIndex]['questionText']),
        ...(questions[quesIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
