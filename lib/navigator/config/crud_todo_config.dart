import 'package:freezed_annotation/freezed_annotation.dart';

part 'crud_todo_config.freezed.dart';

@freezed
sealed class CrudTodoConfig with _$CrudTodoConfig {
  const factory categoryList() = CrudTodoConfigCategoryList;

  const factory addCategory() = CrudTodoConfigAddCategory;

  const factory todoList({required String categoryId}) = CrudTodoConfigTodoList;

  const factory addTodo({required String categoryId}) = CrudTodoConfigAddTodo;

  const factory updateTodo({
    required String categoryId,
    required String todoId,
  }) = CrudTodoConfigUpdateTodo;

  const factory unknown() = CrudTodoConfigUnknown;
}
