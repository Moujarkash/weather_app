import 'package:injectable/injectable.dart';
import 'package:weather_app/data/core/utils/configuration.dart';
import 'package:weather_app/data/weather/models/weather_response/weather_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'weather_remote_data_source.g.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherResponseModel> getWeatherData({int id, required String apiKey});
}

@LazySingleton(as: WeatherRemoteDataSource)
@RestApi(baseUrl: '')
abstract class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  @factoryMethod
  factory WeatherRemoteDataSourceImpl(Dio dio, Configuration configuration) {
    return _WeatherRemoteDataSourceImpl(dio, baseUrl: configuration.baseUrl);
  }

  @override
  @GET('/data/2.5/forecast')
  Future<WeatherResponseModel> getWeatherData({
    @Query('id') int id = 292223, 
    @Query('appid') required String apiKey
  });
}
