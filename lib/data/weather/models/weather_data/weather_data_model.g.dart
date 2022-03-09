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

Map<String, dynamic> _$WeatherDataModelToJson(WeatherDataModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dt', const CustomDateTimeConverter().toJson(instance.date));
  val['main'] = instance.weatherMainInfo.toJson();
  val['wind'] = instance.wind.toJson();
  val['weather'] = instance.details.map((e) => e.toJson()).toList();
  val['dt_txt'] = instance.dateText;
  return val;
}
