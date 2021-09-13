// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flimjy`
  String get appTitle {
    return Intl.message(
      'Flimjy',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get Favorite {
    return Intl.message(
      'Favorite',
      name: 'Favorite',
      desc: '',
      args: [],
    );
  }

  /// `Play`
  String get Play {
    return Intl.message(
      'Play',
      name: 'Play',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get Details {
    return Intl.message(
      'Detail',
      name: 'Details',
      desc: '',
      args: [],
    );
  }

  /// `OverView`
  String get Overview {
    return Intl.message(
      'OverView',
      name: 'Overview',
      desc: '',
      args: [],
    );
  }

  /// `Release date`
  String get ReleaseDate {
    return Intl.message(
      'Release date',
      name: 'ReleaseDate',
      desc: '',
      args: [],
    );
  }

  /// `run time`
  String get RunTime {
    return Intl.message(
      'run time',
      name: 'RunTime',
      desc: '',
      args: [],
    );
  }

  /// `budget`
  String get Budget {
    return Intl.message(
      'budget',
      name: 'Budget',
      desc: '',
      args: [],
    );
  }

  /// `Screenshots`
  String get ScreenShots {
    return Intl.message(
      'Screenshots',
      name: 'ScreenShots',
      desc: '',
      args: [],
    );
  }

  /// `Casts`
  String get Casts {
    return Intl.message(
      'Casts',
      name: 'Casts',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming movies`
  String get Upcoming {
    return Intl.message(
      'Upcoming movies',
      name: 'Upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Trending persons on this week`
  String get TrendingPersonOnThisWeek {
    return Intl.message(
      'Trending persons on this week',
      name: 'TrendingPersonOnThisWeek',
      desc: '',
      args: [],
    );
  }

  /// `New playing`
  String get NewPlaying {
    return Intl.message(
      'New playing',
      name: 'NewPlaying',
      desc: '',
      args: [],
    );
  }

  /// `Top movies`
  String get TopMovies {
    return Intl.message(
      'Top movies',
      name: 'TopMovies',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get History {
    return Intl.message(
      'History',
      name: 'History',
      desc: '',
      args: [],
    );
  }

  /// `Movies`
  String get Movies {
    return Intl.message(
      'Movies',
      name: 'Movies',
      desc: '',
      args: [],
    );
  }

  /// `Watch later`
  String get WatchLater {
    return Intl.message(
      'Watch later',
      name: 'WatchLater',
      desc: '',
      args: [],
    );
  }

  /// `Series`
  String get Series {
    return Intl.message(
      'Series',
      name: 'Series',
      desc: '',
      args: [],
    );
  }

  /// `Not available`
  String get NoOverView {
    return Intl.message(
      'Not available',
      name: 'NoOverView',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong!!!`
  String get something_wrong {
    return Intl.message(
      'Something went wrong!!!',
      name: 'something_wrong',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection!`
  String get no_internet_connection {
    return Intl.message(
      'No internet connection!',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar', countryCode: 'AR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}