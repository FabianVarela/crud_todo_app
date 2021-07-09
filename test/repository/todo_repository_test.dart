import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../common/services_factory.mocks.dart';

void main() {
  late MockTodoService mockTodoService;
  late ITodoRepository todoRepository;

  setUpAll(() {
    mockTodoService = MockTodoService();
    todoRepository = TodoRepository(mockTodoService);
  });

  group('$TodoRepository', () {
    final todo = Todo(
      id: 'id',
      subject: 'subject',
      finalDate: DateTime.now(),
      categoryId: 'categoryId',
    );

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
  });
}
