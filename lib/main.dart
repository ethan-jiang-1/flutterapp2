import 'package:flutter/material.dart';
import 'package:flutterapp2/page0/page0.dart';
import 'package:flutterapp2/page1/page1.dart';
import 'package:flutterapp2/page2/page2.dart';
import 'package:flutterapp2/page_tab0/page_tab0.dart';

// ignore: non_constant_identifier_names
MyApp() {
  return MaterialApp(
    title: 'My app (invisible)', // used by the OS task switcher
    //home: Page1(),
    initialRoute: "/",
    routes: {
      "/": (context) => Page0(),
      "/page1": (context) => Page1(),
      "/page2": (context) => Page2(),
      "/page_tab0": (context) => PageTab0(),
    },
  );
}

void main() {
  runApp(MyApp());
}