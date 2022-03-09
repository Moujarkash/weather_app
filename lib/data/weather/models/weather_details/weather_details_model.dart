import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/weather/entities/weather_details.dart';

part 'weather_details_model.g.dart';

@JsonSerializable()
class WeatherDetailsModel {
  final String main;
  final String description;
  final String icon;

  WeatherDetailsModel(this.main, this.description, this.icon);

  factory WeatherDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailsModelFromJson(json);
}

extension MapToDomain on WeatherDetailsModel {
  WeatherDetails toDomain(String imageUrl) => WeatherDetails(main, description, '$imageUrl$icon@2x.png');
}
