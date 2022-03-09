import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:weather_app/data/core/utils/configuration.dart';
import 'package:weather_app/data/weather/data_sources/local/weather_local_data_source.dart';
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
  final WeatherLocalDataSource local;
  final NetworkInfo networkInfo;
  final Configuration configuration;
  final Logger logger;

  WeatherRepositoryImpl(this.remote, this.local, this.networkInfo,
      this.configuration, this.logger);

  @override
  Future<Either<Failure, WeatherResponse>> getWeatherData() async {
    final result = await local.getWeatherData(DateTime.now());
    if (result != null) {
      return right(result.toDomain(configuration.imageUrl));
    }

    if (!await networkInfo.isConnected) {
      return left(
          ServerFailure(errorCode: ServerErrorCode.noInternetConnection));
    }

    try {
      final response =
          await remote.getWeatherData(apiKey: configuration.apiKey);

      await local.addWeatherData(response);

      return right(response.toDomain(configuration.imageUrl));
    } catch (e) {
      logger.e(e);
      return left(ServerFailure(errorCode: ServerErrorCode.serverError));
    }
  }
}
