import 'package:equatable/equatable.dart';

abstract class CovidLocalStatsEvent extends Equatable {}

class FetchCovidLocalStats extends CovidLocalStatsEvent {
  @override
  List<Object> get props => [];
}
