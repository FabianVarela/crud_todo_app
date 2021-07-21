import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../service/services_factory.mocks.dart';
import '../test_utils/params_factory.dart';

void main() {
  late MockTodoService mockTodoService;
  late ITodoRepository todoRepository;

  setUpAll(() {
    mockTodoService = MockTodoService();
    todoRepository = TodoRepository(mockTodoService);
  });

  group('$TodoRepository', () {
    test(
        'should return $List of $Todo '
        'when getTodosByCategory is called', () async {
      // arrange
      final stream = Stream.value([todo]);
      when(mockTodoService.getTodosByCategory(any)).thenAnswer((_) => stream);

      // act
      final result = todoRepository.getTodosByCategory('catId');

      // assert
      expect(result, isA<Stream<List<Todo>>>());
      expect(result, stream);

      verify(mockTodoService.getTodosByCategory(any));
      verifyNoMoreInteractions(mockTodoService);
    });

    test('should save todo when saveTodo is called', () {
      // arrange
      when(mockTodoService.saveTodo(any)).thenAnswer((_) => Future.value());

      // act
      final result = todoRepository.saveTodo(todo);

      // assert
      expect(result, isA<Future<void>>());

      verify(mockTodoService.saveTodo(any));
      verifyNoMoreInteractions(mockTodoService);
    });

    test('should delete todo when deleteTodo is called', () {
      // arrange
      when(mockTodoService.deleteTodo(any, any)).thenAnswer(
        (_) => Future.value(),
      );

      // act
      final result = todoRepository.deleteTodo(todoId, categoryId);

      // assert
      expect(result, isA<Future<void>>());

      verify(mockTodoService.deleteTodo(any, any));
      verifyNoMoreInteractions(mockTodoService);
    });
  });
}
