import 'package:crud_todo_app/common/adaptive_contextual_layout.dart';
import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/ui/widgets/custom_mouse_region.dart';
import 'package:crud_todo_app/viewmodel/category/category_provider.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final class FormCategoryView extends ConsumerWidget {
  const FormCategoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryState = ref.watch(categoryViewModelProvider);

    final isDesktopOrTablet = [
      ScreenType.desktop,
      ScreenType.tablet,
    ].contains(context.formFactor);

    final desktopWidth = isDesktopOrTablet ? 600.0 : null;
    final mobileWidth = !context.isPortrait ? 400.0 : null;

    ref.listen(categoryViewModelProvider, (_, state) {
      _onChangeState(context, state);
    });

    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: desktopWidth ?? mobileWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            CustomMouseRegion(
              cursor: SystemMouseCursors.click,
              isForDesktop: desktopSegments.contains(currentDevice),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, color: Colors.white),
              ).paddingSymmetric(v: 5),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: <Widget>[
                  const Text(
                    'Add category',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ).paddingOnly(b: 15),
                  Column(
                    children: <Widget>[
                      const NameCategory().paddingOnly(b: 5),
                      const EmojiCategory().paddingOnly(b: 25),
                    ],
                  ),
                  if (!categoryState.isLoading)
                    const SubmitCategory()
                  else
                    const CircularProgressIndicator(),
                ],
              ).paddingSymmetric(h: 16, v: 10),
            ),
          ],
        ),
      ),
    );
  }

  void _onChangeState(BuildContext context, CategoryState state) {
    if (state case CategoryStateSuccess(:final action)) {
      if (action == CategoryAction.add) Navigator.pop(context);
    }
  }
}

final class NameCategory extends HookConsumerWidget {
  const NameCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameText = ref.watch(nameCategoryProvider.notifier);
    final textController = useTextEditingController();

    return TextField(
      controller: textController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Name',
        errorText: nameText.state.message,
      ),
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      onChanged: (value) => nameText.update((_) => value.validateEmpty),
    );
  }
}

final class EmojiCategory extends HookConsumerWidget {
  const EmojiCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emoji = ref.watch(emojiCategoryProvider.notifier);
    final textController = useTextEditingController();

    return TextField(
      controller: textController,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'Emoji',
        errorText: emoji.state.message,
      ),
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      onChanged: (value) => emoji.update((_) => value.validateEmoji),
    );
  }
}

final class SubmitCategory extends ConsumerWidget {
  const SubmitCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValidForm = ref.watch(validationCategoryProvider);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A78FA)),
      onPressed: isValidForm ? () => _saveCategory(ref) : null,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: const Text(
          'Create',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ).paddingSymmetric(v: 12),
    );
  }

  void _saveCategory(WidgetRef ref) {
    final name = ref.read(nameCategoryProvider.notifier).state.text!;
    final emoji = ref.read(emojiCategoryProvider.notifier).state.text!;

    ref
        .read(categoryViewModelProvider.notifier)
        .saveCategory(name: name, emoji: emoji);
  }
}
