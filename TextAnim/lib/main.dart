import 'package:flutter/material.dart';

import 'text.dart';
import 'TextControl.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  var _displayText = [
    'Somtimes i like Apples',
    'While the other times i like Bananas ;)'
  ];
  var _textChangerIndex = 0;

  void changeDisplayText() {
    setState(() {
      if (_textChangerIndex == 0) {
        _textChangerIndex = 1;
      } else {
        _textChangerIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: 'Text Changer App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Changer App'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          children: <Widget>[
            MyText(
              _displayText[_textChangerIndex],
            ),
            TextControl(changeDisplayText)
          ],
        ),
      ),
    );
  }
}
