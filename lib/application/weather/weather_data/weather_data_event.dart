part of 'weather_data_bloc.dart';

@immutable
abstract class WeatherDataEvent {}

class WeatherDataRequested extends WeatherDataEvent {}
