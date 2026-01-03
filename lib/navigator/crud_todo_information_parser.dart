import 'package:crud_todo_app/navigator/config/crud_todo_config.dart';
import 'package:flutter/material.dart';

enum TodoPath {
  category('categories'),
  addCategory('add-category'),
  todo('todo'),
  unknown('404')
  ;

  const TodoPath(this.name);

  final String name;
}

final class CrudTodoInformationParser
    extends RouteInformationParser<CrudTodoConfig> {
  @override
  Future<CrudTodoConfig> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final newPaths = routeInformation.uri.pathSegments.map((pathSegment) {
      final path = TodoPath.values.where((value) => value.name == pathSegment);
      return path.isEmpty ? pathSegment : pathSegment.toLowerCase();
    }).toList();

    if (newPaths.isEmpty) return const CrudTodoConfigCategoryList();

    if (newPaths.length == 1) {
      if (newPaths.first == TodoPath.category.name) {
        return const CrudTodoConfigCategoryList();
      } else if (newPaths.first == TodoPath.addCategory.name) {
        return const CrudTodoConfigAddCategory();
      }
    } else if (newPaths.length == 2) {
      if (newPaths.first == TodoPath.category.name) {
        if (newPaths.last == TodoPath.addCategory.name) {
          return const CrudTodoConfigAddCategory();
        }
        return CrudTodoConfigTodoList(categoryId: newPaths.last);
      }
    } else if (newPaths.length == 3 || newPaths.length == 4) {
      if (newPaths.first == TodoPath.category.name) {
        if (newPaths[1] != TodoPath.addCategory.name) {
          if (newPaths[2] == TodoPath.todo.name) {
            if (newPaths.length == 3) {
              return CrudTodoConfigAddTodo(categoryId: newPaths[1]);
            } else {
              return CrudTodoConfigUpdateTodo(
                categoryId: newPaths[1],
                todoId: newPaths.last,
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
    return switch (configuration) {
      CrudTodoConfigCategoryList() => RouteInformation(
        uri: Uri.parse('/${TodoPath.category.name}'),
      ),
      CrudTodoConfigAddCategory() => RouteInformation(
        uri: Uri.parse(
          '/${TodoPath.category.name}/${TodoPath.addCategory.name}',
        ),
      ),
      CrudTodoConfigTodoList(:final categoryId) => RouteInformation(
        uri: Uri.parse('/${TodoPath.category.name}/$categoryId'),
      ),
      CrudTodoConfigAddTodo(:final categoryId) => RouteInformation(
        uri: Uri.parse(
          '/${TodoPath.category.name}/$categoryId/${TodoPath.todo.name}/',
        ),
      ),
      CrudTodoConfigUpdateTodo(:final categoryId, :final todoId) =>
        RouteInformation(
          uri: Uri.parse(
            '/${TodoPath.category.name}/$categoryId/${TodoPath.todo.name}/$todoId',
          ),
        ),
      _ => RouteInformation(uri: Uri.parse('/${TodoPath.unknown.name}')),
    };
  }
}
