import 'package:movies/data/models/movie_model.dart';
import 'package:movies/data/models/paged_movies_model.dart';

final tPagedMovies =
    PagedMoviesModel(page: 1, totalPages: 1, totalResults: 3, results: [
  MovieModel(
      id: 634649,
      title: "Homem-Aranha: Sem Volta Para Casa",
      posterPath: "/fVzXp3NwovUlLe7fvoRynCmBPNc.jpg",
      releaseDate: DateTime(2021, 12, 16, 0, 0, 0, 0, 0),
      popularity: 1557.722,
      voteCount: 14677,
      voteAverage: 8.0),
  MovieModel(
      id: 762504,
      title: "Não! Não Olhe",
      posterPath: "/jDNkXOzqdffE5LIO4Nv4a2VxFCq.jpg",
      releaseDate: DateTime(2022, 08, 25, 0, 0, 0, 0, 0),
      popularity: 393.319,
      voteCount: 279,
      voteAverage: 7.1),
  MovieModel(
      id: 366672,
      title: "O Lendário Cão Guerreiro",
      posterPath: "/rpK3dukkvCa3E7iOPphsBGTO2dS.jpg",
      releaseDate: DateTime(2022, 08, 25, 0, 0, 0, 0, 0),
      popularity: 124.309,
      voteCount: 71,
      voteAverage: 6.6),
]);
