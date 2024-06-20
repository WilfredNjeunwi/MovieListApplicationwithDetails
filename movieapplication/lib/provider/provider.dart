import 'package:flutter/foundation.dart';
import '../models/movie.dart';
import '../repository/repository.dart';

// this provider helps for the state management of the application. A movie can be loading or loaded(success)
class MovieProvider extends ChangeNotifier {
  final MovieRepository _movieRepository;
  List<Movie> _movies = [];
  bool _isLoading = false;
  bool _isSuccess = false;

  MovieProvider(this._movieRepository);

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;
  bool get isSucces => _isSuccess;

  Future<void> fetchMovies() async {
    try {
      _isLoading = true;
      notifyListeners();

      _movies = await _movieRepository.getMovies();
    } catch (error) {
      _isLoading = false;
    } finally {
      print(_movies);
      // _isLoading = false;
      if (_movies.isNotEmpty) {
        _isSuccess = true;
        _isLoading = false;
      }
      notifyListeners();
    }
  }
}
