import 'package:get_it/get_it.dart';
import 'package:todo_list_app/data/datasources/todo_local_datasource.dart';
import 'package:todo_list_app/data/repositories/todo_repository_impl.dart';
import 'package:todo_list_app/domain/repositories/todo_repository.dart';

final sl = GetIt.instance;

Future<void> initInjection() async {
  // Data sources
  sl.registerLazySingleton<TodoLocalDataSource>(
    () => TodoLocalDataSourceImpl(),
  );

  // Repositories
  sl.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(localDataSource: sl()),
  );

  // You can add other services (use cases, Blocs, etc.) here later
}
