import 'dart:ffi';

class Movie {
  final int id;
  final String title;
  final String posterPath;
  final DateTime releaseDate;
  final double popularity;
  final int voteCount;
  final double voteAverage;

  const Movie(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.releaseDate,
      required this.popularity,
      required this.voteAverage,
      required this.voteCount});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['original_title'],
      posterPath: json['poster_path'],
      releaseDate: DateTime.parse(json['release_date']),
      popularity: json['popularity'].toDouble(),
      voteCount: json['vote_count'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
