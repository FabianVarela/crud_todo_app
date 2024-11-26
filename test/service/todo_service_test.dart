import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/service/todo_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../test_utils/mocks.dart';
import '../test_utils/params_factory.dart';

void main() {
  late MockFirestore mockFirestoreInstance;
  late MockCollectionReference mockCollectionReference;
  late MockDocumentReference mockDocumentReference;
  late MockDocumentSnapshot mockDocumentSnapshot;
  late MockQuerySnapshot mockQuerySnapshot;
  late MockQueryDocumentSnapshot mockQueryDocumentSnapshot;
  late MockQuery mockQuery;

  late TodoService todoService;

  setUpAll(() {
    mockFirestoreInstance = MockFirestore();
    mockCollectionReference = MockCollectionReference();
    mockDocumentReference = MockDocumentReference();
    mockDocumentSnapshot = MockDocumentSnapshot(existingTodo.id!);
    mockQuerySnapshot = MockQuerySnapshot();
    mockQueryDocumentSnapshot = MockQueryDocumentSnapshot(existingTodo.id!);
    mockQuery = MockQuery();

    // Using simple Riverpod to test dependencies
    final container = ProviderContainer(
      overrides: [firebaseProvider.overrideWithValue(mockFirestoreInstance)],
    );
    todoService = container.read(todoServiceProvider);
  });

  void initializeWhenCategory(String categoryId) {
    final categoryCollectionRef = MockCollectionReference();
    final categoryDocumentRef = MockDocumentReference();

    when(
      () => mockFirestoreInstance.collection(categoryCollection),
    ).thenReturn(categoryCollectionRef);
    when(
      () => categoryCollectionRef.doc(categoryId),
    ).thenAnswer((_) => categoryDocumentRef);
    when(() => categoryDocumentRef.update(any())).thenAnswer(
      (_) => Future.value(),
    );
  }

  group('$TodoService', () {
    test('Get $Todo list from Firebase mock', () async {
      // arrange
      const fieldName = 'categoryId';

      when(
        () => mockFirestoreInstance.collection(todoCollection),
      ).thenReturn(mockCollectionReference);

      when(
        () => mockCollectionReference.where(
          fieldName,
          isEqualTo: any(named: 'isEqualTo'),
        ),
      ).thenReturn(mockQuery);

      when(
        () => mockQuery.snapshots(),
      ).thenAnswer((_) => Stream.value(mockQuerySnapshot));

      when(() => mockQuerySnapshot.docs)
          .thenReturn([mockQueryDocumentSnapshot]);

      when(() => mockQueryDocumentSnapshot.toMap)
          .thenReturn(existingTodo.toJson());

      // act
      final result = todoService.getTodosByCategory(existingTodo.categoryId);
      final finalResult = await result.first;

      // assert
      expect(result, isA<Stream<List<Todo>>>());
      expect(finalResult, isA<List<Todo>>());
      expect(finalResult, [existingTodo]);

      verify(
        () => mockFirestoreInstance
            .collection(todoCollection)
            .where(fieldName, isEqualTo: any(named: 'isEqualTo')),
      ).called(1);
    });

    test('Get $Todo by id from Firebase mock', () async {
      // arrange
      when(
        () => mockFirestoreInstance.collection(todoCollection),
      ).thenReturn(mockCollectionReference);

      when(
        () => mockCollectionReference.doc(todoId),
      ).thenReturn(mockDocumentReference);

      when(
        () => mockDocumentReference.get(),
      ).thenAnswer((_) => Future.value(mockDocumentSnapshot));

      when(() => mockDocumentSnapshot.exists).thenReturn(true);
      when(() => mockDocumentSnapshot.toMap).thenReturn(existingTodo.toJson());

      // act
      final result = todoService.getTodoById(categoryId, existingTodo.id!);
      final finalResult = await result;

      // assert
      expect(result, isA<Future<Todo>>());
      expect(finalResult, isA<Todo>());
      expect(finalResult, existingTodo);

      verify(
        () => mockFirestoreInstance.collection(todoCollection).doc(todoId),
      ).called(1);
    });

    test("Get $Exception if todo by id doesn't exists", () async {
      // arrange
      when(
        () => mockFirestoreInstance.collection(todoCollection),
      ).thenReturn(mockCollectionReference);

      when(
        () => mockCollectionReference.doc(todoId),
      ).thenReturn(mockDocumentReference);

      when(
        () => mockDocumentReference.get(),
      ).thenAnswer((_) => Future.value(mockDocumentSnapshot));

      when(() => mockDocumentSnapshot.exists).thenReturn(false);
      when(() => mockDocumentSnapshot.toMap).thenThrow(
        Exception('Oops!!! Todo not found'),
      );

      // act
      final result = todoService.getTodoById(categoryId, existingTodo.id!);

      // assert
      await expectLater(result, throwsA(isA<Exception>()));

      verify(
        () => mockFirestoreInstance.collection(todoCollection).doc(todoId),
      ).called(1);
    });

    test('Save $Todo from Firebase mock', () {
      // arrange
      initializeWhenCategory(initialTodo.categoryId);

      when(
        () => mockFirestoreInstance.collection(todoCollection),
      ).thenReturn(mockCollectionReference);
      when(
        () => mockCollectionReference.add(initialTodo.toJson()),
      ).thenAnswer((_) async => mockDocumentReference);

      // act
      final result = todoService.saveTodo(initialTodo);

      // assert
      expect(result, isA<Future<void>>());

      verify(
        () => mockFirestoreInstance
            .collection(todoCollection)
            .add(initialTodo.toJson()),
      ).called(1);
    });

    test('Update $Todo from Firebase mock', () {
      // arrange
      final path = existingTodo.id!;
      final data = existingTodo.toJson();

      when(
        () => mockFirestoreInstance.collection(todoCollection),
      ).thenReturn(mockCollectionReference);

      when(
        () => mockCollectionReference.doc(path),
      ).thenReturn(mockDocumentReference);

      when(
        () => mockDocumentReference.update(data),
      ).thenAnswer((_) => Future.value());

      // act
      final result = todoService.saveTodo(existingTodo.copyWith());

      // assert
      expect(result, isA<Future<void>>());

      verify(
        () => mockFirestoreInstance
            .collection(todoCollection)
            .doc(path)
            .update(data),
      ).called(1);
    });

    test('Remove $Todo from Firebase mock', () {
      // arrange
      initializeWhenCategory(existingTodo.categoryId);

      when(
        () => mockFirestoreInstance.collection(todoCollection),
      ).thenReturn(mockCollectionReference);
      when(
        () => mockCollectionReference.doc(existingTodo.id),
      ).thenReturn(mockDocumentReference);
      when(mockDocumentReference.delete).thenAnswer((_) => Future.value());

      // act
      final result = todoService.deleteTodo(
        existingTodo.id!,
        existingTodo.categoryId,
      );

      // assert
      expect(result, isA<Future<void>>());

      verify(
        () => mockFirestoreInstance
            .collection(todoCollection)
            .doc(existingTodo.id)
            .delete(),
      ).called(1);
    });
  });
}
