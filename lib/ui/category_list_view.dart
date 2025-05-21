import 'package:crud_todo_app/common/adaptive_contextual_layout.dart';
import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/ui/widgets/category_item.dart';
import 'package:crud_todo_app/ui/widgets/custom_message.dart';
import 'package:crud_todo_app/ui/widgets/custom_mouse_region.dart';
import 'package:crud_todo_app/viewmodel/category/category_provider.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final class CreateCategoryIntent extends Intent {
  const CreateCategoryIntent();
}

final class RefreshListIntent extends Intent {
  const RefreshListIntent();
}

final class CategoryListView extends HookConsumerWidget {
  const CategoryListView({
    required this.onAddCategory,
    required this.onGoToDetail,
    super.key,
  });

  final VoidCallback onAddCategory;
  final ValueSetter<String> onGoToDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final categoriesData = ref.watch(categoryListProvider);

    ref.listen<CategoryState>(categoryViewModelProvider, (_, state) {
      if (state case CategoryStateSuccess(:final action)) {
        final message = switch (action) {
          CategoryAction.add => 'Category created successfully',
          CategoryAction.remove => 'Category removed successfully',
        };
        showCustomMessage(context, message: message);
      } else if (state case CategoryStateError(:final message)) {
        if (message != null) showCustomMessage(context, message: message);
      }
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Icon(Icons.menu_rounded, color: Colors.black, size: 30),
        ),
      ),
      body: Shortcuts(
        shortcuts: _shortcutsByOS,
        child: Actions(
          actions: <Type, Action<Intent>>{
            CreateCategoryIntent: CallbackAction<CreateCategoryIntent>(
              onInvoke: (_) => onAddCategory(),
            ),
            RefreshListIntent: CallbackAction<RefreshListIntent>(
              onInvoke: (_) => ref.refresh(categoryListProvider),
            ),
          },
          child: Focus(
            autofocus: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Lists',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ).paddingSymmetric(h: 12, v: 20),
                Expanded(
                  child: categoriesData.when(
                    data: (data) {
                      if (data.isEmpty) {
                        return const Center(
                          child: Text(
                            'Empty data, add a category',
                            style: TextStyle(fontSize: 25),
                          ),
                        );
                      }

                      return Scrollbar(
                        controller: scrollController,
                        thumbVisibility: currentDevice == DeviceSegment.desktop,
                        child: GridView.count(
                          controller: scrollController,
                          crossAxisCount: context.isPortrait ? 2 : 3,
                          children: <Widget>[
                            for (final item in data)
                              CustomMouseRegion(
                                isForDesktop: desktopSegments.contains(
                                  currentDevice,
                                ),
                                cursor: SystemMouseCursors.click,
                                tooltipMessage: item.name,
                                child: CategoryItem(
                                  item: item,
                                  onClick: () => onGoToDetail(item.id!),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                    loading: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                    error: (e, _) {
                      return Center(
                        child: Text(
                          e.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ).paddingSymmetric(h: 16);
                    },
                  ),
                ),
              ],
            ).paddingSymmetric(h: 16),
          ),
        ),
      ),
      floatingActionButton: Tooltip(
        message: 'Add category',
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF4A78FA),
          onPressed: onAddCategory,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Map<ShortcutActivator, Intent> get _shortcutsByOS {
    return defaultTargetPlatform == TargetPlatform.macOS
        ? <ShortcutActivator, Intent>{
            LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyN):
                const CreateCategoryIntent(),
            LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyR):
                const RefreshListIntent(),
          }
        : <ShortcutActivator, Intent>{
            const SingleActivator(LogicalKeyboardKey.keyN, control: true):
                const CreateCategoryIntent(),
            const SingleActivator(LogicalKeyboardKey.keyR, control: true):
                const RefreshListIntent(),
          };
  }
}
