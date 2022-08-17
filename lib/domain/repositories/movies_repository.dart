import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/paded_movies_entity.dart';

abstract class IMovieRepository {
  Future<Either<Failure, PagedMoviesEntity>> getFreeMovies(int page);
  Future<Either<Failure, PagedMoviesEntity>> getPopularMovies(int page);
}
