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
      return const CrudTodoConfigCategoryList();
    } else if (uri.pathSegments.length == 1) {
      // Home '/categories'
      final firstSegment = uri.pathSegments[0].toLowerCase();
      if (firstSegment == CrudTodoPath.category) {
        return const CrudTodoConfigCategoryList();
      }
    } else if (uri.pathSegments.length == 2) {
      // Category detail '/categories/{id}'
      final firstSegment = uri.pathSegments[0].toLowerCase();
      final secondSegment = uri.pathSegments[1];

      if (firstSegment == CrudTodoPath.category) {
        if (secondSegment.isNotEmpty) {
          return CrudTodoConfigTodoList(secondSegment);
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
            return CrudTodoConfigAddTodo(secondSegment);
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
              return CrudTodoConfigUpdateTodo(secondSegment, lastSegment);
            }
          }
        }
      }
    }

    return const CrudTodoConfig.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(CrudTodoConfig configuration) {
    return configuration.when(
      categoryList: () {
        return const RouteInformation(location: '/${CrudTodoPath.category}');
      },
      todoList: (categoryId) {
        const categoryPath = CrudTodoPath.category;
        return RouteInformation(location: '/$categoryPath/$categoryId');
      },
      addTodo: (categoryId) {
        const catPath = CrudTodoPath.category;
        const todoPath = CrudTodoPath.todo;
        return RouteInformation(location: '/$catPath/$categoryId/$todoPath/');
      },
      updateTodo: (id, todoId) {
        const catPath = CrudTodoPath.category;
        const todoPath = CrudTodoPath.todo;
        return RouteInformation(location: '/$catPath/$id/$todoPath/$todoId');
      },
      unknown: () {
        return const RouteInformation(location: '/${CrudTodoPath.unknown}');
      },
    );
  }
}
