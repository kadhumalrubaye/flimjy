import 'package:equatable/equatable.dart';

import '../../../generated/l10n.dart';

abstract class LangState extends Equatable {
  const LangState();
  @override
  List<Object> get props => [];
}

class DefaultLangState extends LangState {
  final S s;

  const DefaultLangState({this.s});
  @override
  List<Object> get props => [s];
}

class ArabicLangState extends LangState {
  final S s;

  const ArabicLangState({this.s});
  @override
  List<Object> get props => [s];
}
