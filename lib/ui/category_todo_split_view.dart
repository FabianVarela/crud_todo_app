import 'package:crud_todo_app/ui/category_list_view.dart';
import 'package:crud_todo_app/ui/todo_list_view.dart';
import 'package:duo_kit/duo_kit.dart';
import 'package:material_ui/material_ui.dart';

final class CategoryTodoSplitView extends StatelessWidget {
  const new({
    required this.onAddCategory,
    required this.onGoToDetail,
    required this.onGoToTodo,
    this.categoryId,
    super.key,
  });

  final VoidCallback onAddCategory;
  final ValueSetter<String> onGoToDetail;
  final NavigatorToTodo onGoToTodo;
  final String? categoryId;

  @override
  Widget build(BuildContext context) {
    final currentCategoryId = categoryId;

    return FoldSplitView(
      first: CategoryListView(
        onAddCategory: onAddCategory,
        onGoToDetail: onGoToDetail,
        enableHeroTransition: false,
      ),
      second: currentCategoryId != null
          ? TodoListView(
              categoryId: currentCategoryId,
              onGoToTodo: onGoToTodo,
              enableHeroTransition: false,
            )
          : const _NoCategorySelected(),
      unfoldedBuilder: (_, first, _) => first,
    );
  }
}

final class _NoCategorySelected extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Select a category',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
