import '../../domain/usecases/get_popular_movies.dart';
import '../widgets/paginated_data/modular_paginated_data/movies_modular_paginated_data_store.dart';

class PopularMoviesStore extends MoviesModularPaginatedDataStore {
  final GetPopularMoviesUsecase getPopulatMoviesUsecase;

  PopularMoviesStore(this.getPopulatMoviesUsecase)
      : super(getPopulatMoviesUsecase);
}
