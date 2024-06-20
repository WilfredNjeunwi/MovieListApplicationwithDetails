import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../models/movie.dart';

class MovieRepository {
  static const String _apiKey = '100f625bbfc0e7cdf3401d75336b5b81';
  static const String _acess_token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMDBmNjI1YmJmYzBlN2NkZjM0MDFkNzUzMzZiNWI4MSIsInN1YiI6IjY2NzNmZWQ0NTg3NzY3NjgwOTU0ODk1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nBoY1taoNBI6t69pSb_6lhLOZCAl2le9GDmJV0zjeZ4';
  static const String _apiUrl = 'https://api.themoviedb.org/3/movie/popular';

  Future<List<Movie>> fetchMovies() async {
    try {
      final response = await http.get(Uri.parse('$_apiUrl?api_key=$_apiKey'));
      final data = json.decode(response.body);
      final List<dynamic> moviesData = data['results'];

      return moviesData.map((movieData) => Movie.fromJson(movieData)).toList();
    } catch (error) {
      rethrow;
    }
  }
}
