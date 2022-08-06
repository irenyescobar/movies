import 'dart:convert';

import 'package:http/http.dart';

import '../../http/webclient.dart';
import '../../models/PagedMovies.dart';

Future<PagedMovies> getFreeMovies() async {
  final Response response = await client.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/upcoming?region=BR&language=pt-BR'));

  if (response.statusCode == 200) {
    final PagedMovies data = PagedMovies.fromJson(jsonDecode(response.body));
    return data;
  }
  return PagedMovies(
      page: 0,
      results: List.empty(growable: true),
      totalPages: 0,
      totalResults: 0);
}
