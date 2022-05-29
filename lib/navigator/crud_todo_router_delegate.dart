import 'package:crud_todo_app/navigator/config/crud_todo_config.dart';
import 'package:crud_todo_app/navigator/crud_todo_pages.dart';
import 'package:flutter/material.dart';

class CrudTodoRouterDelegate extends RouterDelegate<CrudTodoConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<CrudTodoConfig> {
  CrudTodoRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  final _heroController = HeroController();

  // Global Key

  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  // Current category selected

  String? _categoryId;

  String? get categoryId => _categoryId;

  set categoryId(String? value) {
    _categoryId = value;
    notifyListeners();
  }

  // Current To-Do selected by category

  String? _todoId;

  String? get todoId => _todoId;

  bool _isTodoSelected = false;

  bool get isTodoSelected => _isTodoSelected;

  void selectCurrentTodo(String? value, {required bool isSelected}) {
    _todoId = value;
    _isTodoSelected = isSelected;

    notifyListeners();
  }

  // Current unknown page or 404 not found

  bool _is404 = false;

  bool get is404 => _is404;

  set is404(bool value) {
    _is404 = value;

    if (value) {
      _categoryId = null;
      _todoId = null;
      _isTodoSelected = false;
    }

    notifyListeners();
  }

  bool get isCategoryList =>
      categoryId == null && todoId == null && !isTodoSelected && !is404;

  bool get isTodoList =>
      categoryId != null && todoId == null && !isTodoSelected && !is404;

  bool get isTodoNew =>
      categoryId != null && todoId == null && isTodoSelected && !is404;

  bool get isTodoUpdate =>
      categoryId != null && todoId != null && isTodoSelected && !is404;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      observers: [_heroController],
      pages: <Page<void>>[
        if (is404)
          const UnknownPage()
        else ...[
          CategoryPage(onGoToDetail: (catId) => categoryId = catId),
          if (categoryId != null)
            TodoPage(
              categoryId: categoryId!,
              onGoToTodo: (catId, todoId) => selectCurrentTodo(
                todoId,
                isSelected: true,
              ),
            ),
          if (categoryId != null && isTodoSelected)
            FormTodoPage(categoryId: categoryId!, todoId: todoId)
        ]
      ],
      onPopPage: (route, dynamic result) {
        if (!route.didPop(result)) return false;

        if (!isTodoSelected) categoryId = null;
        selectCurrentTodo(null, isSelected: false);

        return true;
      },
    );
  }

  @override
  CrudTodoConfig? get currentConfiguration {
    if (isCategoryList) {
      return const CrudTodoConfigCategoryList();
    } else if (isTodoList) {
      return CrudTodoConfigTodoList(categoryId!);
    } else if (isTodoNew) {
      return CrudTodoConfigAddTodo(categoryId!);
    } else if (isTodoUpdate) {
      return CrudTodoConfigUpdateTodo(categoryId!, todoId!);
    } else if (is404) {
      return const CrudTodoConfigUnknown();
    }

    return null;
  }

  @override
  Future<void> setNewRoutePath(CrudTodoConfig configuration) async =>
      configuration.when(
        categoryList: _values,
        todoList: (id) => _values(catId: id),
        addTodo: (id) => _values(catId: id, selected: true),
        updateTodo: (categoryId, todoId) => _values(
          catId: categoryId,
          todoId: todoId,
          selected: true,
        ),
        unknown: () => _values(noFound: true),
      );

  void _values({String? catId, String? todoId, bool? selected, bool? noFound}) {
    categoryId = catId;
    selectCurrentTodo(todoId, isSelected: selected ?? false);
    is404 = noFound ?? false;
  }
}
