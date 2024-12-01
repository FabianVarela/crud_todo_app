import 'package:freezed_annotation/freezed_annotation.dart';

part 'crud_todo_config.freezed.dart';

@freezed
sealed class CrudTodoConfig with _$CrudTodoConfig {
  const factory CrudTodoConfig.categoryList() = CrudTodoConfigCategoryList;

  const factory CrudTodoConfig.addCategory() = CrudTodoConfigAddCategory;

  const factory CrudTodoConfig.todoList({required String categoryId}) =
      CrudTodoConfigTodoList;

  const factory CrudTodoConfig.addTodo({required String categoryId}) =
      CrudTodoConfigAddTodo;

  const factory CrudTodoConfig.updateTodo({
    required String categoryId,
    required String todoId,
  }) = CrudTodoConfigUpdateTodo;

  const factory CrudTodoConfig.unknown() = CrudTodoConfigUnknown;
}
