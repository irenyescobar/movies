import 'dart:convert';

import '../../core/errors/exceptions.dart';
import '../../core/remote_client/remote_client.dart';
import '../models/paged_movies_model.dart';
import 'endpoints/tmdb_endpoints.dart';
import 'movie_datasource.dart';

class MovieDatasourceImplementation implements IMovieDataSource {
  final RemoteClient client;

  MovieDatasourceImplementation(this.client);

  @override
  Future<PagedMoviesModel> getFreeMovies(int page) async {
    final response = await client.get(TmdbEndpoints.freeMovies(page));

    if (response.statusCode == 200) {
      return PagedMoviesModel.fromJson(jsonDecode(response.data));
    } else {
      return throw ServerException();
    }
  }

  @override
  Future<PagedMoviesModel> getPopularMovies(int page) async {
    final response = await client.get(TmdbEndpoints.popularMovies(page));

    if (response.statusCode == 200) {
      return PagedMoviesModel.fromJson(jsonDecode(response.data));
    } else {
      return throw ServerException();
    }
  }
}
