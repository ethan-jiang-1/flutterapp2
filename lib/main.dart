//import 'dart:js';
//import 'dart:js';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapp2/dagger/counter_change_notifier.dart';
import 'package:flutterapp2/dagger/injection.iconfig.dart';
import 'package:flutterapp2/page1/page1.dart';
import 'package:flutterapp2/page2/page2.dart';
import 'package:flutterapp2/page_tab0/page_tab0.dart';
import 'package:flutterapp2/page_html0/page_html0.dart';
import 'package:flutterapp2/page_cam0/page_cam0.dart';
import 'package:flutterapp2/page_bt0/page_bt0.dart';
import 'package:flutterapp2/page_bt1/page_bt1.dart';
import 'package:flutterapp2/page_ani/page_ani.dart';
import 'package:provider/provider.dart';

import 'dagger/injection.dart';

void main() {
  final _osName = Platform.operatingSystem;
  print("main started $_osName ....");
  
  //configureInjection(Env.prod);

  runApp(MyApp());
  print("main ended");
}

// ignore: non_constant_identifier_names
MyApp() {
  print("MyApp Called...");

  MaterialApp(
    title: 'MyApp (invisible)', // used by the OS task switcher
    initialRoute: "/",
    routes: {
      "/": (context) => HomePage(),
      "/page1": (context) => Page1(),
      "/page2": (context) => Page2(),
      "/page_tab0": (context) => PageTab0(),
      "/page_html0": (context) => WebViewExample(),
      "/page_cam0": (context) => PageCamera0(),
      "/page_bt0": (context) => PageBt0(),
      "/page_bt1": (context) => FlutterBluePage(),
      "/page_ani0": (context) => PageAni0(),
    },
    //home: ChangeNotifierProvider(
    //    create: (_) => getIt<CounterChangeNotifier>(),
    //    child: null,
    //),
  );
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomePage： Home"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              MyJumpButton('/page1', Colors.lightGreen[500]),
              MyJumpButton('/page2', Colors.lightGreen[500],),
              MyJumpButton('/page_tab0', Colors.lightGreen[300]),
              MyJumpButton('/page_html0', Colors.lightGreen[300]),
              MyJumpButton('/page_cam0', Colors.lightBlue[200]),
              MyJumpButton("/page_bt0", Colors.lightBlue[300]),
              MyJumpButton("/page_bt1", Colors.lightBlue[300]),
              MyJumpButton("/page_ani0",Colors.yellow[200])
            ],
          ),
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
            ])
          ),
          child: Text("")),
        ListTile(title: Text("line1")),
        ListTile(title: Text("line2")),
        ListTile(title: Text("line3")),
        ListTile(title: Text("line4")),
      ],
    )
  );
}

class MyJumpButton extends StatelessWidget {
  final String _name;
  final Color _color;

  MyJumpButton(this._name, this._color);

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

