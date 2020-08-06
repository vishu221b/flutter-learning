import 'package:flutter/material.dart';

class FinalResult extends StatelessWidget {
  final int finalResultScore;
  final Function resetQuizCallback;

  FinalResult({this.finalResultScore, this.resetQuizCallback});

  String get finalResultString {
    String _personalityTrait;

    if (finalResultScore > 150) {
      _personalityTrait = 'Rajni Sirr!!';
    } else if (finalResultScore > 100) {
      _personalityTrait = 'Anna superuh!';
    } else if (finalResultScore > 50) {
      _personalityTrait = 'Superhero aa?';
    } else if (finalResultScore > 20) {
      _personalityTrait = 'Ok Ok aa.';
    }
    return 'Your Score: ' +
        finalResultScore.toString() +
        '\n' +
        'Your trait: ' +
        _personalityTrait;
  }

  @override
  Widget build(BuildContext buildcontext) {
    return Container(
      child: Center(
        child: Column(children: <Widget>[
          Text(
            finalResultString,
            softWrap: true,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Reset Progress'),
            onPressed: resetQuizCallback,
          ),
        ]),
      ),margin: EdgeInsets.only(top: 200.0),
    );
  }
}
