import 'dart:collection';

import 'package:todo_list_app/data/models/todo_model.dart';

// In-memory repository
abstract class TodoLocalDataSource {
  Future<List<TodoModel>> fetchTodos();
  Future<void> addTodo(TodoModel todo);
  Future<void> updateTodo(TodoModel todo);
  Future<void> deleteTodo(String id);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final List<TodoModel> _storage = [];

  @override
  Future<List<TodoModel>> fetchTodos() async {
    // simulate latency
    await Future.delayed(const Duration(milliseconds: 200));
    return UnmodifiableListView(_storage);
  }

  @override
  Future<void> addTodo(TodoModel todo) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _storage.add(todo);
  }

  @override
  Future<void> updateTodo(TodoModel todo) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final index = _storage.indexWhere((t) => t.id == todo.id);
    if (index >= 0) {
      _storage[index] = todo;
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _storage.removeWhere((t) => t.id == id);
  }
}
