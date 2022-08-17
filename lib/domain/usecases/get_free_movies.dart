import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failures.dart';
import 'package:movies/domain/repositories/movies_repository.dart';

import '../../core/usecase/usecase.dart';
import '../entities/paded_movies_entity.dart';

class GetFreeMoviesUsecase implements Usecase<PagedMoviesEntity, int> {
  final IMovieRepository repository;

  GetFreeMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, PagedMoviesEntity>> call(int params) async {
    return await repository.getFreeMovies(params);
  }
}
