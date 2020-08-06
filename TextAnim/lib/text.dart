import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String newText;

  MyText(this.newText);

  @override
  Widget build(BuildContext buildContext) {
    return Container(
      margin: EdgeInsets.only(top: 140, bottom: 140),
      child: Center(
        child: Text(
          newText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),softWrap: true,
        ),
      ),
    );
  }
}
