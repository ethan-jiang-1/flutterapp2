import 'dart:async';

import 'package:bloc/bloc.dart';
//import 'package:equatable/equatable.dart';
import 'package:flutterapp2/bloc_weather/weather_repository.dart';

import 'weather_state.dart';
import 'weather_event.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) { 
    print("WeatherBlock created.");
  }

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield WeatherLoading();
    if (event is GetWeather) {
      try {
        final weather = await weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError {
        yield WeatherError("Couldn't fetach weather.");
      } 
    } else if (event is GetDetailedWeather) {
      try {
        final weather = await weatherRepository.fetchDetailedWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError {
        yield WeatherError("Couldn't fetach weather.");
      }
    }
  }
}
