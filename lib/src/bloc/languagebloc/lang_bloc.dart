import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../service/api_service.dart';
import 'lang_event.dart';
import 'lang_state.dart';

class LangBloc extends Bloc<LangEvent, LangState> {
  LangBloc() : super(DefaultLangState());
  ApiService service = ApiService();

  @override
  Stream<LangState> mapEventToState(LangEvent event) async* {
    if (event is DefaultLang) {
      ApiService.lang = '';
      S.load(Locale('en', 'EN'));
      print('language setted to default');
      S s = S();
      yield DefaultLangState(s: s);
    } else if (event is ChangeLangToArabic) {
      ApiService.lang = '&language=ar-sa';
      S.load(Locale('ar', 'AR'));
      S s = S();
//FIXME not all widget should reloded when language changes , only Text widget that holds the titles
      print('language changed to arabic');
      yield ArabicLangState(s: s); // Text(s.title)
    }
  }
}
