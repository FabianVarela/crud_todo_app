import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/model/category.model.dart';
import 'package:crud_todo_app/model/todo.model.dart';

abstract class ITodoDatabase {
  Stream<List<Category>> getTodoCategories();
  Future<void> saveCategory(Category category);
  Future<void> saveTodo(Todo todo, String categoryId);
  Future<void> deleteCategory(String categoryId);
  Future<void> deleteTodo(Todo todo, String categoryId);
}

class TodoDatabase implements ITodoDatabase {
  static const String _categoryCollection = 'categories';

  final FirebaseFirestore _firebaseFirestore;

  TodoDatabase(this._firebaseFirestore);

  @override
  Stream<List<Category>> getTodoCategories() {
    final querySnapshot =
        _firebaseFirestore.collection(_categoryCollection).snapshots();

    return querySnapshot.map((query) =>
        query.docs.map((doc) => Category.fromSnapshot(doc)).toList());
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
  Future<void> saveTodo(Todo todo, String categoryId) {
    final categoryRef =
        _firebaseFirestore.collection(_categoryCollection).doc(categoryId);

    return _firebaseFirestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(categoryRef);
      await transaction.update(snapshot.reference, <String, dynamic>{
        'todos': FieldValue.arrayUnion([todo]),
      });
    });
  }

  @override
  Future<void> deleteCategory(String categoryId) async =>
      await _firebaseFirestore
          .collection(_categoryCollection)
          .doc(categoryId)
          .delete();

  @override
  Future<void> deleteTodo(Todo todo, String categoryId) {
    final categoryRef =
        _firebaseFirestore.collection(_categoryCollection).doc(categoryId);

    return _firebaseFirestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(categoryRef);
      await transaction.update(snapshot.reference, <String, dynamic>{
        'todos': FieldValue.arrayRemove([todo]),
      });
    });
  }
}
