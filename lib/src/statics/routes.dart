import 'package:filmjy/src/ui/history_screen.dart';
import 'package:filmjy/src/ui/profile_screen.dart';
import 'package:flutter/material.dart';

import '../ui/descover_movies_screen.dart';
import '../ui/home_screen.dart';
import '../ui/movie_detail_screen.dart';
import '../ui/search_screen.dart';
import '../ui/series_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteName.seriesScreen:
        return MaterialPageRoute(builder: (_) => TvSeriesScreen());
      case RouteName.searchScreen:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case RouteName.movieDetailScreen:
        return MaterialPageRoute(builder: (_) => MovieDetailScreen());
      case RouteName.moviesScreen:
        return MaterialPageRoute(builder: (_) => DiscoverMovieScreen());
      case RouteName.history:
        return MaterialPageRoute(builder: (_) => HistoryScreen());
      case RouteName.profileScreen:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case RouteName.movieDetailScreen:
        return MaterialPageRoute(
          builder: (_) => MovieDetailScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static Map<String, WidgetBuilder> _getCombinedRoutes() => {};

  static Map<String, WidgetBuilder> getAll() => _getCombinedRoutes();
}

class RouteName {
  // static const initial = '/splash';
  static const homeScreen = '/home';
  static const movieDetailScreen = '/movieDetail';
  static const seriesScreen = '/series';
  static const moviesScreen = '/movies';
  static const profileScreen = '/profile';
  static const searchScreen = '/search';
  static const history = '/history';
}
