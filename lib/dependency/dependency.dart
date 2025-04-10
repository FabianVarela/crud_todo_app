import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/navigator/crud_todo_information_parser.dart';
import 'package:crud_todo_app/navigator/crud_todo_router_delegate.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/service/category_service.dart';
import 'package:crud_todo_app/service/todo_service.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:crud_todo_app/viewmodel/category/category_view_model.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//region Firebase
final firebaseProvider = Provider((_) => FirebaseFirestore.instance);
//endregion

//region Service layer
final categoryServiceProvider = Provider<CategoryService>((ref) {
  return CategoryService(ref.read(firebaseProvider));
});

final todoServiceProvider = Provider<TodoService>((ref) {
  return TodoService(ref.read(firebaseProvider));
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
    StateNotifierProvider<CategoryViewModel, CategoryState>(
      (ref) => CategoryViewModel(ref.watch(categoryRepositoryProvider)),
    );

final todoViewModelProvider = StateNotifierProvider<TodoViewModel, TodoState>(
  (ref) => TodoViewModel(ref.watch(todoRepositoryProvider)),
);
//endregion

//region Navigator 2.0
final crudTodoRouterDelegateProvider = ChangeNotifierProvider(
  (_) => CrudTodoRouterDelegate(),
);

final crudTodoInformationParserProvider = Provider(
  (ref) => CrudTodoInformationParser(),
);
//endregion
