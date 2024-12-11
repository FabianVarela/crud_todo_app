// ignore_for_file: subtype_of_sealed_class

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/service/category_service.dart';
import 'package:crud_todo_app/service/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

/// Routes

final class MockNavigator extends Mock implements NavigatorObserver {}

/// Firestore

final class MockFirestore extends Mock implements FirebaseFirestore {}

final class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

final class MockQuerySnapshot extends Mock
    implements QuerySnapshot<Map<String, dynamic>> {}

final class MockQueryDocumentSnapshot extends Mock
    implements QueryDocumentSnapshot<Map<String, dynamic>> {
  MockQueryDocumentSnapshot(this.id);

  @override
  final String id;
}

final class MockDocumentReference extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

final class MockDocumentSnapshot extends Mock
    implements DocumentSnapshot<Map<String, dynamic>> {
  MockDocumentSnapshot(this.id);

  @override
  final String id;
}

final class MockQuery extends Mock implements Query<Map<String, dynamic>> {}

/// Services

final class MockCategoryService extends Mock implements CategoryService {}

final class MockTodoService extends Mock implements TodoService {}

/// Models

final class MyCategoryFake extends Fake implements Category {}

final class MyTodoFake extends Fake implements Todo {}
