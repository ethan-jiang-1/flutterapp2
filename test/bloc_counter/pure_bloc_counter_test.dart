// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp2/bloc_counter/pure_bloc_counter.dart';
import 'package:flutterapp2/bloc_counter/pure_bloc_counter_event.dart';
import 'package:fake_async/fake_async.dart';

void main() {
  test('Counter Bloc response to ResetEvent', () async {
    final _bloc = CounterBloc();
    int _result = -1;
    _bloc.counter.listen((x) => {_result=x, print("get notification0: "+x.toString())});

    _bloc.conterEventSink.add(ResetEvent());

    print("check result: " + _result.toString());
    //expectLater(_result, emits(0));

  });
  test('Counter Bloc response to ResetEvent', () {
    fakeAsync((async) {
      final _bloc = CounterBloc();
      int _result = -1;
      _bloc.counter.listen((x) => {_result=x, print("get notification0: "+x.toString())});

      _bloc.conterEventSink.add(ResetEvent());

      print("check result: " + _result.toString());
      expect(_result, -1);
      async.flushMicrotasks();
      print("check result: " + _result.toString());
      expect(_result, 0);
    });
  });
  test('Counter Bloc response to IncrementEvent', () {
    final _bloc = CounterBloc();
    int _result = -1;
    _bloc.counter.listen((x) => {_result=x, print("get notification1: "+x.toString())});

    _bloc.conterEventSink.add(ResetEvent());
    print("result1: " + _result.toString());

    _bloc.conterEventSink.add(IncrementEvent());
    print("result2: " + _result.toString());
    
    _bloc.conterEventSink.add(IncrementEvent());
    print("result3: " + _result.toString());

  });

}