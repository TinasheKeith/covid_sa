import 'package:equatable/equatable.dart';

class CountriesSummary extends Equatable {
  final Global global;
  final List<Country> countrySummaries;

  CountriesSummary({this.global, this.countrySummaries});

  factory CountriesSummary.fromMap(Map data) {
    List countries = data["Countries"];

    countries = countries.map((country) => Country.fromMap(country)).toList();

    return CountriesSummary(
      global: Global.fromMap(data["Global"]),
      countrySummaries: countries,
    );
  }

  @override
  List<Object> get props => [
        global,
        countrySummaries,
      ];
}

class Global {
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;

  Global({
    this.newConfirmed,
    this.newDeaths,
    this.newRecovered,
    this.totalConfirmed,
    this.totalDeaths,
    this.totalRecovered,
  });

  factory Global.fromMap(Map data) {
    return Global(
      newConfirmed: data["NewConfirmed"],
      totalConfirmed: data["TotalConfirmed"],
      newDeaths: data["NewDeaths"],
      newRecovered: data["NewRecovered"],
      totalDeaths: data["TotalDeaths"],
      totalRecovered: data["TotalRecovered"],
    );
  }
}

class Country {
  final String country;
  final DateTime date;
  final String countryCode;
  final String slug;
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;

  Country({
    this.country,
    this.date,
    this.countryCode,
    this.slug,
    this.newRecovered,
    this.totalRecovered,
    this.totalDeaths,
    this.totalConfirmed,
    this.newDeaths,
    this.newConfirmed,
  });

  factory Country.fromMap(Map data) {
    return Country(
      country: data["Country"],
      countryCode: data["CountryCode"],
      date: DateTime.parse(data["Date"]),
      slug: data["Slug"],
      newConfirmed: data["NewConfirmed"],
      totalConfirmed: data["TotalConfirmed"],
      newDeaths: data["NewDeaths"],
      newRecovered: data["NewRecovered"],
      totalDeaths: data["TotalDeaths"],
      totalRecovered: data["TotalRecovered"],
    );
  }
}

class ConfirmedFromDayOne {
  final List<ConfirmedCase> confirmedCases;

  ConfirmedFromDayOne({this.confirmedCases});

  factory ConfirmedFromDayOne.fromMap(List data) {
    List confirmed = data;

    List<ConfirmedCase> cases = confirmed.map((confCase) {
      return ConfirmedCase.fromMap(confCase);
    }).toList();

    return ConfirmedFromDayOne(confirmedCases: cases);
  }
}

class ConfirmedCase {
  final String country;
  final String countryCode;
  final String lat;
  final String long;
  final int cases;
  final String status;
  final DateTime date;

  ConfirmedCase({
    this.country,
    this.countryCode,
    this.lat,
    this.long,
    this.cases,
    this.date,
    this.status,
  });

  factory ConfirmedCase.fromMap(Map data) {
    return ConfirmedCase(
      country: data["Country"],
      countryCode: data["CountryCode"],
      lat: data["Lat"],
      long: data["Long"],
      cases: data["Cases"],
      date: DateTime.parse(data["Date"]),
      status: data["Status"],
    );
  }
}
