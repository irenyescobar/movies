import 'package:flutter/material.dart';

import 'body.dart';

const _tituloAppBar = 'Filmes';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(_tituloAppBar),
        ),
        body: const HomeBody(
          key: Key('0'),
        ));
  }
}
