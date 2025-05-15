import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list_app/domain/entities/todo.dart';
import 'package:todo_list_app/domain/repositories/todo_repository.dart';
import 'package:todo_list_app/domain/usecases/update_todo.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late UpdateTodo usecase;
  late MockTodoRepository mockRepo;

  setUp(() {
    mockRepo = MockTodoRepository();
    usecase = UpdateTodo(mockRepo);
  });

  final testTodo = const Todo(id: '1', title: 'Updated', isCompleted: true);

  test('should call repository to update the todo', () async {
    when(() => mockRepo.updateTodo(testTodo)).thenAnswer((_) async {});
    await usecase.call(testTodo);
    verify(() => mockRepo.updateTodo(testTodo)).called(1);
  });
}
