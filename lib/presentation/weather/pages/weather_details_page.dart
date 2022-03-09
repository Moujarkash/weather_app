import 'package:flutter/material.dart';
import 'package:weather_app/domain/core/entities/city.dart';
import 'package:weather_app/domain/weather/entities/weather_condition.dart';
import 'package:weather_app/domain/weather/entities/weather_data.dart';
import 'package:weather_app/presentation/weather/widgets/weather_info_card.dart';

class WeatherDetailsPage extends StatelessWidget {
  final WeatherData weatherData;
  final DateTime date;
  final City city;

  const WeatherDetailsPage(
      {Key? key,
      required this.weatherData,
      required this.city,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherDetails = weatherData.details.first;

    return Container(
      color: _backgroundColor(context, weatherDetails),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: _backgroundColor(context, weatherDetails),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              top: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weatherDetails.description.replaceAll(' ', '\n'),
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                const SizedBox(
                  height: 32,
                ),
                Center(
                    child: Image.asset(
                  _weatherConditionImagePath(weatherDetails),
                  fit: BoxFit.contain,
                )),
                const Spacer(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            city.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${weatherData.weatherMainInfo.temp.toInt()}\u00B0',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                          ),
                        ],
                      ),
                      WeatherInfoCard(
                        title: 'Wind',
                        value: '${weatherData.wind.speed}m/s',
                      ),
                      WeatherInfoCard(
                        title: 'Humidity',
                        value: '${weatherData.weatherMainInfo.humidity}%',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _backgroundColor(context, weatherDetails) {
    var color = Theme.of(context).backgroundColor;

    switch (weatherDetails.weatherCondition) {
      case WeatherCondition.thunderstorm:
        color = Colors.yellow;
        break;
      case WeatherCondition.rain:
        color = Colors.lightBlue;
        break;
      case WeatherCondition.clear:
        color = _isDay ? Colors.orange : color;
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

  String _weatherConditionImagePath(weatherDetails) {
    var path = 'assets/images/';

    switch (weatherDetails.weatherCondition) {
      case WeatherCondition.thunderstorm:
        path = path + 'storm.png';
        break;
      case WeatherCondition.rain:
        path = path + 'rain.png';
        break;
      case WeatherCondition.clear:
        path = path + (_isDay ? 'sun.png' : 'moon.png');
        break;
      case WeatherCondition.snow:
        path = path + 'snow.png';
        break;
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
        path = path + (_isDay ? 'cloudy-day.png' : 'cloudy-night.png');
        break;
    }

    return path;
  }

  bool get _isDay {
    final currentDate = DateTime(
        date.year, date.month, date.day, date.hour, date.minute, date.second);
    final sunriseDate = DateTime(date.year, date.month, date.day,
        city.sunrise.hour, city.sunrise.minute, city.sunrise.second);
    final sunsetDate = DateTime(date.year, date.month, date.day,
        city.sunset.hour, city.sunset.minute, city.sunset.second);

    return currentDate.isAfter(sunriseDate) && currentDate.isBefore(sunsetDate);
  }
}
