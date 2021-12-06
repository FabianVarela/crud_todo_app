import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/service/category_service.dart';
import 'package:crud_todo_app/service/todo_service.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:crud_todo_app/viewmodel/category/category_view_model.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//region Firebase Firestore
final firestoreProvider = Provider((_) => FirebaseFirestore.instance);
//endregion

//region Service layer
final categoryServiceProvider = Provider<CategoryService>((ref) {
  return CategoryService(ref.read(firestoreProvider));
});

final todoServiceProvider = Provider<TodoService>((ref) {
  return TodoService(ref.read(firestoreProvider));
});
//endregion

//region Repository layer
final categoryRepositoryProvider = Provider<ICategoryRepository>(
  (ref) => CategoryRepository(ref.read(categoryServiceProvider)),
);

final todoRepositoryProvider = Provider<ITodoRepository>(
  (ref) => TodoRepository(ref.read(todoServiceProvider)),
);
//endregion

//region ViewModel layer
final categoryViewModelProvider =
    StateNotifierProvider<ICategoryViewModel, CategoryState>(
  (ref) => CategoryViewModel(ref.read),
);

final todoViewModelProvider = StateNotifierProvider<ITodoViewModel, TodoState>(
  (ref) => TodoViewModel(ref.read),
);
//endregion
