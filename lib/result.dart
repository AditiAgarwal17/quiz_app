import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function reset;
  Result(this.resultScore, this.reset);
  String get resultPhrase {
    var feedback;
    if (resultScore < 10) {
      feedback = "Better Luck next Time!!";
    } else if (resultScore > 10 && resultScore <= 30) {
      feedback = "You can do Better!!";
    } else {
      feedback = "Well Done!!";
    }

    return feedback;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.center,
          ),
          //Text
          Text(
            'Score : ' '$resultScore' + "\n",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          OutlineButton(
            borderSide: BorderSide(color: Colors.purple[900]),
            child: Text(
              'Restart Quiz!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            textColor: Colors.purple[900],
            onPressed: reset,
          ),
        ],
      ),
    );
  }
}
