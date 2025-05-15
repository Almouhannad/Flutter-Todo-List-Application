import 'package:equatable/equatable.dart';
import 'package:todo_list_app/domain/entities/todo.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

class TodosLoading extends TodoState {}

class TodosLoaded extends TodoState {
  final List<Todo> todos;
  const TodosLoaded(this.todos);

  @override
  List<Object?> get props => [todos];
}

class TodosError extends TodoState {
  final String message;
  const TodosError(this.message);

  @override
  List<Object?> get props => [message];
}
