import 'package:flutter/foundation.dart';

import 'package:equatable/equatable.dart';

import 'package:covid_sa/models/covid_stats_local.dart';

abstract class CovidLocalStatsState extends Equatable {
  const CovidLocalStatsState();

  @override
  List<Object> get props => [];
}

class CovidLocalStatsLoading extends CovidLocalStatsState {}

class CovidLocalStatsLoaded extends CovidLocalStatsState {
  final SouthAfricaStats southAfricaStats;

  const CovidLocalStatsLoaded({@required this.southAfricaStats});

  @override
  List<Object> get props => [southAfricaStats];
}

class CovidLocalStatsError extends CovidLocalStatsState {}
