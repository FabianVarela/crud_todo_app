import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils/mocks.dart';
import '../test_utils/params_factory.dart';

void main() {
  late MockTodoService mockTodoService;
  late ITodoRepository todoRepository;

  setUpAll(() {
    mockTodoService = MockTodoService();
    registerFallbackValue(MyTodoFake());

    // Using simple Riverpod to test dependencies
    final container = ProviderContainer(
      overrides: [todoServicePod.overrideWithValue(mockTodoService)],
    );
    todoRepository = container.read(todoRepositoryPod);
  });

  group('$TodoRepository', () {
    test(
        'should return $List of $Todo '
        'when getTodosByCategory is called', () async {
      // arrange
      final stream = Stream.value([existingTodo]);
      when(() => mockTodoService.getTodosByCategory(any())).thenAnswer(
        (_) => stream,
      );

      // act
      final result = todoRepository.getTodosByCategory('catId');

      // assert
      expect(result, isA<Stream<List<Todo>>>());
      expect(result, stream);

      verify(() => mockTodoService.getTodosByCategory(any()));
      verifyNoMoreInteractions(mockTodoService);
    });

    test(
        'should return $Category '
        'when getTodoById is called', () async {
      // arrange
      final future = Future.value(existingTodo);
      when(() => mockTodoService.getTodoById(any(), any()))
          .thenAnswer((_) => future);

      // act
      final result = todoRepository.getTodoById(categoryId, existingTodo.id!);

      // assert
      expect(result, isA<Future<Todo>>());
      expect(result, future);

      verify(() => mockTodoService.getTodoById(any(), any()));
      verifyNoMoreInteractions(mockTodoService);
    });

    test('should save todo when saveTodo is called', () {
      // arrange
      when(() => mockTodoService.saveTodo(any())).thenAnswer(
        (_) => Future.value(),
      );

      // act
      final result = todoRepository.saveTodo(existingTodo);

      // assert
      expect(result, isA<Future<void>>());

      verify(() => mockTodoService.saveTodo(any()));
      verifyNoMoreInteractions(mockTodoService);
    });

    test('should delete todo when deleteTodo is called', () {
      // arrange
      when(() => mockTodoService.deleteTodo(any(), any())).thenAnswer(
        (_) => Future.value(),
      );

      // act
      final result = todoRepository.deleteTodo(todoId, categoryId);

      // assert
      expect(result, isA<Future<void>>());

      verify(() => mockTodoService.deleteTodo(any(), any()));
      verifyNoMoreInteractions(mockTodoService);
    });
  });
}
