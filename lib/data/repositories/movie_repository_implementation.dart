import 'package:movies/data/datasources/movie_datasource.dart';
import 'package:movies/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/domain/repositories/movies_repository.dart';

import '../../core/errors/exceptions.dart';
import '../../domain/entities/paded_movies_entity.dart';

class MovieRepositoryImplementation implements IMovieRepository {
  final IMovieDataSource dataSource;

  MovieRepositoryImplementation(this.dataSource);

  @override
  Future<Either<Failure, PagedMoviesEntity>> getFreeMovies(int page) async {
    try {
      final result = await dataSource.getFreeMovies(page);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PagedMoviesEntity>> getPopularMovies(int page) async {
    try {
      final result = await dataSource.getPopularMovies(page);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
