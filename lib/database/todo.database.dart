import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/model/category.model.dart';
import 'package:crud_todo_app/model/todo.model.dart';

abstract class ITodoDatabase {
  Stream<List<Category>> getCategories();
  Stream<List<Todo>> getTodosByCategory(String catId);
  Future<void> saveCategory(Category category);
  Future<void> saveTodo(Todo todo, String catId);
  Future<void> deleteCategory(String catId);
  Future<void> deleteTodo(String todoId, String catId);
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
  Stream<List<Todo>> getTodosByCategory(String catId) {
    final querySnapshot = _firebaseFirestore
        .collection(_todoCollection)
        .where('categoryId', isEqualTo: catId)
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
  Future<void> saveTodo(Todo todo, String catId) async {
    if (todo.id.isNotEmpty) {
      await _firebaseFirestore
          .collection(_todoCollection)
          .doc(todo.id)
          .update(todo.toJson());
    } else {
      await _firebaseFirestore.collection(_todoCollection).add(todo.toJson());
      await _firebaseFirestore
          .collection(_categoryCollection)
          .doc(catId)
          .update({'todos': FieldValue.increment(1)});
    }
  }

  @override
  Future<void> deleteCategory(String catId) async {
    await _firebaseFirestore
        .collection(_categoryCollection)
        .doc(catId)
        .delete();

    final snapshot = await _firebaseFirestore
        .collection(_todoCollection)
        .where('categoryId', isEqualTo: catId)
        .get();
    snapshot.docs.forEach((item) => item.reference.delete());
  }

  @override
  Future<void> deleteTodo(String todoId, String catId) async {
    await _firebaseFirestore.collection(_todoCollection).doc(todoId).delete();
    await _firebaseFirestore
        .collection(_categoryCollection)
        .doc(catId)
        .update({'todos': FieldValue.increment(-1)});
  }
}
