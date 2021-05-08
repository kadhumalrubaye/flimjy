import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:filmjy/src/constance/enums.dart';
import 'InternetState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription connectivityStreamSubscription;
  InternetCubit(InternetLoading state, this.connectivity) : super(state) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == InternetConnectionType.wifi) {
        emitInternetConnected(InternetConnectionType.wifi);
      } else if (event == InternetConnectionType.mobile) {
        emitInternetConnected(InternetConnectionType.mobile);
      } else if (event == InternetConnectionType.none) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(InternetConnectionType internetConnectionType) =>
      emit(InternetConnected(internetConnectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());
}
