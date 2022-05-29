import 'package:equatable/equatable.dart';

class CrudTodoConfig extends Equatable {
  const CrudTodoConfig.categoryList()
      : currentCategoryId = null,
        currentTodoId = null,
        isTodoNew = false,
        isTodoUpdate = false,
        isUnknown = false;

  const CrudTodoConfig.todoList({String? categoryId})
      : currentCategoryId = categoryId,
        currentTodoId = null,
        isTodoNew = false,
        isTodoUpdate = false,
        isUnknown = false;

  const CrudTodoConfig.addTodo({String? categoryId})
      : currentCategoryId = categoryId,
        currentTodoId = null,
        isTodoNew = true,
        isTodoUpdate = false,
        isUnknown = false;

  const CrudTodoConfig.updateTodo({String? categoryId, String? todoId})
      : currentCategoryId = categoryId,
        currentTodoId = todoId,
        isTodoNew = false,
        isTodoUpdate = true,
        isUnknown = false;

  const CrudTodoConfig.unknown()
      : currentCategoryId = null,
        currentTodoId = null,
        isTodoNew = false,
        isTodoUpdate = false,
        isUnknown = true;

  final String? currentCategoryId;
  final String? currentTodoId;
  final bool isTodoNew;
  final bool isTodoUpdate;
  final bool isUnknown;

  bool get isPageUnknown => isUnknown;

  bool get isCategoryListPage =>
      currentCategoryId == null &&
      currentTodoId == null &&
      !isTodoNew &&
      !isTodoUpdate &&
      !isUnknown;

  bool get isTodoListPage =>
      currentCategoryId != null &&
      currentTodoId == null &&
      !isTodoNew &&
      !isTodoUpdate &&
      !isUnknown;

  bool get isAddTodoPage =>
      currentCategoryId != null &&
      currentTodoId == null &&
      isTodoNew &&
      !isTodoUpdate &&
      !isUnknown;

  bool get isUpdateTodoPage =>
      currentCategoryId != null &&
      currentTodoId != null &&
      !isTodoNew &&
      isTodoUpdate &&
      !isUnknown;

  @override
  List<Object?> get props => [
        currentCategoryId,
        currentTodoId,
        isTodoNew,
        isTodoUpdate,
        isUnknown,
      ];
}
