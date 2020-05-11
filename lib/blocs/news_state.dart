import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:covid_sa/models/models.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final NewsArticles newsArticles;

  const NewsLoaded({@required this.newsArticles});

  @override
  List<Object> get props => [newsArticles];
}

class NewsError extends NewsState {}
