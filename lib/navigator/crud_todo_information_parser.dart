import 'package:crud_todo_app/navigator/config/crud_todo_config.dart';
import 'package:flutter/material.dart';

class CrudTodoPath {
  static const pathCategory = 'categories';
  static const pathTodo = 'todo';
  static const pathTodoNew = 'new';
  static const pathTodoUpdate = 'update';
  static const pathUnknown = '404';
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
      if (firstSegment == CrudTodoPath.pathCategory) {
        return const CrudTodoConfig.categoryList();
      }
    } else if (uri.pathSegments.length == 2) {
      // Category detail '/categories/{id}'
      final firstSegment = uri.pathSegments[0].toLowerCase();
      final secondSegment = uri.pathSegments[1];

      if (firstSegment == CrudTodoPath.pathCategory) {
        if (secondSegment.isNotEmpty) {
          return CrudTodoConfig.todoList(categoryId: secondSegment);
        }
      }
    } else if (uri.pathSegments.length == 3) {
      // Todos '/categories/{id}/todos/
      final firstSegment = uri.pathSegments[0].toLowerCase();
      final secondSegment = uri.pathSegments[1];
      final thirdSegment = uri.pathSegments[2].toLowerCase();

      if (firstSegment == CrudTodoPath.pathCategory) {
        if (secondSegment.isNotEmpty) {
          if (thirdSegment == CrudTodoPath.pathTodo) {
            return CrudTodoConfig.addTodo(categoryId: secondSegment);
          }
        }
      }
    } else if (uri.pathSegments.length == 4) {
      // Todos '/categories/{catId}/todos/{todoId}
      final firstSegment = uri.pathSegments[0].toLowerCase();
      final secondSegment = uri.pathSegments[1];
      final thirdSegment = uri.pathSegments[2].toLowerCase();
      final lastSegment = uri.pathSegments[3];

      if (firstSegment == CrudTodoPath.pathCategory) {
        if (secondSegment.isNotEmpty) {
          if (thirdSegment == CrudTodoPath.pathTodo) {
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
  RouteInformation? restoreRouteInformation(
    CrudTodoConfig configuration,
  ) {
    if (configuration.isUnknown) {
      return const RouteInformation(location: '/${CrudTodoPath.pathUnknown}');
    } else if (configuration.isCategoryListPage) {
      const categoryPath = CrudTodoPath.pathCategory;

      return const RouteInformation(location: '/$categoryPath');
    } else if (configuration.isTodoListPage) {
      const categoryPath = CrudTodoPath.pathCategory;
      final currentCategoryId = configuration.currentCategoryId;

      return RouteInformation(location: '/$categoryPath/$currentCategoryId');
    } else if (configuration.isAddTodoPage) {
      const categoryPath = CrudTodoPath.pathCategory;
      final currentCategoryId = configuration.currentCategoryId;
      const todoPath = CrudTodoPath.pathTodo;

      return RouteInformation(
        location: '/$categoryPath/$currentCategoryId/$todoPath/',
      );
    } else if (configuration.isUpdateTodoPage) {
      const categoryPath = CrudTodoPath.pathCategory;
      final currentCategoryId = configuration.currentCategoryId;
      const todoPath = CrudTodoPath.pathTodo;
      final currentTodoId = configuration.currentTodoId;

      return RouteInformation(
        location: '/$categoryPath/$currentCategoryId/$todoPath/$currentTodoId',
      );
    }

    return null;
  }
}
