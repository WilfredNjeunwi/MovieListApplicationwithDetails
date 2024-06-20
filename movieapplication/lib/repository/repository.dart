import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../models/movie.dart';

//this is the repository for getting the list of movies from the source
String apiUrl = "https://api.themoviedb.org/3/discover/movie";
String bearerToken = "your token";

class MovieRepository {
  Future<List<Movie>> getMovies() async {
    // Fetch movies from an API or database and return a list of Movie objects
    final url = Uri.parse(apiUrl);
    final headers = {
      'Authorization': 'Bearer $bearerToken',
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      print("success");
      print(response.body.toString());
      final jsonData = jsonDecode(response.body);
      final results = jsonData['results'] as List<dynamic>;
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
