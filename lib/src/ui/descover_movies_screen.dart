import 'dart:io';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';
import '../bloc/moviebloc/movie_bloc.dart';
import '../bloc/moviebloc/movie_bloc_event.dart';
import '../bloc/moviebloc/movie_bloc_state.dart';
import '../model/movie.dart';
import 'movie_detail_screen.dart';

class DiscoverMovieScreen extends StatelessWidget {
  const DiscoverMovieScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Movies),
      ),
      body: BlocProvider<MovieBloc>(
        create: (context) => MovieBloc()..add(GetMoviesEvent()),
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            context.debugDoingBuild.toString();
            if (state is MovieLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetMoviesState) {
              List<Movie> movieList = state.getMoviesState;

              return ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: Colors.white.withOpacity(0.5),
                  height: 2,
                ),
                // scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  Movie movie = movieList[index];

                  return Center(
                    child: ExpansionCard(
                      margin: EdgeInsets.only(top: 5),
                      leading: SizedBox(
                        child: trillerImage(context, movie),
                        width: 100,
                        height: 150,
                      ),

                      // onExpansionChanged: (_) {
                      //   BlocProvider.of<MovieBloc>(context)
                      //       .add(GetmovieListEvent());
                      //       print('states changed');
                      // },
                      borderRadius: 20,
                      background: buildGestureDetector(context, movie),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // SizedBox(
                          //   height: 100,
                          //   width: 100,
                          //   child:
                          //       Image.asset('assets/images/img_not_found.jpg'),
                          // ),
                          this.titleContainer(movie),
                          Column(
                            children: [
                              ratingContainer(movie),
                            ],
                          ),
                        ],
                      ),
                      children: <Widget>[
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                movie.overview == ''
                                    ? S.of(context).NoOverView
                                    : movie.overview,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        // if (states
                                        //     .contains(MaterialState.pressed))
                                        //   return Colors.green.withOpacity(0.9);

                                        return Colors.green.withOpacity(0.3);
                                      },
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.play_arrow),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(S.of(context).Play),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        return Color.fromRGBO(232, 45, 68, 1.0)
                                            .withOpacity(
                                                0.3); // Use the component's default.
                                      },
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MovieDetailScreen(
                                                  movie: movie,
                                                )));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.info),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(S.of(context).Details),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        return Color.fromRGBO(255, 164, 0, 1.0)
                                            .withOpacity(0.3);
                                        // Use the component's default.
                                      },
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.favorite),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(S.of(context).Favorite),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Container ratingContainer(Movie movie) {
    return Container(
      // margin: EdgeInsets.only(right: 22),
      child: Row(
        children: <Widget>[
          // Container(
          //   child: Row(
          //     children: [
          //       Icon(
          //         Icons.star,
          //         color: Colors.yellow,
          //         size: 15,
          //       ),
          //       Icon(
          //         Icons.star,
          //         color: Colors.yellow,
          //         size: 15,
          //       ),
          //       Icon(
          //         Icons.star,
          //         color: Colors.yellow,
          //         size: 15,
          //       ),
          //       Icon(
          //         Icons.star,
          //         color: Colors.yellow,
          //         size: 15,
          //       ),
          //       Icon(
          //         Icons.star,
          //         color: Colors.yellow,
          //         size: 15,
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            width: 5,
          ),
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 180, 171, 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Text(
              movie.voteAverage.toString(),
              style: TextStyle(
                // fontSize: 12,
                // color: Colors.black45,
                fontWeight: FontWeight.bold,
                fontFamily: 'muli',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget titleContainer(Movie movie) {
    return Flexible(
      child: RichText(
        overflow: TextOverflow.ellipsis,
        strutStyle: StrutStyle(fontSize: 12.0),
        text: TextSpan(
          text: movie.title,
        ),
      ),
    );
  }

  Widget buildGestureDetector(BuildContext context, Movie movie) {
    return CachedNetworkImage(
      imageUrl: 'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
      imageBuilder: (context, imageProvider) {
        return Stack(
          children: [
            Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.all(
                //   Radius.circular(12),
                // ),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
                child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ))
          ],
        );
      },
      placeholder: (context, url) => Container(
        width: 400,
        height: 450,
        child: Center(
          child: Platform.isAndroid
              ? CircularProgressIndicator()
              : CupertinoActivityIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          width: 180,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/img_not_found.jpg'),
            ),
          ),
        ),
      ),
    );
  }

  Widget trillerImage(BuildContext context, Movie movie) {
    return CachedNetworkImage(
      imageUrl: 'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
      imageBuilder: (context, imageProvider) {
        return Container(
          width: 400,
          height: 300,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.all(
            //   Radius.circular(12),
            // ),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
      placeholder: (context, url) => Container(
        width: 400,
        height: 450,
        child: Center(
          child: Platform.isAndroid
              ? CircularProgressIndicator()
              : CupertinoActivityIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          width: 180,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/img_not_found.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
