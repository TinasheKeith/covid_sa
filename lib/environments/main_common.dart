import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:covid_sa/main.dart';
import 'package:covid_sa/config_reader.dart';
import 'package:covid_sa/environments/environment.dart';

String appTitle;

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialise();

  switch (env) {
    case Environment.dev:
      appTitle = "COVIDSA-DEV";
      break;
    case Environment.prod:
      appTitle = "COVIDSA";
      break;
  }

  runApp(
    Provider.value(
      value: appTitle,
      child: App(),
    ),
  );
}
