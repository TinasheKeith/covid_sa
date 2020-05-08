import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {}

class FetchNews extends NewsEvent {
  // final News
  List<Object> get props => [];
}
