import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:covid_sa/config_reader.dart';
import 'package:covid_sa/models/models.dart';

class NewsApiClient {
  static final baseUrl =
      "https://newsapi.org/v2/top-headlines?q=corona&country=za&apiKey=${ConfigReader.getNewsAPIKey()}";

  final http.Client httpClient;

  NewsApiClient({
    @required this.httpClient,
  });

  Future<NewsArticles> getArticles() async {
    final newsResponse = await this.httpClient.get(baseUrl);

    if (newsResponse.statusCode != 200) {
      throw Exception("Error getting news articles");
    }

    final newsJson = jsonDecode(newsResponse.body);
    return NewsArticles.fromJson(newsJson);
  }
}
