import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class MovieEventStarted extends MovieEvent {
  final int movieId;
  final String query;
  const MovieEventStarted(this.movieId, this.query);

  @override
  List<Object> get props => [];
}

class GetTopMoviesListEvent extends MovieEvent {
  const GetTopMoviesListEvent();

  List<Object> get props => [];
}

class GetUpcomingMovieListEvent extends MovieEvent {
  const GetUpcomingMovieListEvent();

  List<Object> get props => [];
}

class GetSeriesListEvent extends MovieEvent {
  const GetSeriesListEvent();

  List<Object> get props => [];
}

class GetMoviesEvent extends MovieEvent {
  const GetMoviesEvent();

  List<Object> get props => [];
}
