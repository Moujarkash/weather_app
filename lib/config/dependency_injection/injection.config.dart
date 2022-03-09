// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;
import 'package:logger/logger.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../application/weather/weather_data/weather_data_bloc.dart' as _i15;
import '../../data/core/utils/configuration.dart' as _i3;
import '../../data/core/utils/network_info_impl.dart' as _i8;
import '../../data/weather/data_sources/local/weather_local_data_source.dart'
    as _i10;
import '../../data/weather/data_sources/remote/weather_remote_data_source.dart'
    as _i11;
import '../../data/weather/repositories/weather_repository_impl.dart' as _i13;
import '../../domain/core/utils/network_info.dart' as _i7;
import '../../domain/weather/repositories/weather_repository.dart' as _i12;
import '../../domain/weather/use_cases/get_weather_data_use_case.dart' as _i14;
import 'injectable_module.dart' as _i16;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Configuration>(() => _i3.DevConfiguration(),
      registerFor: {_dev});
  gh.lazySingleton<_i3.Configuration>(() => _i3.ProductionConfiguration(),
      registerFor: {_prod});
  gh.lazySingleton<_i4.Dio>(() => injectableModule.dioInstance);
  gh.lazySingleton<_i5.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.lazySingleton<_i6.Logger>(() => injectableModule.logger);
  gh.lazySingleton<_i7.NetworkInfo>(
      () => _i8.NetworkInfoImpl(get<_i5.InternetConnectionChecker>()));
  await gh.lazySingletonAsync<_i9.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true);
  gh.lazySingleton<_i10.WeatherLocalDataSource>(
      () => _i10.WeatherLocalDataSourceImpl(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i11.WeatherRemoteDataSource>(() =>
      _i11.WeatherRemoteDataSourceImpl(
          get<_i4.Dio>(), get<_i3.Configuration>()));
  gh.lazySingleton<_i12.WeatherRepository>(() => _i13.WeatherRepositoryImpl(
      get<_i11.WeatherRemoteDataSource>(),
      get<_i10.WeatherLocalDataSource>(),
      get<_i7.NetworkInfo>(),
      get<_i3.Configuration>(),
      get<_i6.Logger>()));
  gh.lazySingleton<_i14.GetWeatherDataUseCase>(
      () => _i14.GetWeatherDataUseCase(get<_i12.WeatherRepository>()));
  gh.factory<_i15.WeatherDataBloc>(
      () => _i15.WeatherDataBloc(get<_i14.GetWeatherDataUseCase>()));
  return get;
}

class _$InjectableModule extends _i16.InjectableModule {}
