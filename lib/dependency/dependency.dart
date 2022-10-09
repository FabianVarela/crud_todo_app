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
final firebasePod = Provider((_) => FirebaseFirestore.instance);
//endregion

//region Service layer
final categoryServicePod = Provider<CategoryService>((ref) {
  return CategoryService(ref.read(firebasePod));
});

final todoServicePod = Provider<TodoService>((ref) {
  return TodoService(ref.read(firebasePod));
});
//endregion

//region Repository layer
final categoryRepositoryPod = Provider<ICategoryRepository>(
  (ref) => CategoryRepository(ref.read(categoryServicePod)),
);

final todoRepositoryPod = Provider<ITodoRepository>(
  (ref) => TodoRepository(ref.read(todoServicePod)),
);
//endregion

//region ViewModel layer
final categoryViewModelPod =
    StateNotifierProvider<CategoryViewModel, CategoryState>(
  (ref) => CategoryViewModel(ref.watch(categoryRepositoryPod)),
);

final todoViewModelPod = StateNotifierProvider<TodoViewModel, TodoState>(
  (ref) => TodoViewModel(ref.watch(todoRepositoryPod)),
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
