import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function questionIndexHandler;
  final String buttonText;

  Answer({this.buttonText, this.questionIndexHandler});

  @override
  Widget build(BuildContext buildContext) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
            side: BorderSide(color: Colors.red)),
        color: Colors.redAccent,
        textColor: Colors.white,
        child: Text(buttonText),
        onPressed: questionIndexHandler,
      ),
    );
  }
}
