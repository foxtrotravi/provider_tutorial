import 'dart:collection';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todoList = [];

  UnmodifiableListView<Todo> get todoList => UnmodifiableListView(_todoList);

  void add(Todo todo) {
    _todoList.add(todo);
    notifyListeners();
  }

  void toggle(int index) {
    _todoList[index].toggle();
    notifyListeners();
  }
}

class Todo {
  bool _isCompleted;
  final String _title;

  Todo({
    required bool isCompleted,
    required String title,
  })  : _isCompleted = isCompleted,
        _title = title;

  String get title => _title;
  bool get isCompleted => _isCompleted;

  void toggle() {
    _isCompleted = !_isCompleted;
  }

  @override
  String toString() => 'Todo(_isCompleted: $_isCompleted, _title: $_title)';

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other._isCompleted == _isCompleted && other._title == _title;
  }

  @override
  int get hashCode => _isCompleted.hashCode ^ _title.hashCode;
}
