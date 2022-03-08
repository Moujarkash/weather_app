import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/config/dependency_injection/injection.dart';
import 'package:weather_app/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection(Environment.dev);

  runApp(App());
}
