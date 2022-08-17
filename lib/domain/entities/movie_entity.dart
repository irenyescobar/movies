import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final DateTime releaseDate;
  final double popularity;
  final int voteCount;
  final double voteAverage;

  const MovieEntity(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.releaseDate,
      required this.popularity,
      required this.voteCount,
      required this.voteAverage});

  @override
  List<Object?> get props =>
      [id, title, posterPath, releaseDate, popularity, voteCount, voteAverage];
}
