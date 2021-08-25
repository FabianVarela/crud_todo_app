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
    return FadeTransitionRoute(
      settings: this,
      child: TodoListView(category: category, onGoToTodo: onGoToTodo),
    );

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

    // return MaterialPageRoute<void>(
    //   settings: this,
    //   builder: (_) => TodoListView(category: category,
    //   onGoToTodo: onGoToTodo,),
    // );
  }
}

class AddTodoPage extends Page<void> {
  const AddTodoPage({required this.category, this.todo})
      : super(key: const ValueKey('AddTodoPage'));

  final Category category;
  final Todo? todo;

  @override
  Route<void> createRoute(BuildContext context) {
    return SlideTransitionRoute(
      settings: this,
      child: AddTodoView(category: category, todo: todo),
    );

    // return PageRouteBuilder<void>(
    //   settings: this,
    //   reverseTransitionDuration: const Duration(milliseconds: 1000),
    //   transitionDuration: const Duration(milliseconds: 1000),
    //   pageBuilder: (context, animation, animation2) {
    //     return ScaleTransition(
    //       scale: animation,
    //       child: AddTodoView(category: category, todo: todo),
    //     );
    //   },
    // );

    // return MaterialPageRoute<void>(
    //   settings: this,
    //   builder: (_) => AddTodoView(category: category, todo: todo),
    // );
  }
}

class ScaleTransitionRoute extends PageRouteBuilder<void> {
  ScaleTransitionRoute({
    required RouteSettings settings,
    required this.child,
  }) : super(
    settings: settings,
    // reverseTransitionDuration: const Duration(milliseconds: 1000),
    // transitionDuration: const Duration(milliseconds: 1000),
    pageBuilder: (context, anim, anim2) => ScaleTransition(
      scale: anim,
      child: child,
    ),
  );

  final Widget child;
}

class FadeTransitionRoute extends PageRouteBuilder<void> {
  FadeTransitionRoute({
    required RouteSettings settings,
    required this.child,
  }) : super(
    settings: settings,
    reverseTransitionDuration: const Duration(milliseconds: 1000),
    transitionDuration: const Duration(milliseconds: 1000),
    pageBuilder: (context, anim, anim2) => FadeTransition(
      opacity: anim,
      child: child,
    ),
  );

  final Widget child;
}

class SlideTransitionRoute extends PageRouteBuilder<void> {
  SlideTransitionRoute({
    required RouteSettings settings,
    required this.child,
  }) : super(
    settings: settings,
    reverseTransitionDuration: const Duration(milliseconds: 1000),
    transitionDuration: const Duration(milliseconds: 1000),
    pageBuilder: (context, anim, anim2) {
      final tween = Tween(
        begin: const Offset(0, 1),
        end: Offset.zero,
      );
      final curveTween = CurveTween(curve: Curves.easeInOut);
      return SlideTransition(
        position: anim.drive(curveTween).drive(tween),
        child: child,
      );
    },
  );

  final Widget child;
}
