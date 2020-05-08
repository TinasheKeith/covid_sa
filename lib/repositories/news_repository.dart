import 'dart:async';

import 'package:meta/meta.dart';

import 'package:covid_sa/models/models.dart';
import 'package:covid_sa/repositories/news_api_client.dart';

class NewsRepository {
  final NewsApiClient newsApiClient;

  NewsRepository({@required this.newsApiClient});

  Future<NewsArticles> getNewsArticles() async {
    return newsApiClient.getArticles();
  }
}
