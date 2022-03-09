import 'package:weather_app/domain/weather/entities/weather_condition.dart';

class WeatherDetails {
  final WeatherCondition weatherCondition;
  final String description;
  final String icon;

  WeatherDetails(this.weatherCondition, this.description, this.icon);
}