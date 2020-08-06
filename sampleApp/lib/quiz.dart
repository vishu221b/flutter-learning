import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget{
  final int questionIndex;
  final List<Map<String, Object>> questionAnswers;
  final Function onButtonPressCallback;

  Quiz({this.questionIndex, this.questionAnswers, this.onButtonPressCallback});

  @override
  Widget build(BuildContext buildContext){
    return Column(
                children: <Widget>[
                  Question(questionAnswers[questionIndex]['question']),
                  ...(questionAnswers[questionIndex]['answer'] as List<Map<String, Object>>)
                      .map((answer) => Answer(
                          buttonText: answer['text'],
                          questionIndexHandler: () => onButtonPressCallback(answer['score'])))
                      .toList(), //toList converts/collects the above output into a List, ... is spread operator which takes values inside of this list and spreads it all across
                ],
              );
  }
}
