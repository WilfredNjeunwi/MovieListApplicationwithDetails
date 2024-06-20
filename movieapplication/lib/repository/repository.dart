import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../models/movie.dart';

String apiUrl = "https://api.themoviedb.org/3/discover/movie";
String bearerToken =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMDBmNjI1YmJmYzBlN2NkZjM0MDFkNzUzMzZiNWI4MSIsInN1YiI6IjY2NzNmZWQ0NTg3NzY3NjgwOTU0ODk1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nBoY1taoNBI6t69pSb_6lhLOZCAl2le9GDmJV0zjeZ4";

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
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
