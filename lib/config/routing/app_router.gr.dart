// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    WeatherListPageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const WeatherListPage());
    }
  };

  @override
  List<RouteConfig> get routes =>
      [RouteConfig(WeatherListPageRoute.name, path: '/')];
}

/// generated route for
/// [WeatherListPage]
class WeatherListPageRoute extends PageRouteInfo<void> {
  const WeatherListPageRoute() : super(WeatherListPageRoute.name, path: '/');

  static const String name = 'WeatherListPageRoute';
}
