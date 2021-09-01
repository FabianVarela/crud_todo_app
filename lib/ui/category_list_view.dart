import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/ui/dialog/category_dialog.dart';
import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/ui/widgets/category_item.dart';
import 'package:crud_todo_app/viewmodel/category/category_provider.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef NavigatorToDetail = void Function(String);

class CategoryListView extends ConsumerWidget {
  const CategoryListView({Key? key, required this.onGoToDetail})
      : super(key: key);

  final NavigatorToDetail onGoToDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesDataStream = ref.watch(categoriesDataProvider);

    ref.listen(
      categoryViewModelProvider,
      (CategoryState state) => _onChangeState(context, state),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu_rounded, color: Colors.black, size: 30)
            .paddingSymmetric(h: 25),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Lists',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ).paddingSymmetric(h: 12, v: 20),
          Expanded(
            child: categoriesDataStream.when(
              data: (categories) => categories.isNotEmpty
                  ? GridView.count(
                      crossAxisCount: 2,
                      children: <Widget>[
                        for (final item in categories)
                          CategoryItem(
                            item: item,
                            onClick: () => onGoToDetail(item.id!),
                          ),
                      ],
                    )
                  : const Center(
                      child: Text(
                        'Empty data, add a category',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Center(
                child: Text(
                  e.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ).paddingSymmetric(h: 16),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF4A78FA),
        onPressed: () => _showCategoryDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showCategoryDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: CategoryFormDialog(),
        ),
      ),
    );
  }

  void _onChangeState(BuildContext context, CategoryState state) {
    final action = state.maybeWhen(success: (a) => a, orElse: () => null);
    final error = state.maybeWhen(error: (m) => m, orElse: () => null);

    if (action == CategoryAction.add) {
      _showMessage(context, 'Category created successfully');
    } else if (action == CategoryAction.remove) {
      _showMessage(context, 'Category removed successfully');
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
