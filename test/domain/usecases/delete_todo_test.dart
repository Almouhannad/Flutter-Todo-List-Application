import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list_app/domain/repositories/todo_repository.dart';
import 'package:todo_list_app/domain/usecases/delete_todo.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late DeleteTodo usecase;
  late MockTodoRepository mockRepo;

  setUp(() {
    mockRepo = MockTodoRepository();
    usecase = DeleteTodo(mockRepo);
  });

  const testId = '1';

  test('should call repository to delete the todo by id', () async {
    when(() => mockRepo.deleteTodo(testId)).thenAnswer((_) async {});
    await usecase.call(testId);
    verify(() => mockRepo.deleteTodo(testId)).called(1);
  });
}
