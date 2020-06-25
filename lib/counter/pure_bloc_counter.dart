import 'dart:async';

import 'package:flutterapp2/counter/pure_bloc_counter_event.dart';

class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>.broadcast();

  StreamSink<int> get _inCounter => _counterStateController.sink;

  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();

  Sink<CounterEvent> get conterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  } 

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      print("IncreaseEvent");
      _counter++;
    } else if (event is DecrementEvent) {
      print("DecreaseEvent");
      _counter--;
    } else if (event is ResetEvent) {
      print("ResetEvent");
      _counter = 0;
    } else if (event is RefreshEvent) {
      print("RefreshEvent");
    }
    
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }
}