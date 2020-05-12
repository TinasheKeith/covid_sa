import 'package:equatable/equatable.dart';
import 'package:covid_sa/models/covid_stats_local.dart';
import 'package:flutter/widgets.dart';

abstract class CovidLocalStatsState extends Equatable {
  const CovidLocalStatsState();

  @override
  List<Object> get props => [];
}

class CovidLocalStatsLoading extends CovidLocalStatsState {
  @override
  List<Object> get props => [];
}

class CovidLocalStatsLoaded extends CovidLocalStatsState {
  final SouthAfricaStats southAfricaStats;

  const CovidLocalStatsLoaded({@required this.southAfricaStats});

  @override
  List<Object> get props => [southAfricaStats];
}

class CovidLocalStatsError extends CovidLocalStatsState {}
