import 'package:equatable/equatable.dart';

import '../../model/movie.dart';
import '../../model/user_model.dart';

abstract class UserEvent extends Equatable {}

//events
class LoadingUserEvent extends UserEvent {
  @override
  List<Object> get props => [];
}

class CreateUserEvent extends UserEvent {
  final UserModel user;

  CreateUserEvent({this.user});

  @override
  List<Object> get props => [user];
}

class GetUserEvent extends UserEvent {
  @override
  List<Object> get props => [];
}

class AddUserHistoryEvent extends UserEvent {
  final Movie movie;

  AddUserHistoryEvent(this.movie);

  @override
  List<Object> get props => [];
}

class GetUserHistoryEvent extends UserEvent {
  @override
  List<Object> get props => [];
}

class AddUserWatchLaterEvent extends UserEvent {
  final Movie movie;

  AddUserWatchLaterEvent(this.movie);
  @override
  List<Object> get props => [];
}

class GetUserWatchLaterEvent extends UserEvent {
  @override
  List<Object> get props => [];
}

class AddUserFavoriteEvent extends UserEvent {
  final Movie movie;

  AddUserFavoriteEvent(this.movie);
  @override
  List<Object> get props => [];
}

class GetUserFavoriteEvent extends UserEvent {
  @override
  List<Object> get props => [];
}
