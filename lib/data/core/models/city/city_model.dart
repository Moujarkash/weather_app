import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/core/models/coordinate/coordinate_model.dart';
import 'package:weather_app/data/core/utils/custom_date_time_converter.dart';
import 'package:weather_app/domain/core/entities/city.dart';

part 'city_model.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class CityModel {
  final int id;
  final String name;
  @JsonKey(name: 'coord')
  final CoordinateModel coordinate;
  final String country;
  final int timezone;
  final DateTime sunrise;
  final DateTime sunset;

  CityModel(this.id, this.name, this.coordinate, this.country, this.timezone,
      this.sunrise, this.sunset);

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}

extension MapToDomain on CityModel {
  City toDomain() =>
      City(id, name, coordinate.toDomain(), country, timezone, sunrise, sunset);
}
