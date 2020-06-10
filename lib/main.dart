import 'package:flutter/material.dart';
import 'package:flutterapp2/page1/page1.dart';
import 'package:flutterapp2/page2/page2.dart';


// ignore: non_constant_identifier_names
MyApp() {
  return MaterialApp(
    title: 'My app (invisible)', // used by the OS task switcher
    //home: Page1(),
    initialRoute: "/",
    routes: {
      "/": (context) => Page1(),
      "/page2": (context) => Page2(),
    },
  );
}

void main() {
  runApp(MyApp());
}