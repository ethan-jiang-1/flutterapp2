import "package:flutter/material.dart";
import 'package:flutterapp2/counter/pure_bloc_counter_event.dart';

import 'pure_bloc_counter.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _bloc = CounterBloc();
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _bloc.conterEventSink.add(ResetEvent());
    print("CP: CounterPageState initState");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: _key,
        title: Row(
          children: <Widget>[
            Text("CounterPage: simple bloc"),
            Expanded(
              child: StreamBuilder(
                stream: _bloc.counter,
                initialData: 0,
                builder: (contxt, snapshot) {
                  print("builder called inside StreamBUilder 1");
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
            print("builder called inside StreamBUilder 2");
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
          SizedBox(width: 8),
          StreamBuilder(
            stream: _bloc.counter,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return FloatingActionButton(
                heroTag: "btn2",
                onPressed: ()=> _bloc.conterEventSink.add(RefreshEvent()),
                tooltip: 'Refresh',
                child: Icon(Icons.refresh),
              );
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
