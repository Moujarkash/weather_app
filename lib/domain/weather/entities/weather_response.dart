import 'package:weather_app/domain/core/entities/city.dart';
import 'package:weather_app/domain/weather/entities/weather_data.dart';

class WeatherResponse {
  final List<WeatherData> weatherData;
  final City city;

  WeatherResponse(this.weatherData, this.city);
}