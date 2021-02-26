import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/model/category.model.dart';
import 'package:crud_todo_app/model/todo.model.dart';

abstract class ITodoDatabase {
  Stream<List<Category>> getCategories();
  Stream<List<Todo>> getTodosByCategory(String categoryId);
  Future<void> saveCategory(Category category);
  Future<void> saveTodo(Todo todo, String categoryId);
  Future<void> deleteCategory(String categoryId);
  Future<void> deleteTodo(String todoId);
}

class TodoDatabase implements ITodoDatabase {
  static const String _categoryCollection = 'categories';
  static const String _todoCollection = 'todos';

  final FirebaseFirestore _firebaseFirestore;

  TodoDatabase(this._firebaseFirestore);

  @override
  Stream<List<Category>> getCategories() {
    final querySnapshot =
        _firebaseFirestore.collection(_categoryCollection).snapshots();

    return querySnapshot.map((query) =>
        query.docs.map((doc) => Category.fromSnapshot(doc)).toList());
  }

  @override
  Stream<List<Todo>> getTodosByCategory(String categoryId) {
    final querySnapshot = _firebaseFirestore
        .collection(_todoCollection)
        .where('categoryId', isEqualTo: categoryId)
        .snapshots();

    return querySnapshot.map(
        (query) => query.docs.map((doc) => Todo.fromSnapshot(doc)).toList());
  }

  @override
  Future<void> saveCategory(Category category) async => category.id != null
      ? await _firebaseFirestore
          .collection(_categoryCollection)
          .doc(category.id)
          .update(category.toJson())
      : await _firebaseFirestore
          .collection(_categoryCollection)
          .add(category.toJson());

  @override
  Future<void> saveTodo(Todo todo, String categoryId) async => todo
          .id.isNotEmpty
      ? await _firebaseFirestore
          .collection(_todoCollection)
          .doc(todo.id)
          .update(todo.toJson())
      : await _firebaseFirestore.collection(_todoCollection).add(todo.toJson());

  @override
  Future<void> deleteCategory(String categoryId) async =>
      await _firebaseFirestore
          .collection(_categoryCollection)
          .doc(categoryId)
          .delete();

  @override
  Future<void> deleteTodo(String todoId) async =>
      await _firebaseFirestore.collection(_todoCollection).doc(todoId).delete();
}
