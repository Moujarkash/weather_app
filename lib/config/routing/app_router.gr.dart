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
    },
    WeatherDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<WeatherDetailsPageRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: WeatherDetailsPage(
              key: args.key,
              weatherDetails: args.weatherDetails,
              city: args.city));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(WeatherListPageRoute.name, path: '/'),
        RouteConfig(WeatherDetailsPageRoute.name, path: '/weather-details-page')
      ];
}

/// generated route for
/// [WeatherListPage]
class WeatherListPageRoute extends PageRouteInfo<void> {
  const WeatherListPageRoute() : super(WeatherListPageRoute.name, path: '/');

  static const String name = 'WeatherListPageRoute';
}

/// generated route for
/// [WeatherDetailsPage]
class WeatherDetailsPageRoute
    extends PageRouteInfo<WeatherDetailsPageRouteArgs> {
  WeatherDetailsPageRoute(
      {Key? key, required WeatherDetails weatherDetails, required City city})
      : super(WeatherDetailsPageRoute.name,
            path: '/weather-details-page',
            args: WeatherDetailsPageRouteArgs(
                key: key, weatherDetails: weatherDetails, city: city));

  static const String name = 'WeatherDetailsPageRoute';
}

class WeatherDetailsPageRouteArgs {
  const WeatherDetailsPageRouteArgs(
      {this.key, required this.weatherDetails, required this.city});

  final Key? key;

  final WeatherDetails weatherDetails;

  final City city;

  @override
  String toString() {
    return 'WeatherDetailsPageRouteArgs{key: $key, weatherDetails: $weatherDetails, city: $city}';
  }
}
