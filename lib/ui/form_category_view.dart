import 'package:crud_todo_app/common/adaptive_contextual_layout.dart';
import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/ui/widgets/custom_mouse_region.dart';
import 'package:crud_todo_app/viewmodel/category/category_provider.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FormCategoryView extends ConsumerWidget {
  const FormCategoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryState = ref.watch(categoryViewModelPod);
    final isValidForm = ref.watch(validationCategoryProvider);

    final isDesktopOrTablet = [ScreenType.desktop, ScreenType.tablet]
        .contains(getFormFactor(context));

    final desktopWidth = isDesktopOrTablet ? 600.0 : null;
    final mobileWidth = !isPortrait(context) ? 400.0 : null;

    ref.listen(
      categoryViewModelPod,
      (_, CategoryState state) => _onChangeState(context, state),
    );

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
                    SubmitCategory(
                      onSubmit: isValidForm ? () => _saveCategory(ref) : null,
                    )
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

  void _saveCategory(WidgetRef ref) {
    ref.read(categoryViewModelPod.notifier).saveCategory(
          ref.read(nameCategoryProvider.notifier).state.text!,
          ref.read(emojiCategoryProvider.notifier).state.text!,
        );
  }

  void _onChangeState(BuildContext context, CategoryState state) {
    final action = state.maybeWhen(success: (a) => a, orElse: () => null);
    if (action == CategoryAction.add) Navigator.pop(context);
  }
}

class NameCategory extends HookConsumerWidget {
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
      onChanged: (value) => nameText.state =
          ref.read(categoryViewModelPod.notifier).onChangeName(value),
    );
  }
}

class EmojiCategory extends HookConsumerWidget {
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
      onChanged: (value) => emoji.state =
          ref.read(categoryViewModelPod.notifier).onChangeEmoji(value),
    );
  }
}

class SubmitCategory extends ConsumerWidget {
  const SubmitCategory({super.key, this.onSubmit});

  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A78FA)),
      onPressed: onSubmit,
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
}
