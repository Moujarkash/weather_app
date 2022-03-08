import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/domain/core/entities/failure.dart';
import 'package:weather_app/domain/core/use_case/use_case.dart';
import 'package:weather_app/domain/weather/entities/weather_response.dart';
import 'package:weather_app/domain/weather/repositories/weather_repository.dart';

@lazySingleton
class GetWeatherDataUseCase extends UseCase<WeatherResponse, NoParams> {
  final WeatherRepository repository;

  GetWeatherDataUseCase(this.repository);

  @override
  Future<Either<Failure, WeatherResponse>> call(NoParams params) {
    return repository.getWeatherData();
  }
}
