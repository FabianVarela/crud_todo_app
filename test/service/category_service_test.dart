import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/service/category_service.dart';
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

  late CategoryService categoryService;

  setUpAll(() {
    mockFirestoreInstance = MockFirestore();
    mockCollectionReference = MockCollectionReference();
    mockDocumentReference = MockDocumentReference();
    mockDocumentSnapshot = MockDocumentSnapshot(category.id!);
    mockQuerySnapshot = MockQuerySnapshot();
    mockQueryDocumentSnapshot = MockQueryDocumentSnapshot(category.id!);
    mockQuery = MockQuery();

    // Using simple Riverpod to test dependencies
    final container = ProviderContainer(
      overrides: [firebasePod.overrideWithValue(mockFirestoreInstance)],
    );
    categoryService = container.read(categoryServicePod);
  });

  group('$CategoryService', () {
    test('Get $Category list from Firestore mock', () async {
      // arrange
      when(() => mockFirestoreInstance.collection(any()))
          .thenReturn(mockCollectionReference);

      when(() => mockCollectionReference.snapshots())
          .thenAnswer((_) => Stream.value(mockQuerySnapshot));

      when(() => mockQuerySnapshot.docs)
          .thenReturn([mockQueryDocumentSnapshot]);

      when(() => mockQueryDocumentSnapshot.toMap())
          .thenReturn(category.toJson());

      // act
      final result = categoryService.getCategories();
      final finalResult = await result.first;

      // assert
      expect(result, isA<Stream<List<Category>>>());
      expect(finalResult, isA<List<Category>>());
      expect(finalResult, [category]);
      verify(() => mockFirestoreInstance.collection(any())).called(1);
    });

    test('Get $Category data by id from Firestore mock', () async {
      // arrange
      when(() => mockFirestoreInstance.collection(any()))
          .thenReturn(mockCollectionReference);

      when(() => mockCollectionReference.doc(any()))
          .thenReturn(mockDocumentReference);

      when(() => mockDocumentReference.get())
          .thenAnswer((_) => Future.value(mockDocumentSnapshot));

      when(() => mockDocumentSnapshot.exists).thenReturn(true);

      when(() => mockDocumentSnapshot.toMap()).thenReturn(category.toJson());

      // act
      final result = categoryService.getCategoryById(category.id!);
      final finalResult = await result;

      // assert
      expect(result, isA<Future<Category>>());
      expect(finalResult, isA<Category>());
      expect(finalResult, category);
      verify(() => mockFirestoreInstance.collection(any()).doc(any()))
          .called(1);
    });

    test("Get $Exception if category by id doesn't exists", () async {
      // arrange
      when(() => mockFirestoreInstance.collection(any()))
          .thenReturn(mockCollectionReference);

      when(() => mockCollectionReference.doc(any()))
          .thenReturn(mockDocumentReference);

      when(() => mockDocumentReference.get())
          .thenAnswer((_) => Future.value(mockDocumentSnapshot));

      when(() => mockDocumentSnapshot.exists).thenReturn(false);

      when(() => mockDocumentSnapshot.toMap()).thenThrow(
        Exception('Oops!!! Category not found'),
      );

      // act
      final result = categoryService.getCategoryById(category.id!);

      // assert
      expect(result, throwsA(isA<Exception>()));
      verify(() => mockFirestoreInstance.collection(any()).doc(any()))
          .called(1);
    });

    test('Save $Category from Firebase mock', () async {
      // arrange
      when(() => mockFirestoreInstance.collection(any()))
          .thenReturn(mockCollectionReference);

      when(() => mockCollectionReference.add(any()))
          .thenAnswer((_) async => mockDocumentReference);

      // act
      final result = categoryService.saveCategory(initialCategory);

      // assert
      expect(result, isA<Future<void>>());
      verify(() => mockFirestoreInstance.collection(any()).add(any()))
          .called(1);
    });

    test('Update $Category from Firebase mock', () {
      // arrange
      when(() => mockFirestoreInstance.collection(any()))
          .thenReturn(mockCollectionReference);

      when(() => mockCollectionReference.doc(any()))
          .thenReturn(mockDocumentReference);

      when(() => mockDocumentReference.update(any()))
          .thenAnswer((_) => Future.value());

      // act
      final result = categoryService.saveCategory(category);

      // assert
      expect(result, isA<Future<void>>());
      verify(
        () => mockFirestoreInstance.collection(any()).doc(any()).update(any()),
      ).called(1);
    });

    test('Remove $Category from Firebase mock', () {
      // arrange
      when(() => mockFirestoreInstance.collection(any()))
          .thenReturn(mockCollectionReference);

      when(() => mockCollectionReference.doc(any()))
          .thenReturn(mockDocumentReference);

      when(() => mockDocumentReference.delete())
          .thenAnswer((_) => Future.value());

      when(
        () => mockCollectionReference.where(
          any(),
          isEqualTo: any(named: 'isEqualTo'),
        ),
      ).thenReturn(mockQuery);

      when(() => mockQuery.get()).thenAnswer((_) async => mockQuerySnapshot);

      when(() => mockQuerySnapshot.docs)
          .thenReturn([mockQueryDocumentSnapshot]);

      when(() => mockQueryDocumentSnapshot.reference)
          .thenReturn(mockDocumentReference);

      when(() => mockDocumentReference.delete())
          .thenAnswer((_) => Future.value());

      // act
      final result = categoryService.deleteCategory(category.id!);

      // assert
      expect(result, isA<Future<void>>());
      verify(() => mockFirestoreInstance.collection(any()).doc(any()).delete())
          .called(1);
    });
  });
}
