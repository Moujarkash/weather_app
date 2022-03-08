import 'package:dartz/dartz.dart';
import 'package:weather_app/domain/core/entities/failure.dart';
import 'package:weather_app/domain/weather/entities/weather_response.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherResponse>> getWeatherData();
}
