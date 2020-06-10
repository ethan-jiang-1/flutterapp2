import "package:flutter/material.dart";

class MyCounterDisplay extends StatelessWidget {
  MyCounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text('Increment'),
    );
  }
}

class MyCounter1 extends StatefulWidget {
  @override
  _CounterState1 createState() => _CounterState1();
}

class _CounterState1 extends State<MyCounter1> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      CounterIncrementor(onPressed: _increment),
      MyCounterDisplay(count: _counter),
    ]);
  }
}
