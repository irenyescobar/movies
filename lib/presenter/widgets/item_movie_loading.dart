import 'package:flutter/material.dart';

class ItemMovieLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(width: 150),
        margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
        child: const Center(
          child: CircularProgressIndicator(),
        ));
  }
}
