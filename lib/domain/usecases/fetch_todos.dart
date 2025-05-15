import 'package:todo_list_app/domain/entities/todo.dart';
import 'package:todo_list_app/domain/repositories/todo_repository.dart';

class FetchTodos {
  final TodoRepository repository;

  FetchTodos(this.repository);

  Future<List<Todo>> call() async {
    return await repository.fetchTodos();
  }
}
