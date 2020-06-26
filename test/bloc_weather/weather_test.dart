// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp2/bloc_weather/bloc/weather_bloc.dart';
import 'package:flutterapp2/bloc_weather/bloc/weather_event.dart';
import 'package:flutterapp2/bloc_weather/weather_repository.dart';
import 'package:fake_async/fake_async.dart';

void main() {
  test('Weather response to Event', () {
    fakeAsync((async) {
     final _eb = WeatherBloc(FakeWatherRepository());
     List<String> _lstStates = List<String>();

     _eb.listen((x) {print("listen: " + x.toString()); _lstStates.add(x.toString());});
     _eb.add(GetWeather("shanghai"));
     //_eb.add(GetWeather("shanghai"));
    //_eb.add(GetDetailedWeather("shanghai"));
    //_eb.add(GetDetailedWeather("shanghai"));

    print("before fluash: " + _lstStates.toString());
    async.elapse(Duration(seconds: 2));
    async.flushMicrotasks();
    print("after fluash: " + _lstStates.toString());

    _eb.close();

    });
  });

}