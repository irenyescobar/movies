import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movies/widgets/imageBorderRadius.dart';
import '../../models/movie.dart';

class ItemMovie extends StatelessWidget {
  final Movie _movie;
  const ItemMovie(this._movie);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(width: 150),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ImageBorderRadius(
                    src: 'https://image.tmdb.org/t/p/w200${_movie.posterPath}'),
                CirclePercentage(
                  popularity: _movie.popularity,
                  voteAverage: _movie.voteAverage,
                  voteCount: _movie.voteCount,
                ),
              ],
            ),
            ItemTitle(title: _movie.title),
            ItemSubtitle(subtitle: _movie.releaseDate.toIso8601String())
          ],
        ));
  }
}

class CirclePercentage extends StatelessWidget {
  final double popularity;
  final int voteCount;
  final double voteAverage;

  const CirclePercentage(
      {Key? key,
      required this.popularity,
      required this.voteAverage,
      required this.voteCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progressValue = voteAverage / 10;
    final Color progressColor = progressValue > 0.7
        ? const Color.fromARGB(255, 13, 118, 17)
        : progressValue > 0.5
            ? const Color.fromARGB(255, 160, 197, 12)
            : progressValue > 0.3
                ? const Color.fromRGBO(254, 233, 42, 1)
                : const Color.fromARGB(255, 254, 95, 42);

    return Stack(children: <Widget>[
      Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          width: 30,
          height: 30,
          margin: const EdgeInsets.fromLTRB(20, 176, 0, 0),
          alignment: Alignment.center,
          child: Text(voteAverage.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.white))),
      Container(
        width: 22,
        height: 22,
        margin: const EdgeInsets.fromLTRB(24, 180, 0, 0),
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: progressColor,
          strokeWidth: 2,
          value: progressValue,
        ),
      )
    ]);
  }
}

class ItemTitle extends StatelessWidget {
  final String title;
  const ItemTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.black)));
  }
}

class ItemSubtitle extends StatelessWidget {
  final String subtitle;
  const ItemSubtitle({Key? key, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Text(subtitle,
            style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: Colors.black54)));
  }
}
