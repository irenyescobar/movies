import 'package:flutter/material.dart';

import '../../models/movie.dart';
import 'itemMovie.dart';

class ListSession extends StatelessWidget {
  final List<Movie> movies;

  const ListSession({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        constraints: const BoxConstraints.expand(height: 300),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemMovie(movies[index]);
            }));
  }
}
