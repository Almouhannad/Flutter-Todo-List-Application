import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list_app/domain/entities/todo.dart';
import 'package:todo_list_app/domain/repositories/todo_repository.dart';
import 'package:todo_list_app/domain/usecases/add_todo.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late AddTodo usecase;
  late MockTodoRepository mockRepo;

  setUp(() {
    mockRepo = MockTodoRepository();
    usecase = AddTodo(mockRepo);
  });

  final testTodo = const Todo(id: '1', title: 'Almouhannad');

  test('should forward the todo to the repository', () async {
    // arrange
    when(() => mockRepo.addTodo(testTodo)).thenAnswer((_) async {});
    // act
    await usecase.call(testTodo);
    // assert
    verify(() => mockRepo.addTodo(testTodo)).called(1);
  });
}
