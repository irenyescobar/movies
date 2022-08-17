import 'package:flutter/material.dart';
import 'package:movies/presenter/widgets/paginated_data/modular_paginated_data/movies_modular_paginated_data_state.dart';

import '../../controllers/popular_movies_store.dart';

const _popularMoviesTitle = 'Os Mais Populares';

class PopularMovies extends StatefulWidget {
  const PopularMovies({Key? key}) : super(key: key);
  @override
  _PopularMoviesState createState() => _PopularMoviesState();
}

class _PopularMoviesState
    extends MoviesModularPaginatedDataState<PopularMovies, PopularMoviesStore> {
  _PopularMoviesState() : super(title: _popularMoviesTitle);
}
