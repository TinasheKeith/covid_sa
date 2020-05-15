import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:covid_sa/models/models.dart';
import 'package:covid_sa/config_reader.dart';

class CovidApiLocalClient {
  static final String _baseUrl = "https://covid-sa-server.herokuapp.com/";

  final http.Client httpClient;

  CovidApiLocalClient({@required this.httpClient});

  Future<SouthAfricaStats> getSouthAfricaStats() async {
    print("RUNNING FETCH SA STATS");

    final statsResponse = await this.httpClient.get(
          _baseUrl,
        );

    if (statsResponse.statusCode != 200) {
      print(statsResponse.headers);
      throw Exception("Error getting stats");
    }

    final statsJson = jsonDecode(statsResponse.body);
    return SouthAfricaStats.fromJson(statsJson);
  }
}
