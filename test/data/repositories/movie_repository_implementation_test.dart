import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/core/errors/exceptions.dart';
import 'package:movies/core/errors/failures.dart';
import 'package:movies/data/datasources/movie_datasource.dart';
import 'package:movies/data/repositories/movie_repository_implementation.dart';

import '../../mocks/paged_movies_model_mock.dart';

class MockMovieDataSource extends Mock implements IMovieDataSource {}

void main() {
  late MovieRepositoryImplementation repository;
  late IMovieDataSource dataSource;

  setUp(() {
    dataSource = MockMovieDataSource();
    repository = MovieRepositoryImplementation(dataSource);
  });

  test(
      'should return the popular pagedMovies model with first page  when calls the datasource',
      () async {
    int page = 1;
    when(() => dataSource.getPopularMovies(page))
        .thenAnswer((_) async => tPagedMovies);

    final result = await repository.getPopularMovies(page);

    verify(() => dataSource.getPopularMovies(page)).called(1);
    expect(result, Right(tPagedMovies));
  });

  test('should get error fetching popular movies with page zero', () async {
    int page = 0;
    when(() => dataSource.getPopularMovies(page)).thenThrow(ServerException());

    final result = await repository.getPopularMovies(page);

    verify(() => dataSource.getPopularMovies(page)).called(1);
    expect(result, Left(ServerFailure()));
  });

  test(
      'should return the free pagedMovies model with first page  when calls the datasource',
      () async {
    int page = 1;
    when(() => dataSource.getFreeMovies(page))
        .thenAnswer((_) async => tPagedMovies);

    final result = await repository.getFreeMovies(page);

    verify(() => dataSource.getFreeMovies(page)).called(1);
    expect(result, Right(tPagedMovies));
  });

  test('should get error fetching free movies with page zero', () async {
    int page = 0;
    when(() => dataSource.getFreeMovies(page)).thenThrow(ServerException());

    final result = await repository.getFreeMovies(page);

    verify(() => dataSource.getFreeMovies(page)).called(1);
    expect(result, Left(ServerFailure()));
  });
}
