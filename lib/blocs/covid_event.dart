import 'package:equatable/equatable.dart';

abstract class CovidStatsEvent extends Equatable {}

class FetchCovidStats extends CovidStatsEvent {
  @override
  List<Object> get props => [];
}
