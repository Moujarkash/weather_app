import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/weather/entities/weather_main_info.dart';

part 'weather_main_info_model.g.dart';

@JsonSerializable()
class WeatherMainInfoModel {
  final double temp;
  final double humidity;

  WeatherMainInfoModel(this.temp, this.humidity);

  factory WeatherMainInfoModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherMainInfoModelToJson(this);
}

extension MapToDomain on WeatherMainInfoModel {
  WeatherMainInfo toDomain() => WeatherMainInfo(temp, humidity);
}
