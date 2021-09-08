import 'package:crud_todo_app/navigator/config/crud_todo_config.dart';
import 'package:flutter/material.dart';

class CrudTodoPath {
  static const pathCategory = 'categories';
  static const pathTodo = 'todo';
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
          return CrudTodoConfigTodoList(secondSegment);
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
            return CrudTodoConfigAddTodo(secondSegment);
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
              return CrudTodoConfigUpdateTodo(secondSegment, lastSegment);
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
    if (configuration is CrudTodoConfigUnknown) {
      return const RouteInformation(location: '/${CrudTodoPath.pathUnknown}');
    } else if (configuration is CrudTodoConfigCategoryList) {
      const categoryPath = CrudTodoPath.pathCategory;

      return const RouteInformation(location: '/$categoryPath');
    } else if (configuration is CrudTodoConfigTodoList) {
      const categoryPath = CrudTodoPath.pathCategory;
      final currentCategoryId = configuration.categoryId;

      return RouteInformation(location: '/$categoryPath/$currentCategoryId');
    } else if (configuration is CrudTodoConfigAddTodo) {
      const categoryPath = CrudTodoPath.pathCategory;
      final currentCategoryId = configuration.categoryId;
      const todoPath = CrudTodoPath.pathTodo;

      return RouteInformation(
        location: '/$categoryPath/$currentCategoryId/$todoPath/',
      );
    } else if (configuration is CrudTodoConfigUpdateTodo) {
      const categoryPath = CrudTodoPath.pathCategory;
      final currentCategoryId = configuration.categoryId;
      const todoPath = CrudTodoPath.pathTodo;
      final currentTodoId = configuration.todoId;

      return RouteInformation(
        location: '/$categoryPath/$currentCategoryId/$todoPath/$currentTodoId',
      );
    }

    return null;
  }
}
