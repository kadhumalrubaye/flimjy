import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/movie.dart';
import '../../model/series_model.dart';
import '../../service/api_service.dart';
import 'movie_bloc_event.dart';
import 'movie_bloc_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieLoading()) {
    //initialize InternNetStreamSubscription=InternetCubit.listen((internetState){
    //if (wifi is on) incremetn();
    //})
    ///you need to close this manual
    ///@ovverride
    ///InternetStreamSubscription.cancel();
  }
  final ApiService service = ApiService();

  ///initialize streamSubscribtion inside this constructor

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is MovieEventStarted) {
      yield* _mapMovieEventStateToState(event.movieId, event.query, service);
    } else if (event is GetTopMoviesListEvent) {
      final List<Movie> movieList = await service.getTopRatedMovies();
      yield TopMoviesState(topMovieList: movieList);
    } else if (event is GetUpcomingMovieListEvent) {
      final List<Movie> movieList = await service.getUpComingMovies();
      yield GetUpcomingMovieListState(getUpcomingMovieListState: movieList);
    } else if (event is GetSeriesListEvent) {
      final List<SeriesModel> seriesList = await service.getSeriesList();
      yield GetSeriesListState(seriesList: seriesList);
    } else if (event is GetMoviesEvent) {
      final List<Movie> moviesList = await service.getMovies();
      yield GetMoviesState(getMoviesState: moviesList);
    } else if (event is ErrorEvent) {
      print('movie error accurse ');
      yield MovieError();
    }
  }
}

Stream<MovieState> _mapMovieEventStateToState(
    int movieId, String query, ApiService service) async* {
  yield MovieLoading();
  try {
    List<Movie> movieList;
    if (movieId == 0) {
      movieList = await service.getNowPlayingMovie();
    } else {
      //print(movieId);
      movieList = await service.getMovieByGenre(movieId);
    }

    yield MovieLoaded(movieList);
  } on Exception catch (e) {
    print(e);
    yield MovieError();
  }
}
