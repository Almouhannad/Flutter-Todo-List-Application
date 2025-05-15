import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list_app/domain/entities/todo.dart';
import 'package:todo_list_app/presentation/bloc/todo_bloc.dart';
import 'package:todo_list_app/presentation/bloc/todo_event.dart';
import 'package:todo_list_app/presentation/bloc/todo_state.dart';
import 'package:todo_list_app/presentation/pages/todo_page.dart';

class MockTodoBloc extends Mock implements TodoBloc {}

void main() {
  late MockTodoBloc mockTodoBloc;

  setUpAll(() {
    registerFallbackValue(AddTodoEvent(Todo(id: '0', title: 'dummy')));
  });

  setUp(() {
    mockTodoBloc = MockTodoBloc();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<TodoBloc>.value(
        value: mockTodoBloc,
        child: const TodoPage(),
      ),
    );
  }

  group('TodoPage Widget Tests', () {
    testWidgets('shows loading indicator when state is TodosLoading', (
      WidgetTester tester,
    ) async {
      when(() => mockTodoBloc.state).thenReturn(TodosLoading());
      when(
        () => mockTodoBloc.stream,
      ).thenAnswer((_) => Stream.value(TodosLoading()));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows empty message when todos list is empty', (
      WidgetTester tester,
    ) async {
      when(() => mockTodoBloc.state).thenReturn(const TodosLoaded([]));
      when(
        () => mockTodoBloc.stream,
      ).thenAnswer((_) => Stream.value(const TodosLoaded([])));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.text('No to-dos yet!'), findsOneWidget);
    });

    testWidgets('shows list of todos when todos are present', (
      WidgetTester tester,
    ) async {
      final todos = [
        Todo(id: '1', title: 'Test Todo 1'),
        Todo(id: '2', title: 'Test Todo 2'),
      ];
      when(() => mockTodoBloc.state).thenReturn(TodosLoaded(todos));
      when(
        () => mockTodoBloc.stream,
      ).thenAnswer((_) => Stream.value(TodosLoaded(todos)));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.text('Test Todo 1'), findsOneWidget);
      expect(find.text('Test Todo 2'), findsOneWidget);
    });

    testWidgets('shows error message when state is TodosError', (
      WidgetTester tester,
    ) async {
      const errorMessage = 'Test Error';
      when(() => mockTodoBloc.state).thenReturn(const TodosError(errorMessage));
      when(
        () => mockTodoBloc.stream,
      ).thenAnswer((_) => Stream.value(const TodosError(errorMessage)));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.text('Error: $errorMessage'), findsOneWidget);
    });

    testWidgets('can add new todo through FAB', (WidgetTester tester) async {
      when(() => mockTodoBloc.state).thenReturn(const TodosLoaded([]));
      when(
        () => mockTodoBloc.stream,
      ).thenAnswer((_) => Stream.value(const TodosLoaded([])));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Tap the FAB
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Enter text in the dialog
      await tester.enterText(find.byType(TextField), 'New Todo');
      await tester.pump();

      // Tap the Add button
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      // Verify that AddTodoEvent was added to the bloc
      verify(() => mockTodoBloc.add(any<AddTodoEvent>())).called(1);
    });
  });
}
