
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/weather/pages/weather_list_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: WeatherListPage, initial: true)
  ],
)
class AppRouter extends _$AppRouter {}
