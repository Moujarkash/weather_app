import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/config/dependency_injection/injection.dart';
import 'package:weather_app/src/app.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('en', null);

  await configureInjection(Environment.dev);

  runApp(App());
}
