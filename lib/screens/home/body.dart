import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies/services/movies/freeMovies.dart';

import '../../models/PagedMovies.dart';
import '../../services/movies/popularMovies.dart';
import '../../widgets/ListSession.dart';
import '../../widgets/titleSession.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        MoviesSession(
            title: 'Os Mais Populares', futureMovies: getPopularMovies()),
        MoviesSession(
            title: 'Grátis para Assistir', futureMovies: getFreeMovies())
      ]),
    );
  }
}

class MoviesSession extends StatelessWidget {
  final String title;
  final Future<PagedMovies> futureMovies;

  const MoviesSession(
      {Key? key, required this.title, required this.futureMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleSession(title: title),
        FutureBuilder<PagedMovies?>(
          future: futureMovies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final PagedMovies? _data = snapshot.data;
              if (_data != null && _data.results.isNotEmpty) {
                return ListSession(
                    key: const Key('list0'), movies: _data.results);
              } else {
                return const Text('Sem dados');
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ],
    );
  }
}
