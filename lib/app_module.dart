import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/data/datasources/movie_datasource_implementation.dart';
import 'package:movies/data/repositories/movie_repository_implementation.dart';
import 'package:movies/domain/usecases/get_free_movies.dart';
import 'package:movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/presenter/controllers/popular_movies_store.dart';

import 'core/remote_client/http/http_remote_client_implementation.dart';
import 'presenter/controllers/free_movies_store.dart';
import 'presenter/pages/home/home_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => FreeMoviesStore(i())),
    Bind.factory((i) => PopularMoviesStore(i())),
    Bind.lazySingleton((i) => GetFreeMoviesUsecase(i())),
    Bind.lazySingleton((i) => GetPopularMoviesUsecase(i())),
    Bind.lazySingleton((i) => MovieRepositoryImplementation(i())),
    Bind.lazySingleton((i) => MovieDatasourceImplementation(i())),
    Bind.lazySingleton((i) => HttpRemoteClientImplementation()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage())
  ];
}
