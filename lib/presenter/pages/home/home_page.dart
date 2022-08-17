import 'package:flutter/material.dart';

import 'free_movies.dart';
import 'popular_movies.dart';

const _tituloAppBar = 'Filmes';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child:
              Column(children: const <Widget>[PopularMovies(), FreeMovies()]),
        ));
  }
}
