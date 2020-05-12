import 'package:flutter/foundation.dart';

import 'package:bloc/bloc.dart';

import 'package:covid_sa/blocs/blocs.dart';
import 'package:covid_sa/models/models.dart';
import 'package:covid_sa/repositories/repositories.dart';

class CovidLocalStatsBloc
    extends Bloc<CovidLocalStatsEvent, CovidLocalStatsState> {
  CovidLocalRepository covidLocalRepository;

  CovidLocalStatsBloc({@required this.covidLocalRepository});

  @override
  CovidLocalStatsState get initialState => CovidLocalStatsLoading();

  @override
  Stream<CovidLocalStatsState> mapEventToState(
      CovidLocalStatsEvent event) async* {
    if (event is FetchCovidLocalStats) {
      yield CovidLocalStatsLoading();

      try {
        final SouthAfricaStats southAfricaStats =
            await covidLocalRepository.getCovidStats();
        yield CovidLocalStatsLoaded(southAfricaStats: southAfricaStats);
      } catch (err) {
        print(err.toString());
      }
    }
  }
}
