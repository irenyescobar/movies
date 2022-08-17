import 'package:movies/domain/entities/movie_entity.dart';

import 'paged_data.dart';

class PagedMoviesEntity extends PagedData<MovieEntity> {
  PagedMoviesEntity(
      {required super.page,
      required super.totalPages,
      required super.totalResults,
      required super.results});
}
