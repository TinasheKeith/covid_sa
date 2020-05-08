import 'package:covid_sa/blocs/covid_event.dart';
import 'package:covid_sa/blocs/covid_state.dart';
import 'package:covid_sa/repositories/covid_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:covid_sa/models/models.dart';

class CovidBloc extends Bloc<CovidStatsEvent, CovidStatsState> {
  final CovidRepository covidRepository;

  CovidBloc({@required this.covidRepository});

  @override
  CovidStatsState get initialState => CovidStatsEmpty();

  @override
  Stream<CovidStatsState> mapEventToState(CovidStatsEvent event) async* {
    if (event is FetchCovidStats) {
      yield CovidStatsLoading();
      try {
        final CountriesSummary countriesSummary =
            await covidRepository.getCovidStats();
        yield CovidStatsLoaded(countriesSummary: countriesSummary);
      } catch (err) {
        print(err.toString());
        yield CovidStatsError();
      }
    }
  }
}
