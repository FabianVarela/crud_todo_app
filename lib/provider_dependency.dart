import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/navigator/crud_todo_information_parser.dart';
import 'package:crud_todo_app/navigator/crud_todo_router_delegate.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/service/category_service.dart';
import 'package:crud_todo_app/service/todo_service.dart';
import 'package:crud_todo_app/viewmodel/category/category_view_model.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_view_model.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Firebase Firestore

final firestoreProvider = Provider((_) => FirebaseFirestore.instance);

/// Service

final categoryServiceProvider = Provider<CategoryService>((ref) {
  final database = ref.read(firestoreProvider);
  return CategoryService(database);
});

final todoServiceProvider = Provider<TodoService>((ref) {
  final database = ref.read(firestoreProvider);
  return TodoService(database);
});

/// Repository

final categoryRepositoryProvider = Provider<ICategoryRepository>(
  (ref) {
    final service = ref.read(categoryServiceProvider);
    return CategoryRepository(service);
  },
);

final todoRepositoryProvider = Provider<ITodoRepository>(
  (ref) {
    final service = ref.read(todoServiceProvider);
    return TodoRepository(service);
  },
);

/// ViewModel

final categoryViewModelProvider =
    StateNotifierProvider<ICategoryViewModel, CategoryState>(
  (ref) => CategoryViewModel(ref.read),
);

final todoViewModelProvider = StateNotifierProvider<ITodoViewModel, TodoState>(
  (ref) => TodoViewModel(ref.read),
);

/// Navigator 2.0

final crudTodoRouterDelegateProvider = ChangeNotifierProvider(
  (_) => CrudTodoRouterDelegate(),
);

final crudTodoInformationParserProvider = Provider(
  (ref) => CrudTodoInformationParser(),
);
