import 'package:covid_sa/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

class CovidApiClient {
  final String _baseUrl = "https://api.covid19api.com";

  final http.Client httpClient;

  CovidApiClient({
    @required this.httpClient,
  });

  Future<CountriesSummary> getCountriesSummary() async {
    final String endpoint = "/summary";

    final covidResponse = await httpClient.get(_baseUrl + endpoint);

    if (covidResponse.statusCode != 200) {
      throw Exception("Error getting covid stats");
    }

    final covidJson = jsonDecode(covidResponse.body);
    return CountriesSummary.fromMap(covidJson);
  }
}
