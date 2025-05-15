import 'package:todo_list_app/domain/repositories/todo_repository.dart';

class DeleteTodo {
  final TodoRepository repository;

  DeleteTodo(this.repository);

  Future<void> call(String id) async {
    return await repository.deleteTodo(id);
  }
}
