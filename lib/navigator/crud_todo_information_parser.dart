import 'package:crud_todo_app/navigator/config/crud_todo_config.dart';
import 'package:flutter/material.dart';

enum TodoPath {
  category('categories'),
  addCategory('add-category'),
  todo('todo'),
  unknown('404');

  const TodoPath(this.name);

  final String name;
}

class CrudTodoInformationParser extends RouteInformationParser<CrudTodoConfig> {
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
    return configuration.when(
      categoryList: () => RouteInformation(
        uri: Uri.parse('/${TodoPath.category.name}'),
      ),
      addCategory: () => RouteInformation(
        uri: Uri.parse(
          '/${TodoPath.category.name}/${TodoPath.addCategory.name}',
        ),
      ),
      todoList: (id) => RouteInformation(
        uri: Uri.parse('/${TodoPath.category.name}/$id'),
      ),
      addTodo: (id) => RouteInformation(
        uri: Uri.parse('/${TodoPath.category.name}/$id/${TodoPath.todo.name}/'),
      ),
      updateTodo: (id, todoId) => RouteInformation(
        uri: Uri.parse(
          '/${TodoPath.category.name}/$id/${TodoPath.todo.name}/$todoId',
        ),
      ),
      unknown: () => RouteInformation(
        uri: Uri.parse('/${TodoPath.unknown.name}'),
      ),
    );
  }
}
