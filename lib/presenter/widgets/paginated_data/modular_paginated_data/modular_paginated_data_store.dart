import 'package:flutter_triple/flutter_triple.dart';
import 'package:movies/core/errors/failures.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../domain/entities/paged_data.dart';
import '../paginated_data.dart';
import '../scroll/top_bottom_scroll_direction.dart';

abstract class ModularPaginatedDataStore<T, TState extends PagedData<T>>
    extends NotifierStore<Failure, TState> implements IPaginatedData {
  abstract final Usecase<TState, int> usecase;

  ModularPaginatedDataStore(super.initialState);

  int _currentPage = 1;
  int _totalPages = 0;

  TopBottomScrollDirection topBottomScrollDirection =
      TopBottomScrollDirection.none;

  _getData() async {
    setLoading(true);
    final result = await usecase(_currentPage);
    result.fold((error) => setError(error), (success) {
      _totalPages = success.totalPages;
      _currentPage = success.page;
      update(success);
    });
    setLoading(false);
  }

  @override
  void loadNext() {
    if (_currentPage < _totalPages) {
      _currentPage = _currentPage + 1;
    }
    topBottomScrollDirection = TopBottomScrollDirection.bottom;
    _getData();
  }

  @override
  void loadPrevious() {
    if (_currentPage > 1) {
      _currentPage = _currentPage - 1;
    } else {
      _currentPage = 1;
    }
    topBottomScrollDirection = TopBottomScrollDirection.top;
    _getData();
  }

  @override
  void loadFirt() {
    topBottomScrollDirection = TopBottomScrollDirection.none;
    _currentPage = 1;
    _getData();
  }
}
