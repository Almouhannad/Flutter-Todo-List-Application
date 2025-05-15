import 'package:get_it/get_it.dart';
import 'package:todo_list_app/data/datasources/todo_local_datasource.dart';
import 'package:todo_list_app/data/repositories/todo_repository_impl.dart';
import 'package:todo_list_app/domain/repositories/todo_repository.dart';
import 'package:todo_list_app/domain/usecases/add_todo.dart';
import 'package:todo_list_app/domain/usecases/delete_todo.dart';
import 'package:todo_list_app/domain/usecases/fetch_todos.dart';
import 'package:todo_list_app/domain/usecases/update_todo.dart';
import 'package:todo_list_app/presentation/bloc/todo_bloc.dart';

final sl = GetIt.instance;

Future<void> initInjection() async {
  // Data sources & repositories (as before) …
  sl.registerLazySingleton<TodoLocalDataSource>(
    () => TodoLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(localDataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => FetchTodos(sl()));
  sl.registerLazySingleton(() => AddTodo(sl()));
  sl.registerLazySingleton(() => UpdateTodo(sl()));
  sl.registerLazySingleton(() => DeleteTodo(sl()));

  // Bloc
  sl.registerFactory(
    () => TodoBloc(
      fetchTodos: sl(),
      addTodo: sl(),
      updateTodo: sl(),
      deleteTodo: sl(),
    ),
  );
}
