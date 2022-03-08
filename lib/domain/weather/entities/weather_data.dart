import 'package:weather_app/domain/weather/entities/weather_details.dart';
import 'package:weather_app/domain/weather/entities/weather_main_info.dart';
import 'package:weather_app/domain/weather/entities/wind.dart';

class WeatherData {
  final DateTime date;
  final WeatherMainInfo weatherMainInfo;
  final Wind wind;
  final List<WeatherDetails> details;
  final String dateText;

  WeatherData(this.date, this.weatherMainInfo, this.wind, this.details, this.dateText);
}