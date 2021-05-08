import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmjy/src/bloc/genrebloc/genre_bloc.dart';
import 'package:filmjy/src/bloc/genrebloc/genre_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';
import '../bloc/moviebloc/movie_bloc.dart';
import '../bloc/moviebloc/movie_bloc_event.dart';
import '../bloc/moviebloc/movie_bloc_state.dart';
import '../bloc/personbloc/person_bloc.dart';
import '../bloc/personbloc/person_event.dart';
import '../model/movie.dart';
import '../statics/routes.dart';
import 'category_screen.dart';
import 'movie_detail_screen.dart';
import 'widgets/navigation_bar_widget.dart';
import 'widgets/top_movies_widget.dart';
import 'widgets/trending_person_on_this_week_wedgit.dart';
import 'widgets/upcoming_widget.dart';

class HomeScreen extends StatelessWidget {
  //  final GlobalKey<ScaffoldState> _homeScaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // S.load(Locale('ar', 'AR'));
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (_) => MovieBloc()..add(MovieEventStarted(0, '')),
        ),
        BlocProvider<GenreBloc>(
          create: (_) => GenreBloc()..add(GenreEventStarted()),
        ),
        BlocProvider<PersonBloc>(
          create: (_) => PersonBloc()..add(PersonEventStated()),
        ),
      ],
      child: Scaffold(
        // drawer: DrawerWidget(),
        appBar: AppBar(
          // leading: Image.asset(
          //   'assets/images/filmjylogo.png',
          //   height: 20.0,
          //   fit: BoxFit.cover,
          // ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          // leading: Icon(
          //   Icons.menu,
          //   color: Colors.black45,
          // ),
          // title: Text(
          //   'Filmjy',
          //   style: Theme.of(context).textTheme.headline6,
          // ),
          leading: Container(
            margin: EdgeInsets.all(5.0),
            child: Image.asset(
              'assets/images/filmjylogo.png',
            ),
          ),
          //
          actions: [
            Expanded(
              flex: 0,
              // height: MediaQuery.of(context).size.height * 0.0,
              // width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(S.of(context).WatchLater.toString()),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(S.of(context).History),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.moviesScreen);
                    },
                    child: Text(S.of(context).Movies),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.seriesScreen);
                    },
                    child: Text(S.of(context).Series),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15),
              child: IconButton(
                icon: Icon(
                  Icons.search_sharp,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.searchScreen);
                },
              ),
            ),
          ],
        ),
        body: _buildBody(context),
        bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BlocBuilder<MovieBloc, MovieState>(
                  builder: (context, state) {
                    if (state is MovieLoading) {
                      return Center(
                        child: Platform.isAndroid
                            ? CircularProgressIndicator()
                            : CupertinoActivityIndicator(),
                      );
                    } else if (state is MovieLoaded) {
                      List<Movie> movies = state.movieList;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider.builder(
                            itemCount: movies.length,
                            itemBuilder: (BuildContext context, int index) {
                              Movie movie = movies[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailScreen(movie: movie),
                                    ),
                                  );
                                },
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: <Widget>[
                                    ClipRRect(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Platform.isAndroid
                                                ? CircularProgressIndicator()
                                                : CupertinoActivityIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/img_not_found.jpg'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 15,
                                        left: 15,
                                      ),
                                      child: Text(
                                        movie.title.toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontFamily: 'muli',
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            options: CarouselOptions(
                              enableInfiniteScroll: true,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 5),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              pauseAutoPlayOnTouch: true,
                              viewportFraction: 0.8,
                              enlargeCenterPage: true,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 12,
                                ),
                                NewPlayingBuildWidgetCategory(),
                                UpcomingMoviesWidget(),
                                TopMoviesWidget(),
                                TrendingPersonsOnThisWeekBlocBuilder(),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      // return Container(
                      //   child: Text('Something went wrong!!!'),
                      // );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
