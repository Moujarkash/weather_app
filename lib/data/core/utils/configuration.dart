import 'package:injectable/injectable.dart';

abstract class Configuration {
  String get baseUrl;

  String get imageUrl;

  String get apiKey;
}

@LazySingleton(as: Configuration, env: [Environment.dev])
class DevConfiguration implements Configuration {
  @override
  String get baseUrl => 'https://api.openweathermap.org';

  @override
  String get apiKey => 'c8cd7994041ffa9350ff73b2c2143ee6';

  @override
  String get imageUrl => 'http://openweathermap.org/img/wn/';
}

@LazySingleton(as: Configuration, env: [Environment.prod])
class ProductionConfiguration implements Configuration {
  @override
  String get baseUrl => 'https://api.openweathermap.org';

  @override
  String get apiKey => 'c8cd7994041ffa9350ff73b2c2143ee6';

  @override
  String get imageUrl => 'http://openweathermap.org/img/wn/';
}
