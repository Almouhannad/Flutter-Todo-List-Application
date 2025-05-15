import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/injection.dart';
import 'package:todo_list_app/presentation/bloc/todo_bloc.dart';
import 'package:todo_list_app/presentation/bloc/todo_event.dart';
import 'package:todo_list_app/presentation/pages/todo_page.dart';

void main() async {
  //DI
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();

  runApp(
    BlocProvider(
      create: (_) => sl<TodoBloc>()..add(LoadTodos()),
      child: const TodoApp(),
    ),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TodoPage(),
    );
  }
}
