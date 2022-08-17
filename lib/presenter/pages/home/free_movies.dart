import 'package:flutter/material.dart';
import 'package:movies/presenter/controllers/free_movies_store.dart';

import '../../widgets/paginated_data/modular_paginated_data/movies_modular_paginated_data_state.dart';

const _freeMoviesTitle = 'Grátis para Assistir';

class FreeMovies extends StatefulWidget {
  const FreeMovies({Key? key}) : super(key: key);

  @override
  _FreeMoviesState createState() => _FreeMoviesState();
}

class _FreeMoviesState
    extends MoviesModularPaginatedDataState<FreeMovies, FreeMoviesStore> {
  _FreeMoviesState() : super(title: _freeMoviesTitle);
}
