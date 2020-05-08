import 'dart:async';

import 'package:meta/meta.dart';
import 'package:covid_sa/models/models.dart';
import 'package:covid_sa/repositories/covid_api_client.dart';

class CovidRepository {
  final CovidApiClient covidApiClient;

  CovidRepository({@required this.covidApiClient});

  Future<CountriesSummary> getCovidStats() async {
    return covidApiClient.getCountriesSummary();
  }
}
