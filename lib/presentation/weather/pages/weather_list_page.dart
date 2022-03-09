import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/application/weather/weather_data/weather_data_bloc.dart';
import 'package:weather_app/config/dependency_injection/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/core/widgets/error_view.dart';
import 'package:weather_app/presentation/weather/widgets/weather_list_item.dart';

class WeatherListPage extends StatefulWidget {
  const WeatherListPage({Key? key}) : super(key: key);

  @override
  State<WeatherListPage> createState() => _WeatherListPageState();
}

class _WeatherListPageState extends State<WeatherListPage> {
  final WeatherDataBloc _weatherDataBloc = getIt<WeatherDataBloc>();

  @override
  void initState() {
    _weatherDataBloc.add(WeatherDataRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: BlocBuilder(
        bloc: _weatherDataBloc,
        builder: (context, state) {
          if (state is WeatherDataFailure) {
            return Center(
              child: ErrorView(
                failure: state.failure,
                onRetry: () {
                  _weatherDataBloc.add(WeatherDataRequested());
                },
              ),
            );
          } else if (state is WeatherDataSuccess) {
            final weatherResponse = state.weatherResponse;

            return Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Text(
                    weatherResponse.city.name,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    'Forecast for incoming days',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final weatherData = weatherResponse.weatherData[index];
                        final weatherDetails = weatherData.details.first;

                        return WeatherListItem(
                          weatherDetails: weatherDetails,
                          date: weatherData.date,
                          onTap: () {},
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 8,
                          ),
                      itemCount: weatherResponse.weatherData.length),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
