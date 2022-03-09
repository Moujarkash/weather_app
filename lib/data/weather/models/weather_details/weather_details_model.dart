import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/weather/models/weather_conition/weather_condition_model.dart';
import 'package:weather_app/domain/weather/entities/weather_details.dart';

part 'weather_details_model.g.dart';

@JsonSerializable()
class WeatherDetailsModel {
  @JsonKey(name: 'main')
  final WeatherConditionModel weatherCondition;
  final String description;
  final String icon;

  WeatherDetailsModel(this.weatherCondition, this.description, this.icon);

  factory WeatherDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDetailsModelToJson(this);
}

extension MapToDomain on WeatherDetailsModel {
  WeatherDetails toDomain(String imageUrl) => WeatherDetails(
      weatherCondition.toDomain(), description, '$imageUrl$icon@2x.png');
}
