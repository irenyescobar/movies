import 'package:movies/data/models/movie_model.dart';
import 'package:movies/data/models/paged_movies_model.dart';

abstract class IMovieDataSource {
  Future<PagedMoviesModel> getFreeMovies(int page);
  Future<PagedMoviesModel> getPopularMovies(int page);
}
