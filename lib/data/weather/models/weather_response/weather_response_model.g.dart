// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponseModel _$WeatherResponseModelFromJson(Map json) =>
    WeatherResponseModel(
      (json['list'] as List<dynamic>)
          .map((e) =>
              WeatherDataModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      CityModel.fromJson(Map<String, dynamic>.from(json['city'] as Map)),
    );
