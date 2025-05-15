import 'package:todo_list_app/domain/entities/todo.dart';
import 'package:todo_list_app/domain/repositories/todo_repository.dart';

class UpdateTodo {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  Future<void> call(Todo todo) async {
    return await repository.updateTodo(todo);
  }
}
