import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:covid_sa/repositories/repositories.dart';
import 'package:covid_sa/models/models.dart';
import 'package:covid_sa/blocs/blocs.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc({@required this.newsRepository}) : assert(newsRepository != null);

  @override
  NewsState get initialState => NewsEmpty();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchNews) {
      yield NewsLoading();
      try {
        final NewsArticles newsArticles =
            await newsRepository.getNewsArticles();
        yield NewsLoaded(newsArticles: newsArticles);
      } catch (err) {
        print(err.toString());
        yield NewsError();
      }
    }
  }
}
