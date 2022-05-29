import 'package:freezed_annotation/freezed_annotation.dart';

part 'crud_todo_config.freezed.dart';

@freezed
class CrudTodoConfig with _$CrudTodoConfig {
  const factory CrudTodoConfig.categoryList() = CrudTodoConfigCategoryList;

  const factory CrudTodoConfig.todoList(String categoryId) =
      CrudTodoConfigTodoList;

  const factory CrudTodoConfig.addTodo(String categoryId) =
      CrudTodoConfigAddTodo;

  const factory CrudTodoConfig.updateTodo(String categoryId, String todoId) =
      CrudTodoConfigUpdateTodo;

  const factory CrudTodoConfig.unknown() = CrudTodoConfigUnknown;
}
