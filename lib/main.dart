//import 'dart:js';
//import 'dart:js';
import 'dart:async';
import 'dart:io';

import 'package:flurry/flurry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/adobe_xd/adobe_xd0.dart';
import 'package:flutterapp2/page1/page1.dart';
import 'package:flutterapp2/counter/page_counter.dart';
import 'package:flutterapp2/page_ani/page_ani.dart';
import 'package:flutterapp2/page_bt0/page_bt0.dart';
import 'package:flutterapp2/page_bt1/page_bt1.dart';
import 'package:flutterapp2/page_cam0/page_cam0.dart';
import 'package:flutterapp2/page_html0/page_html0.dart';
import 'package:flutterapp2/page_tab0/page_tab0.dart';
import 'package:flutterapp2/weather/bloc/weather_bloc.dart';
//import 'package:flutterapp2/weather/page_weather_detail.dart';
import 'package:flutterapp2/weather/page_weather_search.dart';
import 'package:flutterapp2/weather/weather_repository.dart';

import 'coffee/coffee_app.dart';
import 'life_cycle/page_life.dart';

void main() {
  final _osName = Platform.operatingSystem;
  print("main started $_osName ....");
  runApp(
      BlocProvider(
        create: (context) => WeatherBloc(FakeWatherRepository()),
        child: MyApp(),
      )
  );
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
        MyRoutes.home: (context) => MyHomePage(),
        MyRoutes.page1: (context) => Page1(),
        MyRoutes.pageTab0: (context) => PageTab0(),
        MyRoutes.pageHtml0: (context) => WebViewExample(),
        MyRoutes.pageCam0: (context) => PageCamera0(),
        MyRoutes.pageBt0: (context) => PageBt0(),
        MyRoutes.pageBt1: (context) => FlutterBluePage(),
        MyRoutes.pageAni0: (context) => PageAni0(),
        MyRoutes.coffee: (context) => CoffeeApp(),
        MyRoutes.weatherSearch: (context) => WeatherSearchPage(),
        MyRoutes.counter: (context) => CounterPage(),
        MyRoutes.lifecycle: (context) => PageLC(),
        MyRoutes.adobe_xd0: (context) => IPhoneXXS11Pro1(),

        //MyRoutes.ws2: (context) => WeatherDetailPage(),
      },
      //initialRoute: MyRoutes.home,
    );
  }
}

class MyRoutes {
  static final String home = "/";
  static final String page1 = "/page1";
  static final String pageTab0 = "/tab0";
  static final String pageHtml0 = "/html0";
  static final String pageCam0 = "/cam0";
  static final String pageBt0 = "/bt0";
  static final String pageBt1 = "/bt1";
  static final String pageAni0 = "/ani0";
  static final String coffee = "/coffee";
  static final String counter = "/counter";
  static final String weatherSearch = "/weatherSearch";
  static final String lifecycle = "/lifeCycle";
  static final String adobe_xd0 = "/adobe_xd0";
}

class MyHomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MyHomePage： Home"),
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
                    MyJumpButton("Page: First", MyRoutes.page1, Colors.lightBlue[200]),
                    MyJumpButton("Page: Life Cycle", MyRoutes.lifecycle, Colors.lightBlue[200],),
                    MyJumpButton("Tab0", MyRoutes.pageTab0, Colors.lightGreen[300]),
                    MyJumpButton("Html0",MyRoutes.pageHtml0, Colors.lightGreen[300]),
                    MyJumpButton("Animation0", MyRoutes.pageAni0, Colors.lightGreen[300]),
                    MyJumpButton("Camera0", MyRoutes.pageCam0, Colors.lightBlue[300]),
                    MyJumpButton("Bluetooth0", MyRoutes.pageBt0, Colors.lightBlue[300]),
                    MyJumpButton("Bluetooth1", MyRoutes.pageBt1, Colors.lightBlue[300]),
                    MyJumpButton("Injection: Coffee", MyRoutes.coffee, Colors.red[200]),
                    MyJumpButton("Bloc: Weather Search", MyRoutes.weatherSearch, Colors.red[200]),
                    MyJumpButton("Bloc: Counter", MyRoutes.counter, Colors.red[200],),
                    MyJumpButton("Adobe: XD0", MyRoutes.adobe_xd0, Colors.yellow[200],),
                  ],
                )
              )
            )
          ),
        drawer: MyDrawer(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        ListTile(title: Text("Camera"), 
                onTap: () {Navigator.pushNamed(context, MyRoutes.pageCam0);}),
        ListTile(title: Text("Bluetooth"),
                onTap:  () {Navigator.pushNamed(context, MyRoutes.pageBt1);}),
        ListTile(title: Text("line3")),
        ListTile(title: Text("line4")),
      ],
    ));
  }
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
