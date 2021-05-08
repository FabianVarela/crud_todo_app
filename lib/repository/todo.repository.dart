import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/common/common.dart';

import '../provider_dependency.dart';

abstract class ITodoRepository {
  Stream<List<Category>> getCategories();

  Stream<List<Todo>> getTodosByCategory(String catId);

  Future<void> saveCategory(Category category);

  Future<void> saveTodo(Todo todo);

  Future<void> deleteCategory(String catId);

  Future<void> deleteTodo(String todoId, String catId);
}

class TodoRepository implements ITodoRepository {
  TodoRepository(this.read);

  final Reader read;

  FirebaseFirestore get _database => read(databaseProvider);

  static const String _categoryCollection = 'categories';
  static const String _todoCollection = 'todos';

  @override
  Stream<List<Category>> getCategories() {
    final querySnapshot = _database.collection(_categoryCollection).snapshots();

    return querySnapshot.map((query) =>
        query.docs.map((doc) => Category.fromSnapshot(doc)).toList());
  }

  @override
  Stream<List<Todo>> getTodosByCategory(String catId) {
    final querySnapshot = _database
        .collection(_todoCollection)
        .where('categoryId', isEqualTo: catId)
        .snapshots();

    return querySnapshot.map(
        (query) => query.docs.map((doc) => Todo.fromSnapshot(doc)).toList());
  }

  @override
  Future<void> saveCategory(Category category) async => category.id != null
      ? await _database
          .collection(_categoryCollection)
          .doc(category.id)
          .update(category.toJson())
      : await _database.collection(_categoryCollection).add(category.toJson());

  @override
  Future<void> saveTodo(Todo todo) async {
    if (todo.id.isNotEmpty) {
      await _database
          .collection(_todoCollection)
          .doc(todo.id)
          .update(todo.toJson());
    } else {
      await _database.collection(_todoCollection).add(todo.toJson());
      await _database
          .collection(_categoryCollection)
          .doc(todo.categoryId)
          .update({'todoSize': FieldValue.increment(1)});
    }
  }

  @override
  Future<void> deleteCategory(String catId) async {
    await _database.collection(_categoryCollection).doc(catId).delete();

    final snapshot = await _database
        .collection(_todoCollection)
        .where('categoryId', isEqualTo: catId)
        .get();
    snapshot.docs.forEach((item) => item.reference.delete());
  }

  @override
  Future<void> deleteTodo(String todoId, String catId) async {
    await _database.collection(_todoCollection).doc(todoId).delete();
    await _database
        .collection(_categoryCollection)
        .doc(catId)
        .update({'todoSize': FieldValue.increment(-1)});
  }
}
