import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function _textChangerCallback;

  TextControl(this._textChangerCallback);

  @override
  Widget build(BuildContext buildContext) {
    return RaisedButton(
      onPressed: _textChangerCallback,
      child: Text('Change Text'),
    );
  }
}
