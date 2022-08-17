import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/core/errors/failures.dart';
import 'package:movies/domain/entities/paded_movies_entity.dart';
import 'package:movies/domain/repositories/movies_repository.dart';
import 'package:movies/domain/usecases/get_free_movies.dart';

import '../../mocks/paged_movies_model_mock.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetFreeMoviesUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetFreeMoviesUsecase(repository);
  });

  test('should get the first page of the PagedMovie entity ', () async {
    int page = 1;
    when(() => repository.getFreeMovies(page)).thenAnswer(
        (_) async => Right<Failure, PagedMoviesEntity>(tPagedMovies));

    final result = await usecase(page);

    verify(() => repository.getFreeMovies(page)).called(1);
    expect(result, Right(tPagedMovies));
  });

  test('should get error fetching page zero', () async {
    int page = 0;
    when(() => repository.getFreeMovies(page)).thenAnswer(
        (_) async => Left<Failure, PagedMoviesEntity>(ServerFailure()));

    final result = await usecase(page);

    verify(() => repository.getFreeMovies(page)).called(1);
    expect(result, Left(ServerFailure()));
  });
}
