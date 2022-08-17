import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/core/remote_client/remote_client.dart';
import 'package:movies/data/datasources/endpoints/tmdb_endpoints.dart';
import 'package:movies/data/datasources/movie_datasource_implementation.dart';

import '../../mocks/paged_movies_mock.dart';
import '../../mocks/paged_movies_model_mock.dart';

class HttpClientMock extends Mock implements RemoteClient {}

void main() {
  late MovieDatasourceImplementation dataSource;
  late RemoteClient client;
  int pageOne = 1;

  setUp(() {
    client = HttpClientMock();
    dataSource = MovieDatasourceImplementation(client);
  });

  void successPopularMock() {
    when(() => client.get(TmdbEndpoints.popularMovies(pageOne))).thenAnswer(
        (_) async => RemoteResponse(data: pagedMoviesMock, statusCode: 200));
  }

  void successFreeMock() {
    when(() => client.get(TmdbEndpoints.freeMovies(pageOne))).thenAnswer(
        (_) async => RemoteResponse(data: pagedMoviesMock, statusCode: 200));
  }

  test('should call the get method with correct url to popular movies',
      () async {
    successPopularMock();

    await dataSource.getPopularMovies(pageOne);

    verify(() => client.get(TmdbEndpoints.popularMovies(pageOne))).called(1);
  });

  test(
      'should return the popular pagedMovies model with first page when is successful',
      () async {
    successPopularMock();

    final result = await dataSource.getPopularMovies(pageOne);

    expect(result, tPagedMovies);
  });

  test('should call the get method with correct url to free movies', () async {
    successFreeMock();

    await dataSource.getFreeMovies(pageOne);

    verify(() => client.get(TmdbEndpoints.freeMovies(pageOne))).called(1);
  });

  test(
      'should return the free pagedMovies model with first page when is successful',
      () async {
    successFreeMock();

    final result = await dataSource.getFreeMovies(pageOne);

    expect(result, tPagedMovies);
  });
}
