import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_todo_app/repository/todo.repository.dart';
import 'package:crud_todo_app/viewmodel/category/category_view_model.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_view_model.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Firestore

final databaseProvider = Provider((_) => FirebaseFirestore.instance);

/// Repository

final todoRepositoryProvider = Provider<ITodoRepository>(
  (ref) => TodoRepository(ref.read),
);

/// ViewModel

final categoryViewModelProvider =
    StateNotifierProvider<CategoryViewModel, CategoryState>(
  (ref) => CategoryViewModel(ref.read),
);

final todoViewModelProvider = StateNotifierProvider<TodoViewModel, TodoState>(
  (ref) => TodoViewModel(ref.read),
);
