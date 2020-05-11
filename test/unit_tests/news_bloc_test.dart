import 'dart:io';

import 'package:covid_sa/blocs/blocs.dart';
import 'package:covid_sa/blocs/news_bloc.dart';
import 'package:covid_sa/models/models.dart';
import 'package:covid_sa/repositories/news_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  final news = NewsArticles(
    status: "ok",
    articles: [],
    totalResults: 0,
  );

  group("NewsBloc", () {
    NewsRepository newsRepository;
    NewsBloc newsBloc;

    setUp(() {
      newsRepository = MockNewsRepository();
      newsBloc = NewsBloc(newsRepository: newsRepository);
    });

    test("throws Assertion Error if NewsRepository is null", () {
      expect(() => NewsBloc(newsRepository: null), throwsA(isAssertionError));
    });

    group("News Requested", () {
      blocTest(
        "emits [NewsLoading and NewsLoaded] when news request added and succeeds",
        build: () async {
          when(newsRepository.getNewsArticles()).thenAnswer((_) async => news);
          return newsBloc;
        },
        act: (bloc) => bloc.add(FetchNews()),
        skip: 0,
        expect: [
          NewsLoading(), // initial value
          NewsLoading(), // FetchNews event will yield another NewsLoading Event
          NewsLoaded(
            newsArticles: news,
          )
        ],
      );

      blocTest(
        "emits [NewsLoading, NewsError] when news is request fails",
        build: () async {
          when(newsRepository.getNewsArticles()).thenThrow(
            SocketException("no internet exception"),
          );
          return newsBloc;
        },
        act: (bloc) => bloc.add(FetchNews()),
        expect: [
          NewsLoading(),
          NewsError(),
        ],
      );
    });
  });
}
