import 'common/pagedData.dart';
import 'movie.dart';

class PagedMovies extends PagedData<Movie> {
  PagedMovies(
      {required super.page,
      required super.totalPages,
      required super.totalResults,
      required super.results});

  factory PagedMovies.fromJson(Map<String, dynamic> json) {
    final List<dynamic> results = json['results'];
    final List<Movie> movies = List.empty(growable: true);

    for (dynamic element in results) {
      movies.add(Movie.fromJson(element));
    }

    return PagedMovies(
        page: json['page'],
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
        results: movies);
  }
}
