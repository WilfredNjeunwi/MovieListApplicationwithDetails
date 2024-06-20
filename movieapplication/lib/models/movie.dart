class Movie {
  final int id;
  final String title;
  final String description;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final String originalTitle;
  final int voteCount;
  final DateTime releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    required this.originalTitle,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        title: json['original_title'],
        description: json['overview'],
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
        releaseDate: DateTime.parse(json['release_date']),
        originalTitle: json['original_title']);
  }
}
