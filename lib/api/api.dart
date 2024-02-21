import 'dart:convert';

 import 'package:movie_app/constants.dart';
 import 'package:movie_app/models/movie.dart';
 import 'package:http/http.dart' as http;


 class Api {
  static const _trendingUrl = 
  'http://api.themoviedb.org/3/trending/movie/day?api_key=${Constant.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));

    if (response.statusCode == 200) {
      final decodeDate = json.decode(response.body) ['result'] as List;
      return decodeDate.map((movie) => Movie.fromJason(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }
 }