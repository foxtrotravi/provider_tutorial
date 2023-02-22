import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _count;
  CounterModel(this._count);

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
