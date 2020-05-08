import 'package:flutter/foundation.dart';

import 'package:equatable/equatable.dart';

import 'package:covid_sa/models/models.dart';

abstract class CovidStatsState extends Equatable {
  const CovidStatsState();

  @override
  List<Object> get props => [];
}

class CovidStatsEmpty extends CovidStatsState {}

class CovidStatsLoading extends CovidStatsState {}

class CovidStatsLoaded extends CovidStatsState {
  final CountriesSummary countriesSummary;

  const CovidStatsLoaded({@required this.countriesSummary});

  @override
  List<Object> get props => [countriesSummary];
}

class CovidStatsError extends CovidStatsState {}
