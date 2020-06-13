//import 'dart:html';
//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class PageAni0 extends StatefulWidget {
  @override 
  _PageAni0State createState() => _PageAni0State();
}

class _PageAni0State extends State<PageAni0> {
  double _width = 100;
  double _height = 100;
  bool _grow = true;

  Tween<double> _scaleTween = Tween<double>(begin:1, end:2);
  
  void _updateState() {
    setState(() {
      if (_grow) {
        _width = 200;
        _height = 200;
      } else {
        _width = 100;
        _height = 100;
      }
      _grow = !_grow;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bluetooth scanner',
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              //Expanded (
              //  flex:1, 
              //  child: Text(""),
              //),
              RaisedButton(
                onPressed: () => _updateState(),
                child: Text("Run Animation"),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                curve: Curves.bounceOut,
                width: _width,
                height: _height,
                color: Colors.lightBlue[200],
                child: Center(
                  child: Text(
                    "Animation0",
                    style: Theme.of(context).textTheme.headline5,
                  )
                ),
              ),
              Expanded(
                flex: 1, 
                child: Text(""),
              ),
              TweenAnimationBuilder(
                tween: _scaleTween,
                duration: Duration(milliseconds: 400),
                builder: (context, scale, child) {
                  return Transform.scale(scale:scale, child: child);
                },
                child: Container(
                  width: _width,
                  height: _height,
                  color: Colors.lightGreen[200],
                  child: Center (
                    child: Text(
                      "Animation1",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  )
                ),
              ),
            ]
          )
        ),
      ),
    );
  }
}
