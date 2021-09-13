import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:filmjy/src/bloc/internetbloc/InternetCubit.dart';
import 'package:filmjy/src/bloc/internetbloc/InternetState.dart';
import 'package:filmjy/src/bloc/userbloc/user_bloc.dart';
import 'package:filmjy/src/ui/error/not_internet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'src/bloc/languagebloc/lang_bloc.dart';
import 'src/bloc/languagebloc/lang_event.dart';
import 'src/bloc/languagebloc/lang_state.dart';
import 'src/bloc/userbloc/user_events.dart';
import 'src/statics/routes.dart';
import 'src/ui/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(App());
}

class App extends StatelessWidget {
  final Connectivity connectivity = Connectivity();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/home',
      onGenerateRoute: Routes.generateRoute,
      onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,

        // GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale(
            'ar', ''), // makes the all app text direction from right to left 😍
      ],
      theme: buildThemeData(),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            // lazy: false,
            create: (context) => UserBloc(),
          ),
          BlocProvider<LangBloc>(
            // lazy: false,
            create: (context) => LangBloc()..add(DefaultLang()),
          ),
          BlocProvider<InternetCubit>(
            // lazy: false,
            create: (context) => InternetCubit(connectivity),
          ),
        ],
        // child: BlocBuilder<LangBloc, LangState>(
        //   builder: (context, state) {
        //     return HomeScreen();
        //   },
        // ),
        child: Builder(builder: (context) {
          if (context.watch<InternetCubit>().state is InternetDisconnected) {
            return Container(
              child: NotInternetScreen(),
            );
          } else {
            return BlocBuilder<LangBloc, LangState>(builder: (context, state) {
              return HomeScreen();
            });
          }
        }),
      ),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      popupMenuTheme: PopupMenuThemeData(
        color: Color.fromRGBO(32, 142, 231, 1.0),
      ),
      // brightness: Brightness.light,
      textTheme: TextTheme(
        subtitle2: TextStyle(color: Colors.yellow[800]),
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white),
        headline4: TextStyle(color: Colors.white),
        headline5: TextStyle(color: Colors.white),
        headline6: TextStyle(color: Colors.yellow[800]),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
        button: TextStyle(color: Colors.white),
        caption: TextStyle(
          color: Colors.white,
        ),
      ),
      scaffoldBackgroundColor: Color.fromRGBO(21, 35, 62, 1.0),

      // secondaryHeaderColor: ,
      // textButtonTheme: TextButtonThemeData(
      //   style: TextButton.styleFrom(primary: Colors.white),
      // ),
      buttonColor: Color.fromRGBO(245, 67, 55, 1.0), //button orange
      focusColor: Color.fromRGBO(194, 53, 43, 1.0), //darker than button

      // brightness: Brightness.dark,
      primaryColor: Color.fromRGBO(21, 35, 62, 1.0),
      accentColor: Color.fromRGBO(245, 67, 5, 1.0),
    );
  }
}
