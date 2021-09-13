import 'package:equatable/equatable.dart';
import 'package:filmjy/src/model/movie.dart';

class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {}

class UserHistoryList extends UserState {
  final List<Movie> history;

  UserHistoryList(this.history);
  @override
  List<Object> get props => [];
}
