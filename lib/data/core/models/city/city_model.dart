import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/core/models/coordinate/coordinate_model.dart';
import 'package:weather_app/domain/core/entities/city.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel {
  final int id;
  final String name;
  final CoordinateModel coordinate;
  final String country;
  final int timezone;

  CityModel(this.id, this.name, this.coordinate, this.country, this.timezone);

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}

extension MapToDomain on CityModel {
  City toDomain() => City(id, name, coordinate.toDomain(), country, timezone);
}
