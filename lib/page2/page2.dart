import "package:flutter/material.dart";
import 'package:flutterapp2/page2/counter_event.dart';

import 'count_bloc.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text("Page2"),
            Expanded(
              child: StreamBuilder(
                stream: _bloc.counter,
                builder: (contxt, snapshot) {
                  return Text("     ${snapshot.data}");
                }
              )
            ),
          ]
        )
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.counter,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          }
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () => _bloc.conterEventSink.add(IncrementEvent()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 8),
          StreamBuilder(
            stream: _bloc.counter,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if ((snapshot.data is num) && (snapshot.data > 0)) {
                return FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: ()=> _bloc.conterEventSink.add(DecrementEvent()),
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                );
              } else {
                return Text("");
              }
            }
          ),
        ]
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

}
