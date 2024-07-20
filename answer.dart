import 'package:flutter/material.dart' show BuildContext, ElevatedButton, Key, StatelessWidget, Text, VoidCallback, Widget;
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';

class Answer extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  @override
  final Key? key;

  const Answer(this.text, this.onPressed, {this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Key?>('key', key));
  }
}