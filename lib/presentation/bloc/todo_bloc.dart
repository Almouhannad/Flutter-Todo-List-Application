import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/domain/usecases/add_todo.dart';
import 'package:todo_list_app/domain/usecases/delete_todo.dart';
import 'package:todo_list_app/domain/usecases/fetch_todos.dart';
import 'package:todo_list_app/domain/usecases/update_todo.dart';
import 'package:todo_list_app/presentation/bloc/todo_event.dart';
import 'package:todo_list_app/presentation/bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final FetchTodos fetchTodos;
  final AddTodo addTodo;
  final UpdateTodo updateTodo;
  final DeleteTodo deleteTodo;

  TodoBloc({
    required this.fetchTodos,
    required this.addTodo,
    required this.updateTodo,
    required this.deleteTodo,
  }) : super(TodosLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<UpdateTodoEvent>(_onUpdateTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
  }

  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(TodosLoading());
    try {
      final todos = await fetchTodos();
      emit(TodosLoaded(todos));
    } catch (e) {
      emit(TodosError(e.toString()));
    }
  }

  Future<void> _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await addTodo(event.todo);
      add(LoadTodos());
    } catch (e) {
      emit(TodosError(e.toString()));
    }
  }

  Future<void> _onUpdateTodo(
    UpdateTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      await updateTodo(event.todo);
      add(LoadTodos());
    } catch (e) {
      emit(TodosError(e.toString()));
    }
  }

  Future<void> _onDeleteTodo(
    DeleteTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      await deleteTodo(event.id);
      add(LoadTodos());
    } catch (e) {
      emit(TodosError(e.toString()));
    }
  }
}
