import 'package:crud_todo_app/common/adaptive_contextual_layout.dart';
import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/ui/dialog/category_dialog.dart';
import 'package:crud_todo_app/ui/widgets/category_item.dart';
import 'package:crud_todo_app/ui/widgets/custom_mouse_region.dart';
import 'package:crud_todo_app/viewmodel/category/category_provider.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef NavigatorToDetail = void Function(String);

class CreateCategoryIntent extends Intent {
  const CreateCategoryIntent();
}

class RefreshListIntent extends Intent {
  const RefreshListIntent();
}

class CategoryListView extends ConsumerWidget {
  const CategoryListView({super.key, required this.onGoToDetail});

  final NavigatorToDetail onGoToDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ScrollController();

    final categoriesData = ref.watch(categoryListPod);

    ref.listen(
      categoryViewModelPod,
      (_, CategoryState state) => _onChangeState(context, state),
    );

    final device = getDevice();
    final isDesktop = [
      DeviceSegment.desktop,
      DeviceSegment.desktopWeb,
    ].contains(device);

    const appBarIcon = MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Icon(Icons.menu_rounded, color: Colors.black, size: 30),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: isPortrait(context)
            ? appBarIcon.paddingSymmetric(h: 25)
            : appBarIcon,
      ),
      body: Shortcuts(
        shortcuts: _getShortcutsByOS(),
        child: Actions(
          actions: <Type, Action<Intent>>{
            CreateCategoryIntent: CallbackAction<CreateCategoryIntent>(
              onInvoke: (_) => _showCategoryDialog(context),
            ),
            RefreshListIntent: CallbackAction<RefreshListIntent>(
              onInvoke: (_) => ref.refresh(categoryListPod),
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
                    data: (data) => Scrollbar(
                      controller: scrollController,
                      thumbVisibility: device == DeviceSegment.desktop,
                      child: data.isNotEmpty
                          ? GridView.count(
                              controller: scrollController,
                              crossAxisCount: isPortrait(context) ? 2 : 3,
                              children: <Widget>[
                                for (final item in data)
                                  CustomMouseRegion(
                                    isForDesktop: isDesktop,
                                    cursor: SystemMouseCursors.click,
                                    tooltipMessage: item.name,
                                    child: CategoryItem(
                                      item: item,
                                      onClick: () => onGoToDetail(item.id!),
                                    ),
                                  ),
                              ],
                            )
                          : const Center(
                              child: Text(
                                'Empty data, add a category',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (e, s) => Center(
                      child: Text(
                        e.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ).paddingSymmetric(h: 16),
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
          onPressed: () => _showCategoryDialog(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Map<ShortcutActivator, Intent> _getShortcutsByOS() {
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

    if (error != null) _showMessage(context, error);
  }

  void _showMessage(BuildContext context, String message) {
    final device = getDevice();

    if ([DeviceSegment.desktop, DeviceSegment.desktopWeb].contains(device)) {
      showDialog<void>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('OK'),
              )
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }
}
