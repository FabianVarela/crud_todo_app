import 'package:crud_todo_app/navigator/crud_todo_pages.dart';
import 'package:flutter/material.dart';

class CrudTodoRouterDelegate extends RouterDelegate<Object>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Object> {
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

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      observers: [_heroController],
      pages: <Page<void>>[
        CategoryPage(onGoToDetail: (id) => currentCategoryId = id),
        if (currentCategoryId != null)
          TodoPage(
            categoryId: currentCategoryId!,
            onGoToTodo: (categoryId, todoId) => selectCurrentTodo(todoId, true),
          ),
        if (currentCategoryId != null && isTodoSelected)
          FormTodoPage(categoryId: currentCategoryId!, todoId: currentTodoId)
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
  Future<void> setNewRoutePath(Object configuration) async {}
}
