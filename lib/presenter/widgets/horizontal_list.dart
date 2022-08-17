import 'package:flutter/material.dart';
import 'package:movies/domain/entities/movie_entity.dart';

import 'item_movie.dart';
import 'item_movie_loading.dart';
import 'paginated_data/scroll/top_bottom_scroll_controller.dart';
import 'paginated_data/scroll/top_bottom_scroll_listener.dart';

class HorizontalList extends StatelessWidget {
  final List<MovieEntity> movies;
  final ITopBottomReachedScrollListener listener;
  final bool isLoadingTop;
  final bool isLoadingBottom;

  const HorizontalList(
      {super.key,
      required this.movies,
      required this.listener,
      required this.isLoadingTop,
      required this.isLoadingBottom});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Row(
            children: <Widget>[
              Visibility(visible: isLoadingTop, child: ItemMovieLoading()),
              Flexible(
                  flex: 2,
                  child: ListView.builder(
                      controller: TopBottomReachedScrollController(listener),
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemMovie(movies[index]);
                      })),
              Visibility(visible: isLoadingBottom, child: ItemMovieLoading())
            ],
          ),
        )
      ],
    );
  }
}
