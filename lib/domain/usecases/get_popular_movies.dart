import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failures.dart';
import 'package:movies/domain/entities/paded_movies_entity.dart';
import 'package:movies/domain/repositories/movies_repository.dart';

import '../../core/usecase/usecase.dart';

class GetPopularMoviesUsecase implements Usecase<PagedMoviesEntity, int> {
  final IMovieRepository repository;

  GetPopularMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, PagedMoviesEntity>> call(int params) async {
    return await repository.getPopularMovies(params);
  }
}
