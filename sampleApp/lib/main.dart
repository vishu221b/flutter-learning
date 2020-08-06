import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  // main is the function which is automatically executed on the app's start
  runApp(MySampleApp());
}

class DummyApp {
  int age;
  String name;

  DummyApp({@required int age, String name = 'Vaza'}) {
    //Constructor, wrapping parameters in { } males them optional - name is assigned default value and age is a required field
    this.age = age;
    this.name = name;
  }

  /**
   * Usage-
   * DummyApp(name: 'Lolza', age: 30)
   */
}

/*
 * For building stateful app, state must be separated from the stateful widegets, why?
 * Because on state change the Widget(stateful) will be re-rendered,
 * so if both are attached and get re-rendered then the variable value will be set to initial (for example 0 when initialized for a loop or something)
 * So to maintain the Internal STATE of the App, States are separated from the widgets in case of the Stateful widgets
 */

class MySampleApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySampleAppState();
  }
}

class MySampleAppState extends State<MySampleApp> {
  var _questionIndex = 0;
  var _finalScore = 0;

  final questions = const [
    {
      'question': 'What is your favourite Food?',
      'answer': [
        {'text': 'Sushi', 'score': 12},
        {'text': 'Makhan', 'score': 11},
        {'text': 'Burger', 'score': 13},
        {'text': 'Pizza', 'score': 52}
      ]
    },
    {
      'question': 'What is your favourite Animal?',
      'answer': [
        {'text': 'Lion', 'score': 62},
        {'text': 'Snake', 'score': 82},
        {'text': 'Gorilla', 'score': 32},
        {'text': 'Monkey', 'score': 22}
      ]
    },
    {
      'question': 'What is your favourite Color?',
      'answer': [
        {'text': 'White', 'score': 2},
        {'text': 'Pink', 'score': 32},
        {'text': 'Black', 'score': 12},
        {'text': 'Blue', 'score': 22}
      ]
    },
    {
      'question': 'What is your favourite Movie?',
      'answer': [
        {'text': 'Raees', 'score': 55},
        {'text': 'Hacker', 'score': 22},
        {'text': 'Dil Bechara', 'score': 32},
        {'text': '3 idiots', 'score': 58}
      ]
    },
    {
      'question': 'What is your favourite Game?',
      'answer': [
        {'text': 'Jumpy Tiles', 'score': 5},
        {'text': 'Classic Chess', 'score': 12},
        {'text': 'Flappy Bird', 'score': 22},
        {'text': 'Garena FreeFire', 'score': 52}
      ]
    }
  ];
  void _pressedQuestionChangeButton(int currentScore) {
    // if (_questionIndex == (questions.length - 1)) {
    //   _questionIndex = -1;
    // }
    if (_questionIndex <= (questions.length - 1)) {
      setState(() {
        _finalScore += currentScore;
        // invoking setState is necessary because this method re-builds the Widgets so as the latest State is updated to for the data inside app Widgets
        _questionIndex = _questionIndex + 1;
      });
    }
    print(_questionIndex);
  }

  void _resetQuizCallback() {
    setState(() {
      _finalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // build is an abstract method which needs implementation-context is object containing app metadata?
    return MaterialApp(
      title: 'Personality Test App',
      // does behind the scene things + home is core widget which is brought on screen when entire app is mounted on screen
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sample App'),
          backgroundColor: Colors.redAccent,
        ),
        body: _questionIndex < (questions.length)
            ? Quiz(
                questionIndex: _questionIndex,
                questionAnswers: questions,
                onButtonPressCallback: _pressedQuestionChangeButton,
              )
            : FinalResult(finalResultScore: _finalScore, resetQuizCallback: _resetQuizCallback),
        // backgroundColor: Colors.green,
      ),
    );
  }
}
