import 'dart:async';

import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum TodoAction { add, update, remove, check, none }

final class TodoViewModel extends AsyncNotifier<TodoAction> {
  @override
  FutureOr<TodoAction> build() => TodoAction.none;

  Future<void> saveTodo({
    required String categoryId,
    required String subject,
    required DateTime date,
    String? todoId,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(todoRepositoryProvider);
      await repository.saveTodo(
        todo: Todo(
          id: todoId,
          subject: subject,
          finalDate: date,
          categoryId: categoryId,
        ),
      );
      return todoId == null ? TodoAction.add : TodoAction.update;
    });
  }

  Future<void> deleteTodo({
    required String todoId,
    required String categoryId,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(todoRepositoryProvider);
      await repository.deleteTodo(todoId: todoId, categoryId: categoryId);

      return TodoAction.remove;
    });
  }

  Future<void> checkTodo({required Todo todo, bool isChecked = false}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(todoRepositoryProvider);
      await repository.saveTodo(todo: todo.copyWith(isCompleted: isChecked));

      return TodoAction.check;
    });
  }
}
