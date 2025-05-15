import 'package:todo_list_app/data/datasources/todo_local_datasource.dart';
import 'package:todo_list_app/data/models/todo_model.dart';
import 'package:todo_list_app/domain/entities/todo.dart';
import 'package:todo_list_app/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Todo>> fetchTodos() async {
    final models = await localDataSource.fetchTodos();
    return models;
  }

  @override
  Future<void> addTodo(Todo todo) async {
    final model = TodoModel(
      id: todo.id,
      title: todo.title,
      isCompleted: todo.isCompleted,
    );
    await localDataSource.addTodo(model);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final model = TodoModel(
      id: todo.id,
      title: todo.title,
      isCompleted: todo.isCompleted,
    );
    await localDataSource.updateTodo(model);
  }

  @override
  Future<void> deleteTodo(String id) async {
    await localDataSource.deleteTodo(id);
  }
}
