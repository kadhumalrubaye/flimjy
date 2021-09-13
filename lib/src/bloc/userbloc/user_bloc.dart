import 'package:filmjy/src/model/movie.dart';
import 'package:filmjy/src/model/user_model.dart';
import 'package:filmjy/src/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_events.dart';
import 'user_state.dart';

class UserBloc extends Cubit<UserState> {
  final UserService _userService =
      UserService(UserModel('kadhum', '12355', [], [], []));
  UserBloc() : super(new UserLoadingState());

  void emitHistory(Movie movie) {
    historyList.add(movie);
    emit(UserHistoryList(historyList));
    print('history added ${historyList.length}');
  }

  // @override
  // Stream<UserState> mapEventToState(UserEvent event) async* {
  //   if (event is AddUserHistoryEvent)
  //     // this._userService.addHistoryMove(event.movie);
  //     historyList.add(event.movie);
  //   else if (event is GetUserHistoryEvent) {
  //     // final List<Movie> movieList = this._userService.userHistory;
  //     yield UserHistoryList(historyList);
  //   }
  // }
}

final List<Movie> historyList = [];
