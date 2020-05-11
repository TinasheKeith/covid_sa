import 'dart:io';

import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:covid_sa/blocs/blocs.dart';
import 'package:covid_sa/models/models.dart';
import 'package:covid_sa/repositories/repositories.dart';

class MockCovidRepository extends Mock implements CovidRepository {}

void main() {
  final covidStats = CountriesSummary(
    countrySummaries: [
      Country(
        country: "South Africa",
        countryCode: "za",
        date: DateTime.now(),
        newConfirmed: 1,
        newDeaths: 1,
        newRecovered: 1,
        slug: "/za",
        totalConfirmed: 1,
        totalDeaths: 1,
        totalRecovered: 1,
      ),
    ],
    global: Global(
      newConfirmed: 1,
      newDeaths: 1,
      newRecovered: 1,
      totalConfirmed: 1,
      totalDeaths: 1,
      totalRecovered: 300000,
    ),
  );

  group("CovidBloc", () {
    CovidBloc covidBloc;
    CovidRepository covidRepository;

    setUp(() {
      covidRepository = MockCovidRepository();
      covidBloc = CovidBloc(covidRepository: covidRepository);
    });

    test("throws assertion error if Covid Repository is null", () {
      expect(() => CovidBloc(covidRepository: null), throwsA(isAssertionError));
    });

    group("CovidStats Requested", () {
      blocTest(
        "emits [CovidStatsEmpty, CovidStatsLoading and CovidStatsLoaded] when request added succeeds",
        build: () async {
          when(covidRepository.getCovidStats())
              .thenAnswer((_) async => covidStats);
          return covidBloc;
        },
        act: (bloc) => bloc.add(FetchCovidStats()),
        skip: 0,
        expect: [
          CovidStatsEmpty(),
          CovidStatsLoading(),
          CovidStatsLoaded(
            countriesSummary: covidStats,
          )
        ],
      );

      blocTest(
        "emits [CovidStatsLoading, CovidStatsError] when covid request fails",
        build: () async {
          when(covidRepository.getCovidStats()).thenThrow(
            SocketException("no internet"),
          );
          return covidBloc;
        },
        act: (bloc) => bloc.add(FetchCovidStats()),
        expect: [
          CovidStatsLoading(),
          CovidStatsError(),
        ],
      );
    });
  });
}
