import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/weather/entities/weather_condition.dart';

enum WeatherConditionModel {
  @JsonValue('Thunderstorm')
  thunderstorm,
  @JsonValue('Drizzle')
  drizzle,
  @JsonValue('Rain')
  rain,
  @JsonValue('Snow')
  snow,
  @JsonValue('Clear')
  clear,
  @JsonValue('Clouds')
  clouds,
  @JsonValue('Mist')
  mist,
  @JsonValue('Smoke')
  smoke,
  @JsonValue('Haze')
  haze,
  @JsonValue('Dust')
  dust,
  @JsonValue('Fog')
  fog,
  @JsonValue('Sand')
  sand,
  @JsonValue('Ash')
  ash,
  @JsonValue('Squall')
  squall,
  @JsonValue('Tornado')
  tornado
}

extension MapToDomain on WeatherConditionModel {
  WeatherCondition toDomain() => WeatherCondition.values.firstWhere(
        (element) => element.name == name,
      );
}
