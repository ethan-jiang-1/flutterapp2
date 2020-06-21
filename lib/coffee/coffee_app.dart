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

  String text;

  CancelableOperation cancelableOperation;

  @override
  void initState() {
    super.initState();
    _coffeeComponent = CoffeeComponent();
    _coffeeComponent.init();
    _coffeeMaker = _coffeeComponent.getCoffeeMaker();
    text = "A cup of Java?";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffee App"),
      ),
      body: Center(
        child: Text(text, textAlign: TextAlign.center),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("brew"),
        onPressed: () {
          cancelableOperation = CancelableOperation.fromFuture(
              _coffeeMaker.brew((text) => setState(() => this.text = text)));
        },
      ),
    );
  }

  @override
  void dispose() {
    print("dispose!");
    cancelableOperation?.cancel();
    _coffeeComponent.deInit();
    super.dispose();
  }
}
