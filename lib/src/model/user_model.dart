import 'movie.dart';

class UserModel {
  final String name;
  final String password;
  final List<Movie> history;

  final List<Movie> watchLater;
  final List<Movie> favorite;

  UserModel(
      this.name, this.password, this.history, this.watchLater, this.favorite);
}
