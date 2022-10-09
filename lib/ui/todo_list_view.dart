import 'package:context_menus/context_menus.dart';
import 'package:crud_todo_app/common/adaptive_contextual_layout.dart';
import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/todo_model.dart';
import 'package:crud_todo_app/ui/widgets/todo_item.dart';
import 'package:crud_todo_app/viewmodel/category/category_provider.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_provider.dart';
import 'package:crud_todo_app/viewmodel/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef NavigatorToTodo = void Function(String, String?);

class TodoListView extends HookConsumerWidget {
  const TodoListView({
    super.key,
    required this.categoryId,
    required this.onGoToTodo,
  });

  final String categoryId;
  final NavigatorToTodo onGoToTodo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryData = ref.watch(categoryDetailPod(categoryId));
    final todoData = ref.watch(todoListPod(categoryId));

    final dataCategory = categoryData.maybeWhen(
      data: (data) => data,
      orElse: () => null,
    );

    final errorCategory = categoryData.maybeWhen(
      error: (e, _) => e.toString(),
      orElse: () => null,
    );

    ref.listen(
      todoViewModelPod,
      (_, TodoState state) => _onChangeState(context, state),
    );

    return ContextMenuOverlay(
      child: Scaffold(
        backgroundColor: const Color(0xFF4A78FA),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          actions: dataCategory != null
              ? <Widget>[
                  Tooltip(
                    message: 'Delete category',
                    child: IconButton(
                      icon: const Icon(Icons.delete_forever),
                      onPressed: () {
                        ref
                            .read(categoryViewModelPod.notifier)
                            .deleteCategory(categoryId);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ]
              : null,
        ),
        body: dataCategory != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: isPortrait(context) ? 1 : 2,
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
                          child: Hero(
                            tag: '${categoryId}_${dataCategory.emoji.name}',
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                dataCategory.emoji.code,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              dataCategory.name,
                              style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ).paddingOnly(b: 5),
                            Text(
                              '${dataCategory.todoSize} Tasks',
                              style: const TextStyle(
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
                    child: todoData.when(
                      data: (data) {
                        return DecoratedBox(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: data.isNotEmpty
                              ? TodoList(
                                  todoList: data,
                                  onEditItem: (todo) =>
                                      onGoToTodo(categoryId, todo.id),
                                ).paddingSymmetric(h: 24, v: 20)
                              : const Center(
                                  child: Text(
                                    'Empty data, add a task',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (e, _) => Center(
                        child: Text(
                          e.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : errorCategory != null
                ? Center(
                    child: Text(
                      errorCategory,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
        floatingActionButton: dataCategory != null
            ? FloatingActionButton(
                backgroundColor: const Color(0xFF4A78FA),
                onPressed: () => onGoToTodo(categoryId, null),
                child: const Icon(Icons.add),
              )
            : null,
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

    if (error != null) _showMessage(context, error);
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class TodoList extends ConsumerWidget {
  const TodoList({super.key, required this.todoList, required this.onEditItem});

  final List<Todo> todoList;
  final ValueSetter<Todo> onEditItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(todoViewModelPod.notifier);

    final isDesktop = [
      DeviceSegment.desktop,
      DeviceSegment.desktopWeb,
    ].contains(getDevice());

    return ListView(
      children: <Widget>[
        for (final item in todoList)
          if (isDesktop)
            TodoItem.contextual(
              todo: item,
              onEdit: () => onEditItem(item),
              onRemove: () => viewModel.deleteTodo(item.id!, item.categoryId),
              onCheck: (value) => viewModel.checkTodo(item, isChecked: value),
            )
          else
            TodoItem(
              todo: item,
              onEdit: () => onEditItem(item),
              onRemove: () => viewModel.deleteTodo(item.id!, item.categoryId),
              onCheck: (value) => viewModel.checkTodo(item, isChecked: value),
            )
      ],
    );
  }
}
