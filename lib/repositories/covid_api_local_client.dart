import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:covid_sa/models/models.dart';
import 'package:covid_sa/config_reader.dart';

class CovidApiLocalClient {
  static final String _baseUrl = "http://corona-stats.mobi/api/json.2.0.php?";

  final http.Client httpClient;

  CovidApiLocalClient({@required this.httpClient});

  Future<SouthAfricaStats> getSouthAfricaStats() async {
    final statsResponse = await this.httpClient.get(
          _baseUrl + "key=${ConfigReader.getCovidSaAPIKey()}",
        );

    if (statsResponse.statusCode != 200) {
      throw Exception("Error getting stats");
    }

    final statsJson = jsonDecode(statsResponse.body);
    return SouthAfricaStats.fromJson(statsJson);
  }
}
