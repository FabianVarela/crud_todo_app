import 'package:crud_todo_app/navigator/config/crud_todo_config.dart';
import 'package:flutter/material.dart';

class CrudTodoPath {
  static const category = 'categories';
  static const todo = 'todo';
  static const unknown = '404';
}

class CrudTodoInformationParser extends RouteInformationParser<CrudTodoConfig> {
  @override
  Future<CrudTodoConfig> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location ?? '');

    if (uri.pathSegments.isEmpty) {
      // Home '/'
      return const CrudTodoConfig.categoryList();
    } else if (uri.pathSegments.length == 1) {
      // Home '/categories'
      final firstSegment = uri.pathSegments[0].toLowerCase();
      if (firstSegment == CrudTodoPath.category) {
        return const CrudTodoConfig.categoryList();
      }
    } else if (uri.pathSegments.length == 2) {
      // Category detail '/categories/{id}'
      final firstSegment = uri.pathSegments[0].toLowerCase();
      final secondSegment = uri.pathSegments[1];

      if (firstSegment == CrudTodoPath.category) {
        if (secondSegment.isNotEmpty) {
          return CrudTodoConfig.todoList(categoryId: secondSegment);
        }
      }
    } else if (uri.pathSegments.length == 3) {
      // Todos new '/categories/{id}/todos/
      final firstSegment = uri.pathSegments[0].toLowerCase();
      final secondSegment = uri.pathSegments[1];
      final thirdSegment = uri.pathSegments[2].toLowerCase();

      if (firstSegment == CrudTodoPath.category) {
        if (secondSegment.isNotEmpty) {
          if (thirdSegment == CrudTodoPath.todo) {
            return CrudTodoConfig.addTodo(categoryId: secondSegment);
          }
        }
      }
    } else if (uri.pathSegments.length == 4) {
      // Todos update '/categories/{catId}/todos/{todoId}
      final firstSegment = uri.pathSegments[0].toLowerCase();
      final secondSegment = uri.pathSegments[1];
      final thirdSegment = uri.pathSegments[2].toLowerCase();
      final lastSegment = uri.pathSegments[3];

      if (firstSegment == CrudTodoPath.category) {
        if (secondSegment.isNotEmpty) {
          if (thirdSegment == CrudTodoPath.todo) {
            if (lastSegment.isNotEmpty) {
              return CrudTodoConfig.updateTodo(
                categoryId: secondSegment,
                todoId: lastSegment,
              );
            }
          }
        }
      }
    }

    return const CrudTodoConfig.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(CrudTodoConfig configuration) {
    if (configuration.isUnknown) {
      return const RouteInformation(location: '/${CrudTodoPath.unknown}');
    } else if (configuration.isCategoryListPage) {
      const categoryPath = CrudTodoPath.category;

      return const RouteInformation(location: '/$categoryPath');
    } else if (configuration.isTodoListPage) {
      const categoryPath = CrudTodoPath.category;
      final currentCategoryId = configuration.currentCategoryId;

      return RouteInformation(location: '/$categoryPath/$currentCategoryId');
    } else if (configuration.isAddTodoPage) {
      const categoryPath = CrudTodoPath.category;
      final currentCategoryId = configuration.currentCategoryId;
      const todoPath = CrudTodoPath.todo;

      return RouteInformation(
        location: '/$categoryPath/$currentCategoryId/$todoPath/',
      );
    } else if (configuration.isUpdateTodoPage) {
      const categoryPath = CrudTodoPath.category;
      final currentCategoryId = configuration.currentCategoryId;
      const todoPath = CrudTodoPath.todo;
      final currentTodoId = configuration.currentTodoId;

      return RouteInformation(
        location: '/$categoryPath/$currentCategoryId/$todoPath/$currentTodoId',
      );
    }

    return null;
  }
}
