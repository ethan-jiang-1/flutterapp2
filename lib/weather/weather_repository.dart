import 'dart:math';
import 'weather.dart';


abstract class WeatherRepository {
  Future<Weather> fetchWeather(String cityName);
  Future<Weather> fetchDetailedWeather(String citryName);
}

class FakeWatherRepository implements WeatherRepository {
  double cachedTempCelsus;

  @override
  Future<Weather> fetchWeather(String cityName) {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();

        if (cityName != "shanghai") {
          if (random.nextBool()) {
            throw NetworkError();
          }
        }

        cachedTempCelsus = 20 + random.nextInt(15) * random.nextDouble();

        return Weather(cityName: cityName, 
                temperatureCelsius: cachedTempCelsus);
      });
  }

  @override
  Future<Weather> fetchDetailedWeather(String citryName) {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        return Weather(cityName: citryName, 
                  temperatureCelsius: cachedTempCelsus,
                  temperatureFahrenheit: cachedTempCelsus * 1.8 + 32);
      });
  }
}

class NetworkError extends Error {}