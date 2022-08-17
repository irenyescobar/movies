import 'package:flutter/material.dart';
import 'top_bottom_scroll_listener.dart';

class TopBottomReachedScrollController extends ScrollController {
  final ITopBottomReachedScrollListener _listener;

  TopBottomReachedScrollController(this._listener) {
    addListener(_onScroll);
  }

  void _onScroll() {
    if (position.atEdge) {
      if (position.pixels == 0) {
        _listener.onTopReached();
      } else {
        _listener.onBottomReached();
      }
    }
  }
}
