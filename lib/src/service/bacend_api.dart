import 'package:dio/dio.dart';

import '../model/movie.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _arabic_lang = '&language=ar-sa';
  final String baseUrl = '';
  final String apiKey = '';

  Future<List<Movie>> getUserInformation() async {
    try {
      final url = '$baseUrl/movie/now_playing?$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
