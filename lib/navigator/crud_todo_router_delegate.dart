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

  String? _currentCategoryId;

  String? get currentCategoryId => _currentCategoryId;

  set currentCategoryId(String? value) {
    _currentCategoryId = value;
    notifyListeners();
  }

  // Current To-Do selected by category

  String? _currentTodoId;

  String? get currentTodoId => _currentTodoId;

  bool _isTodoSelected = false;

  bool get isTodoSelected => _isTodoSelected;

  void selectCurrentTodo(String? value, bool isSelected) {
    _currentTodoId = value;
    _isTodoSelected = isSelected;

    notifyListeners();
  }

  bool _is404 = false;

  bool get is404 => _is404;

  set is404(bool value) {
    _is404 = value;

    if (value) {
      _currentCategoryId = null;
      _currentTodoId = null;
      _isTodoSelected = false;
    }

    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      observers: [_heroController],
      pages: <Page<void>>[
        if (is404)
          const UnknownPage()
        else ...[
          CategoryPage(onGoToDetail: (id) => currentCategoryId = id),
          if (currentCategoryId != null)
            TodoPage(
              categoryId: currentCategoryId!,
              onGoToTodo: (categoryId, todoId) =>
                  selectCurrentTodo(todoId, true),
            ),
          if (currentCategoryId != null && isTodoSelected)
            FormTodoPage(categoryId: currentCategoryId!, todoId: currentTodoId)
        ]
      ],
      onPopPage: (route, dynamic result) {
        if (!route.didPop(result)) return false;

        if (!isTodoSelected) currentCategoryId = null;
        selectCurrentTodo(null, false);

        return true;
      },
    );
  }

  @override
  CrudTodoConfig? get currentConfiguration {
    if (currentCategoryId == null && currentTodoId == null && !is404) {
      return const CrudTodoConfig.categoryList();
    } else if (currentCategoryId != null && currentTodoId == null && !is404) {
      return CrudTodoConfigTodoList(currentCategoryId!);
    } else if (currentCategoryId != null &&
        currentTodoId == null &&
        isTodoSelected &&
        !is404) {
      return CrudTodoConfigAddTodo(currentCategoryId!);
    } else if (currentCategoryId != null && currentTodoId != null && !is404) {
      return CrudTodoConfigUpdateTodo(currentCategoryId!, currentTodoId!);
    } else if (is404) {
      return const CrudTodoConfig.unknown();
    }

    return null;
  }

  @override
  Future<void> setNewRoutePath(CrudTodoConfig configuration) async =>
      configuration.when(
        categoryList: _changeValues,
        todoList: (id) => _changeValues(categoryId: id),
        addTodo: (id) => _changeValues(categoryId: id, isSelected: true),
        updateTodo: (categoryId, todoId) => _changeValues(
          categoryId: categoryId,
          todoId: todoId,
          isSelected: true,
        ),
        unknown: () => _changeValues(isNoFound: true),
      );

  void _changeValues({
    String? categoryId,
    String? todoId,
    bool isSelected = false,
    bool isNoFound = false,
  }) {
    currentCategoryId = categoryId;
    selectCurrentTodo(todoId, isSelected);
    is404 = isNoFound;
  }
}
