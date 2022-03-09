// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map json) => CityModel(
      json['id'] as int,
      json['name'] as String,
      CoordinateModel.fromJson(Map<String, dynamic>.from(json['coord'] as Map)),
      json['country'] as String,
      json['timezone'] as int,
      const CustomDateTimeConverter().fromJson(json['sunrise'] as int),
      const CustomDateTimeConverter().fromJson(json['sunset'] as int),
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'coord': instance.coordinate.toJson(),
    'country': instance.country,
    'timezone': instance.timezone,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'sunrise', const CustomDateTimeConverter().toJson(instance.sunrise));
  writeNotNull(
      'sunset', const CustomDateTimeConverter().toJson(instance.sunset));
  return val;
}
