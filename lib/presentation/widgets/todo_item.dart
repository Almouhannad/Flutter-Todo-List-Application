import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/domain/entities/todo.dart';
import 'package:todo_list_app/presentation/bloc/todo_bloc.dart';
import 'package:todo_list_app/presentation/bloc/todo_event.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (_) {
          // Toggle completion
          final updated = Todo(
            id: todo.id,
            title: todo.title,
            isCompleted: !todo.isCompleted,
          );
          // Use a Builder or ensure context is below BlocProvider
          context.read<TodoBloc>().add(UpdateTodoEvent(updated));
        },
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          context.read<TodoBloc>().add(DeleteTodoEvent(todo.id));
        },
      ),
    );
  }
}
