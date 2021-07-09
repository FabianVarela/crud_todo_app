import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/repository/category_service.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/repository/todo_service.dart';
import 'package:crud_todo_app/viewmodel/category/category_view_model.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_view_model.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Service
final categoryServiceProvider =
    Provider<CategoryService>((ref) => CategoryService());

final todoServiceProvider = Provider<TodoService>((ref) => TodoService());

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
    StateNotifierProvider<CategoryViewModel, CategoryState>(
  (ref) => CategoryViewModel(ref.read),
);

final todoViewModelProvider = StateNotifierProvider<TodoViewModel, TodoState>(
  (ref) => TodoViewModel(ref.read),
);
