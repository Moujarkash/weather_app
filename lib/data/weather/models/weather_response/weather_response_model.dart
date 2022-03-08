import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/core/models/city/city_model.dart';
import 'package:weather_app/data/weather/models/weather_data/weather_data_model.dart';
import 'package:weather_app/domain/weather/entities/weather_response.dart';

part 'weather_response_model.g.dart';

@JsonSerializable()
class WeatherResponseModel {
  @JsonKey(name: 'list')
  final List<WeatherDataModel> weatherData;
  final CityModel city;

  WeatherResponseModel(this.weatherData, this.city);

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseModelFromJson(json);
}

extension MapToDomain on WeatherResponseModel {
  WeatherResponse toDomain() => WeatherResponse(
      weatherData.map((e) => e.toDomain()).toList(), city.toDomain());
}
