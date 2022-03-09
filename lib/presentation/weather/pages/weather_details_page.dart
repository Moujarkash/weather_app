import 'package:flutter/material.dart';
import 'package:weather_app/domain/core/entities/city.dart';
import 'package:weather_app/domain/weather/entities/weather_condition.dart';
import 'package:weather_app/domain/weather/entities/weather_details.dart';

class WeatherDetailsPage extends StatelessWidget {
  final WeatherDetails weatherDetails;
  final City city;

  const WeatherDetailsPage(
      {Key? key, required this.weatherDetails, required this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: _backgroundColor(context),
          body: Column(
            children: [
              
            ],
          ),
        ),
      ),
    );
  }

  Color _backgroundColor(context) {
    var color = Theme.of(context).backgroundColor;

    switch (weatherDetails.weatherCondition) {
      case WeatherCondition.thunderstorm:
        color = Colors.yellow;
        break;
      case WeatherCondition.rain:
        color = Colors.lightBlue;
        break;
      case WeatherCondition.clear:
        break;
      case WeatherCondition.snow:
      case WeatherCondition.drizzle:
      case WeatherCondition.clouds:  
      case WeatherCondition.mist:
      case WeatherCondition.smoke:
      case WeatherCondition.haze:
      case WeatherCondition.dust:
      case WeatherCondition.fog:
      case WeatherCondition.sand:
      case WeatherCondition.ash:
      case WeatherCondition.squall:
      case WeatherCondition.tornado:
        color = Colors.grey;
        break;
    }

    return color;
  }
}
