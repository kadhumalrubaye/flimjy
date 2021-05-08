// import 'dart:io';
// import 'dart:ui' as ui;

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:expansion_card/expansion_card.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../generated/l10n.dart';
// import '../../bloc/moviebloc/movie_bloc.dart';
// import '../../bloc/moviebloc/movie_bloc_event.dart';
// import '../../bloc/moviebloc/movie_bloc_state.dart';
// import '../../model/series_model.dart';

// class SeriesListWidget extends StatelessWidget {
//   const SeriesListWidget({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<MovieBloc>(
//       create: (context) => MovieBloc()..add(GetSeriesListEvent()),
//       child: BlocBuilder<MovieBloc, MovieState>(
//         builder: (context, state) {
//           context.debugDoingBuild.toString();
//           if (state is MovieLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is GetSeriesListState) {
//             List<SeriesModel> movieList = state.seriesList;

//             return ListView.separated(
//               separatorBuilder: (context, index) => Divider(
//                 color: Colors.white.withOpacity(0.5),
//                 height: 2,
//               ),
//               // scrollDirection: Axis.horizontal,
//               itemCount: movieList.length,
//               itemBuilder: (context, index) {
//                 SeriesModel series = movieList[index];

//                 return Center(
//                   child: ExpansionCard(
//                     margin: EdgeInsets.only(top: 5),

//                     trailing: SizedBox(
//                       child: trillerImage(context, series),
//                       width: 100,
//                       height: 150,
//                     ),
//                     // onExpansionChanged: (_) {
//                     //   BlocProvider.of<MovieBloc>(context)
//                     //       .add(GetSeriesListEvent());
//                     //       print('states changed');
//                     // },
//                     borderRadius: 2,
//                     background: buildGestureDetector(context, series),
//                     title: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         this.titleContainer(series),
//                         Column(
//                           children: [
//                             ratingContainer(series),
//                           ],
//                         ),
//                       ],
//                     ),
//                     children: <Widget>[
//                       Column(
//                         children: [
//                           Text(
//                             series.overview,
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(
//                             height: 50,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               ElevatedButton(
//                                 style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.resolveWith<Color>(
//                                     (Set<MaterialState> states) {
//                                       if (states
//                                           .contains(MaterialState.pressed))
//                                         return Colors.green;

//                                       return Colors
//                                           .green; // Use the component's default.
//                                     },
//                                   ),
//                                 ),
//                                 onPressed: () {},
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(Icons.share),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     Text(S.of(context).Play),
//                                   ],
//                                 ),
//                               ),
//                               ElevatedButton(
//                                 style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.resolveWith<Color>(
//                                     (Set<MaterialState> states) {
//                                       if (states
//                                           .contains(MaterialState.pressed))
//                                         return Color.fromRGBO(232, 45, 68, 1.0);

//                                       return Color.fromRGBO(232, 45, 68,
//                                           1.0); // Use the component's default.
//                                     },
//                                   ),
//                                 ),
//                                 onPressed: () {},
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(Icons.info),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     Text(S.of(context).Play),
//                                   ],
//                                 ),
//                               ),
//                               ElevatedButton(
//                                 style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.resolveWith<Color>(
//                                     (Set<MaterialState> states) {
//                                       if (states
//                                           .contains(MaterialState.pressed))
//                                         return Color.fromRGBO(255, 164, 0, 1.0);

//                                       return Color.fromRGBO(255, 164, 0, 1.0);
//                                       // Use the component's default.
//                                     },
//                                   ),
//                                 ),
//                                 onPressed: () {},
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(Icons.favorite),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     Text(S.of(context).Play),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }

//   Container ratingContainer(SeriesModel series) {
//     return Container(
//       // margin: EdgeInsets.only(right: 22),
//       child: Row(
//         children: <Widget>[
//           // Container(
//           //   child: Row(
//           //     children: [
//           //       Icon(
//           //         Icons.star,
//           //         color: Colors.yellow,
//           //         size: 15,
//           //       ),
//           //       Icon(
//           //         Icons.star,
//           //         color: Colors.yellow,
//           //         size: 15,
//           //       ),
//           //       Icon(
//           //         Icons.star,
//           //         color: Colors.yellow,
//           //         size: 15,
//           //       ),
//           //       Icon(
//           //         Icons.star,
//           //         color: Colors.yellow,
//           //         size: 15,
//           //       ),
//           //       Icon(
//           //         Icons.star,
//           //         color: Colors.yellow,
//           //         size: 15,
//           //       ),
//           //     ],
//           //   ),
//           // ),
//           SizedBox(
//             width: 5,
//           ),
//           Container(
//             padding: EdgeInsets.all(3),
//             decoration: BoxDecoration(
//               color: Color.fromRGBO(0, 180, 171, 1.0),
//               borderRadius: BorderRadius.all(Radius.circular(5)),
//             ),
//             child: Text(
//               series.voteAverage.toString(),
//               style: TextStyle(
//                 // fontSize: 12,
//                 // color: Colors.black45,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'muli',
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget titleContainer(SeriesModel series) {
//     return Flexible(
//       child: RichText(
//         overflow: TextOverflow.ellipsis,
//         strutStyle: StrutStyle(fontSize: 12.0),
//         text: TextSpan(
//           text: series.name,
//         ),
//       ),
//     );
//   }

//   Widget buildGestureDetector(BuildContext context, SeriesModel series) {
//     return CachedNetworkImage(
//       imageUrl: 'https://image.tmdb.org/t/p/original/${series.backdropPath}',
//       imageBuilder: (context, imageProvider) {
//         return Stack(
//           children: [
//             Container(
//               width: 400,
//               height: 300,
//               decoration: BoxDecoration(
//                 // borderRadius: BorderRadius.all(
//                 //   Radius.circular(12),
//                 // ),
//                 image: DecorationImage(
//                   colorFilter: ColorFilter.mode(
//                       Colors.black.withOpacity(0.5), BlendMode.dstATop),
//                   image: imageProvider,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Positioned.fill(
//                 child: BackdropFilter(
//               filter: ui.ImageFilter.blur(sigmaX: 2, sigmaY: 2),
//               child: Container(
//                 color: Colors.black.withOpacity(0.1),
//               ),
//             ))
//           ],
//         );
//       },
//       placeholder: (context, url) => Container(
//         width: 400,
//         height: 450,
//         child: Center(
//           child: Platform.isAndroid
//               ? CircularProgressIndicator()
//               : CupertinoActivityIndicator(),
//         ),
//       ),
//       errorWidget: (context, url, error) => BackdropFilter(
//         filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//         child: Container(
//           width: 180,
//           height: 250,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/images/img_not_found.jpg'),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget trillerImage(BuildContext context, SeriesModel series) {
//     return CachedNetworkImage(
//       imageUrl: 'https://image.tmdb.org/t/p/original/${series.backdropPath}',
//       imageBuilder: (context, imageProvider) {
//         return Container(
//           width: 400,
//           height: 300,
//           decoration: BoxDecoration(
//             // borderRadius: BorderRadius.all(
//             //   Radius.circular(12),
//             // ),
//             image: DecorationImage(
//               image: imageProvider,
//               fit: BoxFit.contain,
//             ),
//           ),
//         );
//       },
//       placeholder: (context, url) => Container(
//         width: 400,
//         height: 450,
//         child: Center(
//           child: Platform.isAndroid
//               ? CircularProgressIndicator()
//               : CupertinoActivityIndicator(),
//         ),
//       ),
//       errorWidget: (context, url, error) => BackdropFilter(
//         filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//         child: Container(
//           width: 180,
//           height: 250,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/images/img_not_found.jpg'),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
