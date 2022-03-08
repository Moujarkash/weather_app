// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDataModel _$WeatherDataModelFromJson(Map json) => WeatherDataModel(
      const CustomDateTimeConverter().fromJson(json['dt'] as int),
      WeatherMainInfoModel.fromJson(
          Map<String, dynamic>.from(json['main'] as Map)),
      WindModel.fromJson(Map<String, dynamic>.from(json['wind'] as Map)),
      (json['weather'] as List<dynamic>)
          .map((e) =>
              WeatherDetailsModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      json['dt_txt'] as String,
    );
