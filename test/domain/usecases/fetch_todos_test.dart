import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list_app/domain/entities/todo.dart';
import 'package:todo_list_app/domain/repositories/todo_repository.dart';
import 'package:todo_list_app/domain/usecases/fetch_todos.dart';

// 1. Mock Repository
class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late FetchTodos usecase;
  late MockTodoRepository mockRepo;

  setUp(() {
    mockRepo = MockTodoRepository();
    usecase = FetchTodos(mockRepo);
  });

  final testTodos = [
    const Todo(id: '1', title: 'Test 1'),
    const Todo(id: '2', title: 'Test 2'),
  ];

  test('should return list of todos from repository', () async {
    // arrange
    when(() => mockRepo.fetchTodos()).thenAnswer((_) async => testTodos);
    // act
    final result = await usecase.call();
    // assert
    expect(result, testTodos);
    verify(() => mockRepo.fetchTodos()).called(1);
  });
}
