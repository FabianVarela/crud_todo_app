import 'package:crud_todo_app/navigator/crud_todo_transition_route.dart';
import 'package:crud_todo_app/ui/category_list_view.dart';
import 'package:crud_todo_app/ui/form_todo_view.dart';
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
      builder: (_) => CategoryListView(onGoToDetail: onGoToDetail),
    );
  }
}

class TodoPage extends Page<void> {
  const TodoPage({required this.categoryId, required this.onGoToTodo})
      : super(key: const ValueKey('TodoPage'));

  final String categoryId;
  final NavigatorToTodo onGoToTodo;

  @override
  Route<void> createRoute(BuildContext context) {
    return FadeTransitionRoute(
      settings: this,
      child: TodoListView(categoryId: categoryId, onGoToTodo: onGoToTodo),
    );

    /// Uncomment it and comment code above to use individually
    // return PageRouteBuilder<void>(
    //   settings: this,
    //   transitionDuration: const Duration(milliseconds: 1000),
    //   pageBuilder: (context, animation, animation2) {
    //     return FadeTransition(
    //       opacity: animation,
    //       child: TodoListView(category: category, onGoToTodo: onGoToTodo),
    //     );
    //   },
    // );

    /// Uncomment it and comment code above to use individually
    // return MaterialPageRoute<void>(
    //   settings: this,
    //   builder: (_) => TodoListView(
    //     category: category,
    //     onGoToTodo: onGoToTodo,
    //   ),
    // );
  }
}

class FormTodoPage extends Page<void> {
  const FormTodoPage({required this.categoryId, this.todoId})
      : super(key: const ValueKey('AddTodoPage'));

  final String categoryId;
  final String? todoId;

  @override
  Route<void> createRoute(BuildContext context) {
    return SlideTransitionRoute(
      settings: this,
      child: FormTodoView(categoryId: categoryId, todoId: todoId),
    );

    /// Uncomment it and comment code above to use individually
    // return PageRouteBuilder<void>(
    //   settings: this,
    //   reverseTransitionDuration: const Duration(milliseconds: 1000),
    //   transitionDuration: const Duration(milliseconds: 1000),
    //   pageBuilder: (context, animation, animation2) {
    //     return ScaleTransition(
    //       scale: animation,
    //       child: AddTodoView(category: category, currentTodo: currentTodo),
    //     );
    //   },
    // );

    /// Uncomment it and comment code above to use individually
    // return MaterialPageRoute<void>(
    //   settings: this,
    //   builder: (_) => AddTodoView(
    //     category: category,
    //     currentTodo: currentTodo,
    //   ),
    // );
  }
}
