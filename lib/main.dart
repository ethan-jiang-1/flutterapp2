import 'package:flutter/material.dart';
import 'package:flutterapp2/page1/pageone.dart';


// ignore: non_constant_identifier_names
MyApp() {
  return MaterialApp(
    title: 'My app (invisible)', // used by the OS task switcher
    home: Page1(),
  );
}

void main() {
  runApp(MyApp());
}