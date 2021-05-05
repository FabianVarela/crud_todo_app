import 'package:crud_todo_app/model/category.model.dart';
import 'package:crud_todo_app/model/todo.model.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/ui/add_todo.view.dart';
import 'package:crud_todo_app/common/utils.dart';
import 'package:crud_todo_app/ui/widgets/todo_item.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_provider.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:crud_todo_app/common/common.dart';

class TodoListView extends HookConsumerWidget {
  const TodoListView({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context, WidgetReference ref) {
    final todoStream = ref.watch(todoDataProvider(category.id!));
    final categoryVm = ref.watch(categoryViewModelProvider.notifier);

    return ProviderListener(
      provider: todoViewModelProvider,
      onChange: _onChangeState,
      child: Scaffold(
        backgroundColor: Color(0xFF4A78FA),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                categoryVm.removeCategory(category.id!);
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      category.emoji.code,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        category.name,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ).paddingOnly(b: 5),
                      Text(
                        '${category.todoSize} Tasks',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingOnly(l: 35),
            ),
            Expanded(
              flex: 2,
              child: todoStream.when(
                data: (todos) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: todos.isNotEmpty
                        ? _todoList(context, todos)
                            .paddingSymmetric(h: 24, v: 20)
                        : _emptyMessage(),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => Container(
                  child: Center(
                    child: Text(e.toString(), style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF4A78FA),
          onPressed: () => _goToTodo(context),
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _todoList(BuildContext context, List<Todo> todos) {
    return Consumer(
      builder: (_, ref, __) {
        final viewModel = ref.watch(todoViewModelProvider.notifier);
        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (_, pos) => TodoItem(
            item: todos[pos],
            category: category,
            onEdit: () => _goToTodo(context, todo: todos[pos]),
            onRemove: () =>
                viewModel.removeTodo(todos[pos].id, todos[pos].categoryId),
            onCheck: (value) => viewModel.checkTodo(todos[pos], value),
          ),
        );
      },
    );
  }

  Widget _emptyMessage() {
    return Center(
      child: Text(
        'Empty data, add a task',
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  void _goToTodo(BuildContext context, {Todo? todo}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AddTodoView(category: category, todo: todo),
      ),
    );
  }

  void _onChangeState(BuildContext context, TodoState state) {
    final action = state.maybeWhen(success: (a) => a, orElse: () => null);
    final error = state.maybeWhen(error: (m) => m, orElse: () => null);

    if (action != null) {
      if (action == TodoAction.add) {
        _showMessage(context, 'Todo created successfully');
      } else if (action == TodoAction.update) {
        _showMessage(context, 'Todo updated successfully');
      } else if (action == TodoAction.remove) {
        _showMessage(context, 'Todo removed successfully');
      } else if (action == TodoAction.check) {
        _showMessage(context, 'Todo finished successfully');
      }
    }

    if (error != null) {
      _showMessage(context, error);
    }
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
