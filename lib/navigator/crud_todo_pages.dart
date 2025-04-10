import 'package:crud_todo_app/navigator/crud_todo_transition_route.dart';
import 'package:crud_todo_app/ui/category_list_view.dart';
import 'package:crud_todo_app/ui/form_category_view.dart';
import 'package:crud_todo_app/ui/form_todo_view.dart';
import 'package:crud_todo_app/ui/todo_list_view.dart';
import 'package:crud_todo_app/ui/unknown_view.dart';
import 'package:flutter/material.dart';

final class CategoryPage<T> extends Page<T> {
  const CategoryPage({required this.onAddCategory, required this.onGoToDetail})
    : super(key: const ValueKey('CategoryPage'));

  final VoidCallback onAddCategory;
  final ValueSetter<String> onGoToDetail;

  @override
  Route<T> createRoute(BuildContext context) {
    return SimpleRoute<T>(
      settings: this,
      child: CategoryListView(
        onAddCategory: onAddCategory,
        onGoToDetail: onGoToDetail,
      ),
    );
  }
}

final class AddCategoryPage<T> extends Page<T> {
  const AddCategoryPage() : super(key: const ValueKey('AddCategory'));

  @override
  Route<T> createRoute(BuildContext context) {
    return DialogFadeTransitionRoute<T>(
      settings: this,
      child: const FormCategoryView(),
    );
  }
}

final class TodoPage<T> extends Page<T> {
  TodoPage({required this.categoryId, required this.onGoToTodo})
    : super(key: ValueKey('TodoPage_$categoryId'));

  final String categoryId;
  final NavigatorToTodo onGoToTodo;

  @override
  Route<T> createRoute(BuildContext context) {
    return FadeTransitionRoute<T>(
      settings: this,
      child: TodoListView(categoryId: categoryId, onGoToTodo: onGoToTodo),
    );
  }
}

final class FormTodoPage<T> extends Page<T> {
  FormTodoPage({required this.categoryId, this.todoId})
    : super(key: ValueKey('FormTodoPage_${categoryId}_${todoId ?? 'none'}'));

  final String categoryId;
  final String? todoId;

  @override
  Route<T> createRoute(BuildContext context) {
    return SlideTransitionRoute<T>(
      settings: this,
      child: FormTodoView(categoryId: categoryId, todoId: todoId),
    );
  }
}

final class UnknownPage<T> extends Page<T> {
  const UnknownPage() : super(key: const ValueKey('UnknownPage'));

  @override
  Route<T> createRoute(BuildContext context) {
    return ScaleTransitionRoute<T>(settings: this, child: const UnknownView());
  }
}
