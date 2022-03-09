import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/domain/core/entities/city.dart';
import 'package:weather_app/domain/weather/entities/weather_details.dart';
import 'package:weather_app/presentation/weather/pages/weather_details_page.dart';
import 'package:weather_app/presentation/weather/pages/weather_list_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: WeatherListPage, initial: true),
    AutoRoute(page: WeatherDetailsPage)
  ],
)
class AppRouter extends _$AppRouter {}
