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
