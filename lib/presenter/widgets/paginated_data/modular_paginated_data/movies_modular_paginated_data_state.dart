import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/presenter/widgets/group_title.dart';
import 'package:movies/presenter/widgets/horizontal_list.dart';

import '../../../../../domain/entities/paded_movies_entity.dart';
import '../scroll/top_bottom_scroll_direction.dart';
import '../scroll/top_bottom_scroll_listener.dart';
import 'modular_paginated_data_state.dart';
import 'movies_modular_paginated_data_store.dart';

abstract class MoviesModularPaginatedDataState<TWidget extends StatefulWidget,
        TMoviesStore extends MoviesModularPaginatedDataStore>
    extends ModularPaginatedDataState<TWidget, MovieEntity, TMoviesStore>
    implements ITopBottomReachedScrollListener {
  final String title;

  MoviesModularPaginatedDataState({required this.title});

  Widget buildHorizontalList() {
    return HorizontalList(
      movies: store.state.results,
      listener: this,
      isLoadingTop: store.isLoading &&
          store.topBottomScrollDirection == TopBottomScrollDirection.top,
      isLoadingBottom: store.isLoading &&
          store.topBottomScrollDirection == TopBottomScrollDirection.bottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GroupTitle(title: title),
        Container(
          constraints: const BoxConstraints.expand(height: 300),
          margin: const EdgeInsets.all(10),
          child: ScopedBuilder(
            store: store,
            onLoading: (context) {
              return buildHorizontalList();
            },
            onState: (context, PagedMoviesEntity pagedMovies) {
              return buildHorizontalList();
            },
          ),
        ),
      ],
    );
  }
}
