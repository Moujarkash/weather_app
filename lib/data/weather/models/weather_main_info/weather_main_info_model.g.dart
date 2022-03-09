// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_main_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherMainInfoModel _$WeatherMainInfoModelFromJson(Map json) =>
    WeatherMainInfoModel(
      (json['temp'] as num).toDouble(),
      (json['humidity'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherMainInfoModelToJson(
        WeatherMainInfoModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'humidity': instance.humidity,
    };
