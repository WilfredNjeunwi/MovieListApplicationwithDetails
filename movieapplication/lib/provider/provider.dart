import 'package:flutter/foundation.dart';
import '../models/movie.dart';
import '../repository/repository.dart';

class MovieProvider extends ChangeNotifier {
  final MovieRepository _movieRepository;
  List<Movie> _movies = [];
  bool _isLoading = false;

  MovieProvider(this._movieRepository);

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;

  Future<void> fetchMovies() async {
    try {
      _isLoading = true;
      notifyListeners();

      _movies = await _movieRepository.getMovies();
    } catch (error) {
      throw (error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
