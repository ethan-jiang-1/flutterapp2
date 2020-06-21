//import 'dart:js';
//import 'dart:js';
import 'dart:async';
import 'dart:io';

import 'package:flurry/flurry.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp2/page1/page1.dart';
import 'package:flutterapp2/page2/page2.dart';
import 'package:flutterapp2/page_ani/page_ani.dart';
import 'package:flutterapp2/page_bt0/page_bt0.dart';
import 'package:flutterapp2/page_bt1/page_bt1.dart';
import 'package:flutterapp2/page_cam0/page_cam0.dart';
import 'package:flutterapp2/page_html0/page_html0.dart';
import 'package:flutterapp2/page_tab0/page_tab0.dart';

import 'coffee/coffee_app.dart';

void main() {
  final _osName = Platform.operatingSystem;
  print("main started $_osName ....");
  runApp(MyApp());
  print("main ended");
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    await Flurry.initialize(
        androidKey: "8BSVB95GJPBNYG23YT6M",
        iosKey: "2WNFQP3FFMRWFVFXCDNB",
        enableLog: true);
    await Flurry.setUserId("userId");
    await Flurry.logEvent("eventName");
  }

  @override
  Widget build(BuildContext context) {
    print("MyApp Called...");
    return MaterialApp(
      title: 'MyApp (invisible)', // used by the OS task switcher
      routes: {
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.page1: (context) => Page1(),
        MyRoutes.page2: (context) => Page2(),
        MyRoutes.page2X: (context) => Page2X(),
        MyRoutes.pageTab0: (context) => PageTab0(),
        MyRoutes.pageHtml0: (context) => WebViewExample(),
        MyRoutes.pageCam0: (context) => PageCamera0(),
        MyRoutes.pageBt0: (context) => PageBt0(),
        MyRoutes.pageBt1: (context) => FlutterBluePage(),
        MyRoutes.pageAni0: (context) => PageAni0(),
        MyRoutes.coffee: (context) => CoffeeApp(),
      },
    );
  }
}

class MyRoutes {
  static final String home = "/";
  static final String page1 = "/page1";
  static final String page2 = "/page2";
  static final String page2X = "/page2X";
  static final String pageTab0 = "/tab0";
  static final String pageHtml0 = "/html0";
  static final String pageCam0 = "/cam0";
  static final String pageBt0 = "/bt0";
  static final String pageBt1 = "/bt1";
  static final String pageAni0 = "/ani0";
  static final String coffee = "/coffee";
}

class HomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomePage： Home"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: Scrollbar(
              isAlwaysShown: true,
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column (
                  children: <Widget> [
                    SizedBox(height: 10,),
                    MyJumpButton("Page1", MyRoutes.page1, Colors.lightGreen[500]),
                    MyJumpButton("Page2", MyRoutes.page2, Colors.lightGreen[500],),
                    MyJumpButton("Tab0", MyRoutes.pageTab0, Colors.lightGreen[300]),
                    MyJumpButton("Html0",MyRoutes.pageHtml0, Colors.lightGreen[300]),
                    MyJumpButton("Camera0", MyRoutes.pageCam0, Colors.lightBlue[200]),
                    MyJumpButton("Bluetooth0", MyRoutes.pageBt0, Colors.lightBlue[300]),
                    MyJumpButton("Bluetooth1", MyRoutes.pageBt1, Colors.lightBlue[300]),
                    MyJumpButton("Animation0", MyRoutes.pageAni0, Colors.yellow[200]),
                    MyJumpButton("Coffee", MyRoutes.coffee, Colors.red[200]),
                  ],
                )
              )
            )
          ),
        drawer: MyHomeDrawer(),
    );
  }
}

Widget MyHomeDrawer() {
  return Drawer(
      child: ListView(
    children: <Widget>[
      DrawerHeader(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Colors.lightBlue[100],
            Colors.lightBlue[500]
          ])),
          child: Text("")),
      ListTile(title: Text("line1")),
      ListTile(title: Text("line2")),
      ListTile(title: Text("line3")),
      ListTile(title: Text("line4")),
    ],
  ));
}

class MyJumpButton extends StatelessWidget {
  final String _name;
  final Color _color;
  final String _route;

  MyJumpButton(this._name, this._route,  this._color);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped! {$_name)');
        Navigator.pushNamed(context, _route);
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: _color,
        ),
        child: Center(
          child: Text('Jump to $_name'),
        ),
      ),
    );
  }
}
