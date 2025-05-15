import 'package:todo_list_app/domain/entities/todo.dart';
import 'package:todo_list_app/domain/repositories/todo_repository.dart';

class AddTodo {
  final TodoRepository repository;

  AddTodo(this.repository);

  Future<void> call(Todo todo) async {
    return await repository.addTodo(todo);
  }
}
