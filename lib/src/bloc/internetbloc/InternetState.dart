import 'package:equatable/equatable.dart';
import 'package:filmjy/src/constance/enums.dart';

abstract class InternetState extends Equatable {}

class InternetLoading extends InternetState {
  @override
  List<Object> get props => [];
}

class InternetConnected extends InternetState {
  final InternetConnectionType connectionType;

  InternetConnected(this.connectionType);
  @override
  List<Object> get props => [];
}

class InternetDisconnected extends InternetState {
  @override
  List<Object> get props => [];
}
