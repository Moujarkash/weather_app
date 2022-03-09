import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/core/entities/coordinate.dart';

part 'coordinate_model.g.dart';

@JsonSerializable()
class CoordinateModel {
  final double lat;
  @JsonKey(name: 'lon')
  final double lng;

  CoordinateModel(this.lat, this.lng);

  factory CoordinateModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinateModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinateModelToJson(this);
}

extension MapToDomain on CoordinateModel {
  Coordinate toDomain() => Coordinate(lat, lng);
}
