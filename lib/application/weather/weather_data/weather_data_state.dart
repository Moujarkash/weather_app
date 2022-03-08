part of 'weather_data_bloc.dart';

@immutable
abstract class WeatherDataState {}

class WeatherDataInitial extends WeatherDataState {}

class WeatherDataInProgress extends WeatherDataState {}

class WeatherDataFailure extends WeatherDataState {
  final Failure failure;

  WeatherDataFailure(this.failure);
}

class WeatherDataSuccess extends WeatherDataState {
  final WeatherResponse weatherResponse;

  WeatherDataSuccess(this.weatherResponse);
}
