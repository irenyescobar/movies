import 'package:movies/domain/entities/paded_movies_entity.dart';

import 'movie_model.dart';

class PagedMoviesModel extends PagedMoviesEntity {
  PagedMoviesModel(
      {required super.page,
      required super.totalPages,
      required super.totalResults,
      required super.results});

  factory PagedMoviesModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> results = json['results'];
    final List<MovieModel> movies = List.empty(growable: true);

    for (dynamic element in results) {
      movies.add(MovieModel.fromJson(element));
    }

    return PagedMoviesModel(
        page: json['page'],
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
        results: movies);
  }
}
