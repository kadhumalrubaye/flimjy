import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  List<Object> get props => [];
}

class SearchLoadingEvent extends SearchEvent {}
// class SearchStartEvent extends SearchEvent {
// final String
// List<Object> get props => [];
// }
