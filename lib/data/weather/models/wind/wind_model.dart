import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/weather/entities/wind.dart';

part 'wind_model.g.dart';

@JsonSerializable()
class WindModel {
  final double speed;

  WindModel(this.speed);

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);

  Map<String, dynamic> toJson() => _$WindModelToJson(this);
}

extension MapToDomain on WindModel {
  Wind toDomain() => Wind(speed);
}
