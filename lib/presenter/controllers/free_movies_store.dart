import 'package:movies/domain/usecases/get_free_movies.dart';

import '../widgets/paginated_data/modular_paginated_data/movies_modular_paginated_data_store.dart';

class FreeMoviesStore extends MoviesModularPaginatedDataStore {
  final GetFreeMoviesUsecase getPopulatMoviesUsecase;

  FreeMoviesStore(this.getPopulatMoviesUsecase)
      : super(getPopulatMoviesUsecase);
}
