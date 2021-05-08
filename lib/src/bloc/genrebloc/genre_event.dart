import 'package:equatable/equatable.dart';

abstract class GenreEvent extends Equatable {
  const GenreEvent();
}

class GenreEventStarted extends GenreEvent {
  const GenreEventStarted();

  @override
  List<Object> get props => [];
}

class GenreEventLoading extends GenreEvent {
  const GenreEventLoading();

  @override
  List<Object> get props => [];
}
