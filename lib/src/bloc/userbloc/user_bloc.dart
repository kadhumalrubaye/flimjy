import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_events.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(new UserLoadingState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) {
    throw UnimplementedError();
  }
}
