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

  // Add category form

  bool _isShowingCategoryForm = false;

  bool get isShowingCategoryForm => _isShowingCategoryForm;

  set isShowingCategoryForm(bool value) {
    _isShowingCategoryForm = value;
    notifyListeners();
  }

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

  void setTodo(String? value, {required bool isSelected}) {
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

  @override
  Widget build(BuildContext context) {
    var pages = <Page<dynamic>>[
      if (is404)
        const UnknownPage()
      else ...[
        CategoryPage(
          onAddCategory: () => isShowingCategoryForm = true,
          onGoToDetail: (catId) => categoryId = catId,
        ),
        if (isShowingCategoryForm)
          const AddCategoryPage()
        else ...[
          if (categoryId != null)
            TodoPage(
              categoryId: categoryId!,
              onGoToTodo: (catId, todoId) => setTodo(todoId, isSelected: true),
            ),
          if (categoryId != null && isTodoSelected)
            FormTodoPage(categoryId: categoryId!, todoId: todoId),
        ],
      ],
    ];

    return Navigator(
      key: navigatorKey,
      observers: [_heroController],
      pages: pages,
      onDidRemovePage: (page) {
        if (categoryId == null) {
          if (isShowingCategoryForm) {
            isShowingCategoryForm = false;
          } else {
            pages.remove(page);
            pages = pages.toList();
          }
        } else {
          if (!isTodoSelected) categoryId = null;
          setTodo(null, isSelected: false);
        }
      },
    );
  }

  bool get isCategoryList =>
      categoryId == null &&
      !isShowingCategoryForm &&
      todoId == null &&
      !isTodoSelected &&
      !is404;

  bool get isShowCategoryForm =>
      categoryId == null &&
      isShowingCategoryForm &&
      todoId == null &&
      !isTodoSelected &&
      !is404;

  bool get isTodoList =>
      categoryId != null &&
      !isShowingCategoryForm &&
      todoId == null &&
      !isTodoSelected &&
      !is404;

  bool get isTodoNew =>
      categoryId != null &&
      !isShowingCategoryForm &&
      todoId == null &&
      isTodoSelected &&
      !is404;

  bool get isTodoUpdate =>
      categoryId != null &&
      !isShowingCategoryForm &&
      todoId != null &&
      isTodoSelected &&
      !is404;

  @override
  CrudTodoConfig? get currentConfiguration {
    if (isCategoryList) {
      return const CrudTodoConfigCategoryList();
    } else if (isShowCategoryForm) {
      return const CrudTodoConfigAddCategory();
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
  Future<void> setNewRoutePath(CrudTodoConfig configuration) async {
    configuration.when(
      categoryList: () {
        categoryId = null;
        isShowingCategoryForm = false;
        setTodo(null, isSelected: false);
        is404 = false;
      },
      addCategory: () {
        isShowingCategoryForm = true;
        categoryId = null;
        setTodo(null, isSelected: false);
        is404 = false;
      },
      todoList: (id) {
        categoryId = id;
        isShowingCategoryForm = false;
        setTodo(null, isSelected: false);
        is404 = false;
      },
      addTodo: (_) {
        setTodo(null, isSelected: true);
        isShowingCategoryForm = false;
        is404 = false;
      },
      updateTodo: (_, todoId) {
        setTodo(todoId, isSelected: true);
        isShowingCategoryForm = false;
        is404 = false;
      },
      unknown: () => is404 = true,
    );
  }
}
