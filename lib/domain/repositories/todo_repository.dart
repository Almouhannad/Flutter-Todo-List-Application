import 'package:todo_list_app/domain/entities/todo.dart';

abstract class TodoRepository {
  /// Returns the list of all To-Dos.
  Future<List<Todo>> fetchTodos();

  /// Adds a new To-Do.
  Future<void> addTodo(Todo todo);

  /// Updates an existing To-Do.
  Future<void> updateTodo(Todo todo);

  /// Deletes a To-Do by its id.
  Future<void> deleteTodo(String id);
}
