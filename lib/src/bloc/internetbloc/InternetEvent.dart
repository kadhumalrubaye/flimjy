import 'package:equatable/equatable.dart';

abstract class InternetEvent extends Equatable {}

class NoInternetEvent extends InternetEvent {
  @override
  List<Object> get props => [];
}
