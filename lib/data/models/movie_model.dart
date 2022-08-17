import 'package:movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel(
      {required id,
      required title,
      required posterPath,
      required releaseDate,
      required popularity,
      required voteAverage,
      required voteCount})
      : super(
            id: id,
            title: title,
            posterPath: posterPath,
            releaseDate: releaseDate,
            popularity: popularity,
            voteAverage: voteAverage,
            voteCount: voteCount);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      releaseDate: DateTime.parse(json['release_date']),
      popularity: json['popularity'].toDouble(),
      voteCount: json['vote_count'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
