import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/navigator/crud_todo_pages.dart';
import 'package:flutter/material.dart';

class CrudTodoRouterDelegate extends RouterDelegate<dynamic>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<dynamic> {
  CrudTodoRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  // Global Key

  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  // Current category selected

  Category? _currentCategory;

  Category? get currentCategory => _currentCategory;

  set currentCategory(Category? value) {
    _currentCategory = value;
    notifyListeners();
  }

  // Current To-Do selected by category

  Todo? _currentTodo;

  Todo? get currentTodo => _currentTodo;

  bool _isTodoSelected = false;

  bool get isTodoSelected => _isTodoSelected;

  void selectCurrentTodo(Todo? value, bool isSelected) {
    _currentTodo = value;
    _isTodoSelected = isSelected;

    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: <Page<void>>[
        CategoryPage(onGoToDetail: (category) => currentCategory = category),
        if (currentCategory != null)
          TodoPage(
            category: currentCategory!,
            onGoToTodo: (category, todo) => selectCurrentTodo(todo, true),
          ),
        if (currentCategory != null && isTodoSelected)
          AddTodoPage(category: currentCategory!, currentTodo: currentTodo)
      ],
      onPopPage: (route, dynamic result) {
        if (!route.didPop(result)) return false;

        if (!isTodoSelected) currentCategory = null;
        selectCurrentTodo(null, false);

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(dynamic configuration) async {}
}
