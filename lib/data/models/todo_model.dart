import 'package:todo_list_app/domain/entities/todo.dart';

class TodoModel extends Todo {
  const TodoModel({required super.id, required super.title, super.isCompleted});

  /// Convert JSON to model
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'isCompleted': isCompleted};
  }
}
