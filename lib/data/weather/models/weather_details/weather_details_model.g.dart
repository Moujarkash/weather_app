// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDetailsModel _$WeatherDetailsModelFromJson(Map json) =>
    WeatherDetailsModel(
      $enumDecode(_$WeatherConditionModelEnumMap, json['main']),
      json['description'] as String,
      json['icon'] as String,
    );

const _$WeatherConditionModelEnumMap = {
  WeatherConditionModel.thunderstorm: 'Thunderstorm',
  WeatherConditionModel.drizzle: 'Drizzle',
  WeatherConditionModel.rain: 'Rain',
  WeatherConditionModel.snow: 'Snow',
  WeatherConditionModel.clear: 'Clear',
  WeatherConditionModel.clouds: 'Clouds',
  WeatherConditionModel.mist: 'Mist',
  WeatherConditionModel.smoke: 'Smoke',
  WeatherConditionModel.haze: 'Haze',
  WeatherConditionModel.dust: 'Dust',
  WeatherConditionModel.fog: 'Fog',
  WeatherConditionModel.sand: 'Sand',
  WeatherConditionModel.ash: 'Ash',
  WeatherConditionModel.squall: 'Squall',
  WeatherConditionModel.tornado: 'Tornado',
};
