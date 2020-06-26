// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp2/bloc_counter/pure_bloc_counter.dart';
import 'package:flutterapp2/bloc_counter/pure_bloc_counter_event.dart';

void main() {
  test('Counter Bloc response to ResetEvent', () {
    final _bloc = CounterBloc();

    _bloc.conterEventSink.add(ResetEvent());
    _bloc.counter.listen((x) => {print("listen0: " + x.toString())});
  });
  test('Counter Bloc response to IncrementEvent', () {
    final _bloc = CounterBloc();
    int _result = -1;
    _bloc.counter.listen((x) => {_result=x, print("get notification: "+x.toString())});

    _bloc.conterEventSink.add(ResetEvent());
    print("result1: " + _result.toString());

    _bloc.conterEventSink.add(IncrementEvent());
    print("result2: " + _result.toString());
    
    _bloc.conterEventSink.add(IncrementEvent());
    print("result3: " + _result.toString());

  });

}