import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' show Client;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covid_sa/main.dart';
import 'package:covid_sa/blocs/blocs.dart';
import 'package:covid_sa/repositories/repositories.dart';
import 'package:covid_sa/environments/environment.dart';

import 'package:covid_sa/config_reader.dart';

String appTitle;

Future<void> mainCommon(String env) async {
  NewsRepository _newsRepository = NewsRepository(
    newsApiClient: NewsApiClient(
      httpClient: Client(),
    ),
  );

  CovidRepository _covidRepository = CovidRepository(
    covidApiClient: CovidApiClient(
      httpClient: Client(),
    ),
  );

  CovidLocalRepository _covidLocalRepository = CovidLocalRepository(
    covidApiClient: CovidApiLocalClient(
      httpClient: Client(),
    ),
  );

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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NewsBloc(newsRepository: _newsRepository),
          ),
          BlocProvider(
            create: (context) => CovidBloc(covidRepository: _covidRepository),
          ),
          BlocProvider(
            create: (context) => CovidLocalStatsBloc(
                covidLocalRepository: _covidLocalRepository),
          ),
        ],
        child: App(),
      ),
    ),
  );
}
