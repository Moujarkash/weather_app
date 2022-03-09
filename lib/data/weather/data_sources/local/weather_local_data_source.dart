import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/data/weather/models/weather_response/weather_response_model.dart';

abstract class WeatherLocalDataSource {
  Future<void> addWeatherData(WeatherResponseModel weatherResponseModel);

  Future<WeatherResponseModel?> getWeatherData(DateTime date);
}

@LazySingleton(as: WeatherLocalDataSource)
class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> addWeatherData(WeatherResponseModel weatherResponseModel) async {
    await sharedPreferences.clear();

    final weatherDataJson = jsonEncode(weatherResponseModel.toJson());

    final DateTime now = DateTime.now();
    final DateTime date = DateTime(now.year, now.month, now.day);
    sharedPreferences.setString(date.toString(), weatherDataJson);
  }

  @override
  Future<WeatherResponseModel?> getWeatherData(DateTime date) async {
    final dateKey = DateTime(date.year, date.month, date.day);

    if (!sharedPreferences.containsKey(dateKey.toString())) return null;

    final weatherDataJson = sharedPreferences.getString(dateKey.toString());
    return WeatherResponseModel.fromJson(jsonDecode(weatherDataJson!));
  }
}
