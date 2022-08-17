import 'package:movies/domain/entities/paded_movies_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../domain/entities/movie_entity.dart';
import 'modular_paginated_data_store.dart';

abstract class MoviesModularPaginatedDataStore
    extends ModularPaginatedDataStore<MovieEntity, PagedMoviesEntity> {
  final Usecase<PagedMoviesEntity, int> usecase;

  MoviesModularPaginatedDataStore(this.usecase)
      : super(PagedMoviesEntity(
            page: 0, totalPages: 0, results: [], totalResults: 0));
}
