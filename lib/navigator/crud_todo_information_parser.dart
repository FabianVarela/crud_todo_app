import 'package:crud_todo_app/navigator/config/crud_todo_config.dart';
import 'package:flutter/material.dart';

enum TodoPath {
  category('categories'),
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
    final uri = routeInformation.uri;
    final newPaths = uri.pathSegments.map((seg) => seg.toLowerCase()).toList();

    switch (newPaths.length) {
      case 0:
        return const CrudTodoConfigCategoryList();
      case 1:
        if (newPaths[0] == TodoPath.category.name) {
          return const CrudTodoConfigCategoryList();
        }
      case 2:
        if (newPaths[0] == TodoPath.category.name && newPaths[1].isNotEmpty) {
          return CrudTodoConfigTodoList(newPaths[1]);
        }
      case 3:
        if (newPaths[0] == TodoPath.category.name) {
          if (newPaths[1].isNotEmpty && newPaths[2] == TodoPath.todo.name) {
            return CrudTodoConfigAddTodo(newPaths[1]);
          }
        }
      case 4:
        if (newPaths[0] == TodoPath.category.name && newPaths[1].isNotEmpty) {
          if (newPaths[2] == TodoPath.todo.name && newPaths[3].isNotEmpty) {
            return CrudTodoConfigUpdateTodo(newPaths[1], newPaths[3]);
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
      todoList: (categoryId) => RouteInformation(
        uri: Uri.parse('/${TodoPath.category.name}/$categoryId'),
      ),
      addTodo: (id) => RouteInformation(
        uri: Uri.parse('/${TodoPath.category.name}/$id/${TodoPath.todo.name}/'),
      ),
      updateTodo: (id, tId) => RouteInformation(
        uri: Uri.parse(
          '/${TodoPath.category.name}/$id/${TodoPath.todo.name}/$tId',
        ),
      ),
      unknown: () => RouteInformation(
        uri: Uri.parse('/${TodoPath.unknown.name}'),
      ),
    );
  }
}
