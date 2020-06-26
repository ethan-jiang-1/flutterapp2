// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp2/bloc_weather/bloc/weather_bloc.dart';
import 'package:flutterapp2/bloc_weather/bloc/weather_event.dart';
import 'package:flutterapp2/bloc_weather/weather_repository.dart';

void main() {
  test('Weather response to Event', () {
     final _eb = WeatherBloc(FakeWatherRepository());

     _eb.listen((x) {print("listen: " + x.toString()); });
     _eb.add(GetWeather("shanghai"));

  });

}