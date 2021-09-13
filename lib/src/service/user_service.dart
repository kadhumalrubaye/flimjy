import 'package:filmjy/src/model/movie.dart';
import 'package:filmjy/src/model/user_model.dart';

class UserService {
  final UserModel _user;

  UserService(this._user);
  void addHistoryMove(Movie movie) {
    _user.history.add(movie);
  }

  List<Movie> get userHistory => this._user.history;
}
