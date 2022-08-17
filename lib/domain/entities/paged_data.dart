abstract class PagedData<T> {
  final List<T> results;
  final int page;
  final int totalPages;
  final int totalResults;

  const PagedData(
      {required this.page,
      required this.totalPages,
      required this.totalResults,
      required this.results});
}
