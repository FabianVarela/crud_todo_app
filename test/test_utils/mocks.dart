import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/service/category_service.dart';
import 'package:crud_todo_app/service/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

/// Routes

class MockNavigator extends Mock implements NavigatorObserver {}

class MyRouteFake extends Fake implements Route<dynamic> {}

/// Firestore

class MockFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

class MockQuerySnapshot extends Mock
    implements QuerySnapshot<Map<String, dynamic>> {}

class MockQueryDocumentSnapshot extends Mock
    implements QueryDocumentSnapshot<Map<String, dynamic>> {
  MockQueryDocumentSnapshot(this.id);

  @override
  final String id;
}

class MockDocumentReference extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

class MockDocumentSnapshot extends Mock
    implements DocumentSnapshot<Map<String, dynamic>> {
  MockDocumentSnapshot(this.id);

  @override
  final String id;
}

class MockQuery extends Mock implements Query<Map<String, dynamic>> {}

/// Services

class MockCategoryService extends Mock implements CategoryService {}

class MockTodoService extends Mock implements TodoService {}

/// Models

class MyCategoryFake extends Fake implements Category {}

class MyTodoFake extends Fake implements Todo {}
