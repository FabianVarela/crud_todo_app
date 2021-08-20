import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/ui/add_todo_view.dart';
import 'package:crud_todo_app/ui/todo_category_list_view.dart';
import 'package:crud_todo_app/ui/todo_list_view.dart';
import 'package:flutter/material.dart';

class CategoryPage extends Page<void> {
  const CategoryPage({required this.onGoToDetail})
      : super(key: const ValueKey('CategoryPage'));

  final NavigatorToDetail onGoToDetail;

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
      settings: this,
      builder: (_) => TodoCategoryListView(onGoToDetail: onGoToDetail),
    );
  }
}

class TodoPage extends Page<void> {
  const TodoPage({required this.category, required this.onGoToTodo})
      : super(key: const ValueKey('TodoPage'));

  final Category category;
  final NavigatorToTodo onGoToTodo;

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
      settings: this,
      builder: (_) => TodoListView(category: category, onGoToTodo: onGoToTodo),
    );
  }
}

class AddTodoPage extends Page<void> {
  const AddTodoPage({required this.category, this.todo})
      : super(key: const ValueKey('AddTodoPage'));

  final Category category;
  final Todo? todo;

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
      settings: this,
      builder: (_) => AddTodoView(category: category, todo: todo),
    );
  }
}
