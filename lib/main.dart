import 'package:flutter/material.dart';
import 'package:todo_list_app/injection.dart';
import 'package:todo_list_app/presentation/pages/todo_page.dart';

void main() async {
  //DI
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();

  runApp(const TodoApp());
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
