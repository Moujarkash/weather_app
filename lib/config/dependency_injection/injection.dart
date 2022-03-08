import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/config/dependency_injection/injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String env) async {
  await $initGetIt(getIt, environment: env);
}

Future<void> resetInjection() async {
  await getIt.reset();
}
