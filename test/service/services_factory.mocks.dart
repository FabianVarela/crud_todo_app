// Mocks generated by Mockito 5.0.10 from annotations
// in crud_todo_app/test/common/services_factory.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:crud_todo_app/model/category_model.dart' as _i6;
import 'package:crud_todo_app/model/todo_model.dart' as _i4;
import 'package:crud_todo_app/service/category_service.dart' as _i5;
import 'package:crud_todo_app/service/todo_service.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeDuration extends _i1.Fake implements Duration {
  @override
  String toString() => super.toString();
}

class _FakeDateTime extends _i1.Fake implements DateTime {
  @override
  String toString() => super.toString();
}

/// A class which mocks [TodoService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoService extends _i1.Mock implements _i2.TodoService {
  MockTodoService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<List<_i4.Todo>> getTodosByCategory(String? catId) =>
      (super.noSuchMethod(Invocation.method(#getTodosByCategory, [catId]),
              returnValue: Stream<List<_i4.Todo>>.empty())
          as _i3.Stream<List<_i4.Todo>>);
  @override
  _i3.Future<void> saveTodo(_i4.Todo? todo) =>
      (super.noSuchMethod(Invocation.method(#saveTodo, [todo]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> deleteTodo(String? todoId, String? catId) =>
      (super.noSuchMethod(Invocation.method(#deleteTodo, [todoId, catId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
}

/// A class which mocks [CategoryService].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategoryService extends _i1.Mock implements _i5.CategoryService {
  MockCategoryService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<List<_i6.Category>> getCategories() =>
      (super.noSuchMethod(Invocation.method(#getCategories, []),
              returnValue: Stream<List<_i6.Category>>.empty())
          as _i3.Stream<List<_i6.Category>>);
  @override
  _i3.Future<void> saveCategory(_i6.Category? category) =>
      (super.noSuchMethod(Invocation.method(#saveCategory, [category]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> deleteCategory(String? catId) =>
      (super.noSuchMethod(Invocation.method(#deleteCategory, [catId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
}

/// A class which mocks [DateTime].
///
/// See the documentation for Mockito's code generation for more information.
class ArgelDateTimeMock extends _i1.Mock implements DateTime {
  @override
  bool get isUtc =>
      (super.noSuchMethod(Invocation.getter(#isUtc), returnValue: false)
          as bool);
  @override
  int get millisecondsSinceEpoch =>
      (super.noSuchMethod(Invocation.getter(#millisecondsSinceEpoch),
          returnValue: 0) as int);
  @override
  int get microsecondsSinceEpoch =>
      (super.noSuchMethod(Invocation.getter(#microsecondsSinceEpoch),
          returnValue: 0) as int);
  @override
  String get timeZoneName =>
      (super.noSuchMethod(Invocation.getter(#timeZoneName), returnValue: '')
          as String);
  @override
  Duration get timeZoneOffset =>
      (super.noSuchMethod(Invocation.getter(#timeZoneOffset),
          returnValue: _FakeDuration()) as Duration);
  @override
  int get year =>
      (super.noSuchMethod(Invocation.getter(#year), returnValue: 0) as int);
  @override
  int get month =>
      (super.noSuchMethod(Invocation.getter(#month), returnValue: 0) as int);
  @override
  int get day =>
      (super.noSuchMethod(Invocation.getter(#day), returnValue: 0) as int);
  @override
  int get hour =>
      (super.noSuchMethod(Invocation.getter(#hour), returnValue: 0) as int);
  @override
  int get minute =>
      (super.noSuchMethod(Invocation.getter(#minute), returnValue: 0) as int);
  @override
  int get second =>
      (super.noSuchMethod(Invocation.getter(#second), returnValue: 0) as int);
  @override
  int get millisecond =>
      (super.noSuchMethod(Invocation.getter(#millisecond), returnValue: 0)
          as int);
  @override
  int get microsecond =>
      (super.noSuchMethod(Invocation.getter(#microsecond), returnValue: 0)
          as int);
  @override
  int get weekday =>
      (super.noSuchMethod(Invocation.getter(#weekday), returnValue: 0) as int);
  @override
  bool isBefore(DateTime? other) =>
      (super.noSuchMethod(Invocation.method(#isBefore, [other]),
          returnValue: false) as bool);
  @override
  bool isAfter(DateTime? other) =>
      (super.noSuchMethod(Invocation.method(#isAfter, [other]),
          returnValue: false) as bool);
  @override
  bool isAtSameMomentAs(DateTime? other) =>
      (super.noSuchMethod(Invocation.method(#isAtSameMomentAs, [other]),
          returnValue: false) as bool);
  @override
  int compareTo(DateTime? other) => (super
          .noSuchMethod(Invocation.method(#compareTo, [other]), returnValue: 0)
      as int);
  @override
  DateTime toLocal() => (super.noSuchMethod(Invocation.method(#toLocal, []),
      returnValue: _FakeDateTime()) as DateTime);
  @override
  DateTime toUtc() => (super.noSuchMethod(Invocation.method(#toUtc, []),
      returnValue: _FakeDateTime()) as DateTime);
  @override
  String toString() => super.toString();
  @override
  String toIso8601String() =>
      (super.noSuchMethod(Invocation.method(#toIso8601String, []),
          returnValue: '') as String);
  @override
  DateTime add(Duration? duration) =>
      (super.noSuchMethod(Invocation.method(#add, [duration]),
          returnValue: _FakeDateTime()) as DateTime);
  @override
  DateTime subtract(Duration? duration) =>
      (super.noSuchMethod(Invocation.method(#subtract, [duration]),
          returnValue: _FakeDateTime()) as DateTime);
  @override
  Duration difference(DateTime? other) =>
      (super.noSuchMethod(Invocation.method(#difference, [other]),
          returnValue: _FakeDuration()) as Duration);
}
