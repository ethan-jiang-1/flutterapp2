import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(
      child: childText(),
    ),
  );
}

Widget childText() {
  return Text(
    'Move Widget out.',
    textDirection: TextDirection.ltr,
  );
}