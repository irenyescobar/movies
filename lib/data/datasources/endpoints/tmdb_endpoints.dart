class TmdbEndpoints {
  static String freeMovies(int page) =>
      'https://api.themoviedb.org/3/movie/upcoming?region=BR&language=pt-BR&page=$page';

  static String popularMovies(int page) =>
      'https://api.themoviedb.org/3/movie/popular?region=BR&language=pt-BR&page=$page';
}
