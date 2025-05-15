import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/domain/entities/todo.dart';
import 'package:todo_list_app/presentation/bloc/todo_bloc.dart';
import 'package:todo_list_app/presentation/bloc/todo_event.dart';
import 'package:todo_list_app/presentation/bloc/todo_state.dart';
import 'package:todo_list_app/presentation/widgets/todo_item.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My To-Do List')),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodosLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodosLoaded) {
            final todos = state.todos;
            if (todos.isEmpty) {
              return const Center(child: Text('No to-dos yet!'));
            }
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (_, index) {
                return TodoItem(todo: todos[index]);
              },
            );
          } else if (state is TodosError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: Builder(
        builder:
            (innerCtx) => FloatingActionButton(
              onPressed: () async {
                final title = await showDialog<String>(
                  context: context,
                  builder: (_) {
                    String input = '';
                    return AlertDialog(
                      title: const Text('New To-Do'),
                      content: TextField(
                        onChanged: (v) => input = v,
                        decoration: const InputDecoration(
                          hintText: 'Enter title',
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, input),
                          child: const Text('Add'),
                        ),
                      ],
                    );
                  },
                );
                if (title != null && title.trim().isNotEmpty) {
                  final newTodo = Todo(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: title.trim(),
                  );
                  innerCtx.read<TodoBloc>().add(AddTodoEvent(newTodo));
                }
              },
              child: const Icon(Icons.add),
            ),
      ),
    );
  }
}
