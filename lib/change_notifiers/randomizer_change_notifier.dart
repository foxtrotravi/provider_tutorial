import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerProvider extends ChangeNotifier {
  int _max;
  int _min;
  int? _generatedNumber;
  final random = Random();

  RandomizerProvider({
    required int max,
    required int min,
  })  : _max = max,
        _min = min;

  int get max => _max;
  int get min => _min;
  int? get getGeneratedNumber => _generatedNumber;

  void setMax(int max) {
    _max = max;
    notifyListeners();
  }

  void setMin(int min) {
    _min = min;
    notifyListeners();
  }

  void generateRandomNumber() {
    _generatedNumber = min + random.nextInt(max - min);
    notifyListeners();
  }
}
