import 'package:equatable/equatable.dart';

import '../../model/movie.dart';
import '../../model/series_model.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

//initial state
class MovieLoading extends MovieState {}

//load movies
class MovieLoaded extends MovieState {
  final List<Movie> movieList;
  const MovieLoaded(this.movieList);

  @override
  List<Object> get props => [movieList];
}

class TopMoviesState extends MovieState {
  final List<Movie> topMovieList;
  const TopMoviesState({this.topMovieList});

  @override
  List<Object> get props => [topMovieList];
}

class GetUpcomingMovieListState extends MovieState {
  final List<Movie> getUpcomingMovieListState;
  const GetUpcomingMovieListState({this.getUpcomingMovieListState});

  @override
  List<Object> get props => [getUpcomingMovieListState];
}

class GetSeriesListState extends MovieState {
  final List<SeriesModel> seriesList;
  const GetSeriesListState({this.seriesList});

  @override
  List<Object> get props => [seriesList];
}

//when error occure this state will executed
class MovieError extends MovieState {}

class GetMoviesState extends MovieState {
  final List<Movie> getMoviesState;
  const GetMoviesState({this.getMoviesState});

  @override
  List<Object> get props => [getMoviesState];
}
