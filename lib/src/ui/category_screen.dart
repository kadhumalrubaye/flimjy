import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';
import '../bloc/genrebloc/genre_bloc.dart';
import '../bloc/genrebloc/genre_event.dart';
import '../bloc/genrebloc/genre_state.dart';
import '../bloc/moviebloc/movie_bloc.dart';
import '../bloc/moviebloc/movie_bloc_event.dart';
import '../model/genre.dart';
import 'widgets/new_playing_blockbuilder.dart';

class NewPlayingBuildWidgetCategory extends StatefulWidget {
  final int selectedGenre;

  const NewPlayingBuildWidgetCategory({Key key, this.selectedGenre = 28})
      : super(key: key);

  @override
  NewPlayingBuildWidgetCategoryState createState() =>
      NewPlayingBuildWidgetCategoryState();
}

class NewPlayingBuildWidgetCategoryState
    extends State<NewPlayingBuildWidgetCategory> {
  int selectedGenre;

  @override
  void initState() {
    super.initState();
    selectedGenre = widget.selectedGenre;
  }

  @override
  Widget build(BuildContext conte) {
    return BlocProvider.value(
      value: BlocProvider.of<GenreBloc>(context)..add(GenreEventStarted()),
      child: _buildGenre(conte),
    );
  }

  Widget _buildGenre(BuildContext conte) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BlocBuilder<GenreBloc, GenreState>(
          builder: (_, state) {
            if (state is GenreLoading) {
              return Center(
                child: Platform.isAndroid
                    ? CircularProgressIndicator()
                    : CupertinoActivityIndicator(),
              );
            } else if (state is GenreLoaded) {
              List<Genre> genres = state.genreList;

              return Container(
                height: 45,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      VerticalDivider(
                    color: Colors.transparent,
                    width: 5,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: genres.length,
                  itemBuilder: (context, index) {
                    Genre genre = genres[index];

                    return Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Genre genre = genres[index];

                              selectedGenre = genre.id;
                              context
                                  .read<MovieBloc>()
                                  .add(MovieEventStarted(selectedGenre, ''));
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    // color: ThemeData().buttonColor,
                                    ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: (genre.id == selectedGenre)
                                    ? Theme.of(context).focusColor
                                    : Theme.of(context).buttonColor),
                            child: Text(
                              genre.name.toUpperCase(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: (genre.id == selectedGenre)
                                    ? Colors.white54
                                    : Colors.white,
                                fontFamily: 'muli',
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Text(
            S.of(context).NewPlaying.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              // color: Colors.white,
              fontFamily: 'muli',
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        NewPlayingBlockBuilder(),
      ],
    );
  }
}
