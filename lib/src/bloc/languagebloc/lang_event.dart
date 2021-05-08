import 'package:equatable/equatable.dart';

abstract class LangEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeLangToArabic extends LangEvent {}

class DefaultLang extends LangEvent {}
