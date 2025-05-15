import 'package:equatable/equatable.dart';
import 'package:todo_list_app/domain/entities/todo.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class LoadTodos extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final Todo todo;
  const AddTodoEvent(this.todo);

  @override
  List<Object?> get props => [todo];
}

class UpdateTodoEvent extends TodoEvent {
  final Todo todo;
  const UpdateTodoEvent(this.todo);

  @override
  List<Object?> get props => [todo];
}

class DeleteTodoEvent extends TodoEvent {
  final String id;
  const DeleteTodoEvent(this.id);

  @override
  List<Object?> get props => [id];
}
