import 'package:filmjy/src/bloc/genrebloc/genre_bloc.dart';
import 'package:filmjy/src/bloc/genrebloc/genre_event.dart';
import 'package:filmjy/src/bloc/moviebloc/movie_bloc.dart';
import 'package:filmjy/src/bloc/personbloc/person_bloc.dart';
import 'package:filmjy/src/bloc/personbloc/person_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/languagebloc/lang_bloc.dart';
import '../../bloc/languagebloc/lang_event.dart';

enum Language { arabic, english }

class SettingWidget extends StatefulWidget {
  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Language>(
      padding: EdgeInsets.all(5),
      offset: Offset(0, -100),
      icon: Icon(
        Icons.language,
        color: Color.fromRGBO(32, 142, 231, 1.0),
      ),
      onSelected: (Language result) {
        switch (result) {
          case Language.arabic:
            BlocProvider.of<GenreBloc>(context)..add(GenreEventStarted());
            BlocProvider.of<LangBloc>(context)..add(ChangeLangToArabic());
            break;
          case Language.english:
            BlocProvider.of<LangBloc>(context)..add(DefaultLang());
            BlocProvider.of<GenreBloc>(context)..add(GenreEventStarted());
            break;
          default:
            BlocProvider.of<LangBloc>(context)..add(DefaultLang());
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
        const PopupMenuItem<Language>(
          value: Language.arabic,
          child: Text('العربية'),
        ),
        const PopupMenuItem<Language>(
          value: Language.english,
          child: Text('English'),
        ),
      ],
    );
  }
}
// This is the type used by the popup menu below.

// This menu button widget updates a _selection field (of type Language,
// not shown here).
