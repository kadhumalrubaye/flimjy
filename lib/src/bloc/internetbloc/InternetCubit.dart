import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:filmjy/src/constance/enums.dart';
import 'InternetState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription connectivityStreamSubscription;
  InternetCubit(this.connectivity) : super(InternetLoading()) {
    print('internet cubit started');

    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        print('internet cubit is wifi');
        emitInternetConnected(InternetConnectionType.wifi);
      } else if (event == ConnectivityResult.mobile) {
        emitInternetConnected(InternetConnectionType.mobile);
      } else if (event == ConnectivityResult.none) {
        print('internet cubit is none');
        emitInternetDisconnected();
      } else {
        print('connectiom isn not known');
      }
    });
  }

  void emitInternetConnected(InternetConnectionType internetConnectionType) =>
      emit(InternetConnected(connectionType: internetConnectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
