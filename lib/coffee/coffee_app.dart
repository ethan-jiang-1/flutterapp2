import 'package:async/async.dart';
import 'package:flutter/material.dart';

import 'coffee_component.dart';
import 'coffee_maker.dart';

class CoffeeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CoffeeAppState();
}

class _CoffeeAppState extends State<StatefulWidget> {
  CoffeeComponent _coffeeComponent;
  CoffeeMaker _coffeeMaker;

  String _text;

  CancelableOperation cancelableOperation;

  @override
  void initState() {
    print("initState");
    super.initState();
    _coffeeComponent = CoffeeComponent();
    _coffeeComponent.init();
    _coffeeMaker = _coffeeComponent.getCoffeeMaker();
    _text = "A cup of Java?";
  }

  @override 
  void didChangeDependencies()  {
    print("didChangeDependecies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffee App"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(border: Border.all(color:Colors.blue[300])),
            child: Center(
              child: Text(_text, textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("brew"),
        onPressed: () {
          cancelableOperation = CancelableOperation.fromFuture(
              _coffeeMaker.brew((text) => setState(() => this._text = text)));
        },
      ), 
    );
  }

  @override
  void deactivate() {
    print("deactive");
    cancelableOperation?.cancel();
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose!");
    //cancelableOperation?.cancel();
    _coffeeComponent.deInit();
    super.dispose();
  }
}
