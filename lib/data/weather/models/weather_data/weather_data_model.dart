import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/core/utils/custom_date_time_converter.dart';
import 'package:weather_app/data/weather/models/weather_details/weather_details_model.dart';
import 'package:weather_app/data/weather/models/weather_main_info/weather_main_info_model.dart';
import 'package:weather_app/data/weather/models/wind/wind_model.dart';
import 'package:weather_app/domain/weather/entities/weather_data.dart';

part 'weather_data_model.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class WeatherDataModel {
  @JsonKey(name: 'dt')
  final DateTime date;
  @JsonKey(name: 'main')
  final WeatherMainInfoModel weatherMainInfo;
  final WindModel wind;
  @JsonKey(name: 'weather')
  final List<WeatherDetailsModel> details;
  @JsonKey(name: 'dt_txt')
  final String dateText;

  WeatherDataModel(
      this.date, this.weatherMainInfo, this.wind, this.details, this.dateText);

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataModelFromJson(json);
}

extension MapToDomain on WeatherDataModel {
  WeatherData toDomain() => WeatherData(date, weatherMainInfo.toDomain(),
      wind.toDomain(), details.map((e) => e.toDomain()).toList(), dateText);
}
