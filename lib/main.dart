//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutterapp2/page1/page1.dart';
import 'package:flutterapp2/page2/page2.dart';
import 'package:flutterapp2/page_tab0/page_tab0.dart';
import 'package:flutterapp2/page_html0/page_html0.dart';
import 'package:flutterapp2/page_cam0/page_cam0.dart';


void main() {
  runApp(MyApp());
}

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
      "/page_html0": (context) => WebViewExample(),
      "/page_cam0": (context) => PageCamera0(),
    },
  );
}


class Page0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              MyBar0(Text("MyBar in Home")),
              MyButton0('/page1'),
              MyButton0('/page2'),
              MyButton0('/page_tab0'),
              MyButton0('/page_html0'),
              MyButton0('/page_cam0'),
            ],
        ),
      ),
    );
  }
}

class MyBar0 extends StatelessWidget{
  //super(key:key);
  MyBar0(this.title);

  // Fields in a Widget subclass are always marked "final".

  final Widget title;

  //@override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout.
      child: Row(
        // <Widget> is the type of items in the list.
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: () {
              print("pressMenu");
              Navigator.pushNamed(context, '/page2');
            },
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
            child: title,
          ),
          IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {
                print("pressSearch");
              }
          ),
        ],
      ),
    );
  }
}
class MyButton0 extends StatelessWidget {
  final String _name;

  MyButton0(this._name);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped! {$_name)');
        Navigator.pushNamed(context, _name);
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Jump to $_name'),
        ),
      ),
    );
  }
}

