import 'package:weather_app/domain/core/entities/coordinate.dart';

class City {
  final int id;
  final String name;
  final Coordinate coordinate;
  final String country;
  final int timezone;

  City(this.id, this.name, this.coordinate, this.country, this.timezone);
}