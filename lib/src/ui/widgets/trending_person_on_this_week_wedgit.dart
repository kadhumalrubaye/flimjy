import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../bloc/personbloc/person_bloc.dart';
import '../../bloc/personbloc/person_state.dart';
import '../../model/person.dart';

class TrendingPersonsOnThisWeekBlocBuilder extends StatelessWidget {
  const TrendingPersonsOnThisWeekBlocBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).TrendingPersonOnThisWeek.toUpperCase(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            // color: Colors.black45,
            fontFamily: 'muli',
          ),
        ),
        SizedBox(
          height: 12,
        ),
        BlocBuilder<PersonBloc, PersonState>(
          builder: (context, state) {
            if (state is PersonLoading) {
              return Center();
            } else if (state is PersonLoaded) {
              List<Person> personList = state.personList;
              //print(personList.length);
              return Container(
                height: 110,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: personList.length,
                  separatorBuilder: (context, index) => VerticalDivider(
                    color: Colors.transparent,
                    width: 5,
                  ),
                  itemBuilder: (context, index) {
                    Person person = personList[index];
                    return Container(
                      child: Column(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            elevation: 3,
                            child: ClipRRect(
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://image.tmdb.org/t/p/w200${person.profilePath}',
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100),
                                      ),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                                placeholder: (context, url) => Container(
                                  width: 80,
                                  height: 80,
                                  child: Center(
                                    child: Platform.isAndroid
                                        ? CircularProgressIndicator()
                                        : CupertinoActivityIndicator(),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/img_not_found.jpg'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                person.name.toUpperCase(),
                                style: TextStyle(
                                  // color: Colors
                                  //     .black45,
                                  fontSize: 8,
                                  fontFamily: 'muli',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                person.knowForDepartment.toUpperCase(),
                                style: TextStyle(
                                  // color: Colors
                                  //     .black45,
                                  fontSize: 8,
                                  fontFamily: 'muli',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
