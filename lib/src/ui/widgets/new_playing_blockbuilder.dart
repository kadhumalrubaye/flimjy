import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/moviebloc/movie_bloc.dart';
import '../../bloc/moviebloc/movie_bloc_state.dart';
import '../../model/movie.dart';
import '../movie_detail_screen.dart';

class NewPlayingBlockBuilder extends StatelessWidget {
  const NewPlayingBlockBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return Center();
        } else if (state is MovieLoaded) {
          List<Movie> movieList = state.movieList;

          return Container(
            height: 300,
            child: ListView.separated(
              separatorBuilder: (context, index) => VerticalDivider(
                color: Colors.transparent,
                width: 15,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                Movie movie = movieList[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // rating average color255, 164, 0
                    buildGestureDetector(context, movie),
                    SizedBox(
                      height: 10,
                    ),
                    titleContainer(movie),
                    ratingContainer(movie),
                  ],
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Container ratingContainer(Movie movie) {
    return Container(
      margin: EdgeInsets.only(right: 22),
      child: Row(
        children: <Widget>[
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 14,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 14,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 14,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 14,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 14,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 180, 171, 1.0),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(7),
                bottomRight: Radius.circular(7),
              ),
            ),
            child: Text(
              movie.voteAverage,
            ),
          ),
        ],
      ),
    );
  }

  Container titleContainer(Movie movie) {
    return Container(
      width: 180,
      child: Text(
        movie.title.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          // color: Colors.black45,
          fontWeight: FontWeight.bold,
          fontFamily: 'muli',
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  GestureDetector buildGestureDetector(BuildContext context, Movie movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(movie: movie),
          ),
        );
      },
      child: ClipRRect(
        child: CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
          imageBuilder: (context, imageProvider) {
            return Container(
              width: 180,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          placeholder: (context, url) => Container(
            width: 180,
            height: 250,
            child: Center(
              child: Platform.isAndroid
                  ? CircularProgressIndicator()
                  : CupertinoActivityIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            width: 180,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img_not_found.jpg'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
