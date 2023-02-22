import 'dart:collection';

import 'package:flutter/material.dart';

class BreadCrumbProvider extends ChangeNotifier {
  final List<BreadCrumb> _breadCrumbs = [];
  UnmodifiableListView<BreadCrumb> get items =>
      UnmodifiableListView(_breadCrumbs);

  void add(BreadCrumb newBreadCrumb) {
    for (final breadCrumb in _breadCrumbs) {
      breadCrumb.activate();
    }
    _breadCrumbs.add(newBreadCrumb);
    notifyListeners();
  }

  void reset() {
    _breadCrumbs.clear();
    notifyListeners();
  }
}

class BreadCrumb {
  final String _title;
  bool _isActive;

  BreadCrumb({
    required String title,
    required bool isActive,
  })  : _title = title,
        _isActive = isActive;

  void activate() {
    _isActive = true;
  }

  String get title => _title;
  bool get isActive => _isActive;
}
