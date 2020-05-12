import 'dart:async';

import 'package:meta/meta.dart';
import 'package:covid_sa/models/models.dart';
import 'package:covid_sa/repositories/covid_api_local_client.dart';

class CovidLocalRepository {
  final CovidApiLocalClient covidApiClient;

  CovidLocalRepository({@required this.covidApiClient});

  Future<SouthAfricaStats> getCovidStats() async {
    return covidApiClient.getSouthAfricaStats();
  }
}
