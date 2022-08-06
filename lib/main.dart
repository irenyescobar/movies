import 'package:flutter/material.dart';
import 'package:movies/screens/home/home.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
          backgroundColor: Colors.white,
          accentColor: Colors.amber,
          errorColor: Colors.red,
          cardColor: Colors.white60,
        ),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
