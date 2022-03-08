import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/data/core/utils/configuration.dart';
import 'package:weather_app/data/weather/data_sources/remote/weather_remote_data_source.dart';
import 'package:weather_app/data/weather/models/weather_response/weather_response_model.dart';
import 'package:weather_app/domain/core/utils/network_info.dart';
import 'package:weather_app/domain/core/utils/server_error_code.dart';
import 'package:weather_app/domain/weather/entities/weather_response.dart';
import 'package:weather_app/domain/core/entities/failure.dart';
import 'package:weather_app/domain/weather/repositories/weather_repository.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remote;
  final NetworkInfo networkInfo;
  final Configuration configuration;

  WeatherRepositoryImpl(this.remote, this.networkInfo, this.configuration);

  @override
  Future<Either<Failure, WeatherResponse>> getWeatherData() async {
    if (!await networkInfo.isConnected) {
      return left(
          ServerFailure(errorCode: ServerErrorCode.noInternetConnection));
    }

    try {
      final response =
          await remote.getWeatherData(apiKey: configuration.apiKey);
      return right(response.toDomain());
    } catch (e) {
      return left(ServerFailure(errorCode: ServerErrorCode.serverError));
    }
  }
}
