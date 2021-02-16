import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:teste_ewally/app/app_module.dart';
import 'package:teste_ewally/shared/constants/app.dart';
import 'package:teste_ewally/shared/util/session.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting(appLocale);
  bool isAuthenticated = await Session.isAuthenticated();

  runApp(
    AppModule(isAuthenticated: isAuthenticated),
  );
}
