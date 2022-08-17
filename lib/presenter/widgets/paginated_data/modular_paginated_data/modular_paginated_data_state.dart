import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/domain/entities/paged_data.dart';

import '../scroll/top_bottom_scroll_listener.dart';
import 'modular_paginated_data_store.dart';

abstract class ModularPaginatedDataState<TWidget extends StatefulWidget, T,
        TStorePaginated extends ModularPaginatedDataStore<T, PagedData<T>>>
    extends ModularState<TWidget, TStorePaginated>
    implements ITopBottomReachedScrollListener {
  @override
  void onBottomReached() {
    store.loadNext();
  }

  @override
  void onTopReached() {
    store.loadPrevious();
  }

  @override
  void initState() {
    super.initState();
    store.loadFirt();
  }
}
