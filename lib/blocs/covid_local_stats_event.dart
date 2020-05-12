import 'package:equatable/equatable.dart';

abstract class CovidLocalStatsEvent extends Equatable {
  const CovidLocalStatsEvent();
  @override
  List<Object> get props => [];
}

class FetchCovidLocalStats extends CovidLocalStatsEvent {
  @override
  List<Object> get props => [];
}
