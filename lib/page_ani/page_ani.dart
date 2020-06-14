//import 'dart:html';
//import 'dart:js';

import 'package:flutter/material.dart';


class PageAni0 extends StatefulWidget {
  @override 
  _PageAni0State createState() => _PageAni0State();
}

class _PageAni0State extends State<PageAni0> {
  double _width = 180;
  double _height = 180;
  bool _grow = true;
  
  Tween<double> _scaleTween = Tween<double>(begin:1, end:2);
  
  void _updateState() {
    setState(() {
      if (_grow) {
        _width = 240;
        _height = 240;
      } else {
        _width = 180;
        _height = 180;
      }
      _grow = !_grow;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( 
          title: Text("Page Animation"),
        ),        
        body: Center(
          child: Column(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                curve: Curves.bounceOut,
                width: _width,
                height: _height,
                color: Colors.lightBlue[200],
                child: Center(
                  child: Text(
                    "Animation0",
                    style: (_grow)? Theme.of(context).textTheme.headline6 : Theme.of(context).textTheme.headline5,
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
                    child: Image( 
                      image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    )
                  )
                ),
              ),
            ]
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _updateState(),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
