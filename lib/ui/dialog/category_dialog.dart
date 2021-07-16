import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/viewmodel/category/category_provider.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryFormDialog extends HookConsumerWidget {
  const CategoryFormDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryViewModel = ref.watch(categoryViewModelProvider);
    final isValidForm = ref.watch(validationCategoryProvider).state;

    ref.listen(
      categoryViewModelProvider,
      (CategoryState state) => _onChangeState(context, state),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.close, color: Colors.white),
        ).paddingSymmetric(v: 5),
        Container(
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
              const NameCategory().paddingOnly(b: 5),
              const EmojiCategory().paddingOnly(b: 25),
              if (categoryViewModel != const CategoryState.loading())
                SubmitCategory(enabled: isValidForm)
              else
                const CircularProgressIndicator()
            ],
          ).paddingSymmetric(h: 16, v: 10),
        ),
      ],
    );
  }

  void _onChangeState(BuildContext context, CategoryState state) {
    final action = state.maybeWhen(success: (a) => a, orElse: () => null);
    if (action == CategoryAction.add) Navigator.pop(context);
  }
}

class NameCategory extends HookConsumerWidget {
  const NameCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameText = ref.watch(nameCatProvider);
    final textController = useTextEditingController();

    return TextField(
      controller: textController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Name',
        errorText: nameText.state.message,
      ),
      onChanged: (value) => nameText.state =
          ref.read(categoryViewModelProvider.notifier).onChangeName(value),
    );
  }
}

class EmojiCategory extends HookConsumerWidget {
  const EmojiCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emoji = ref.watch(emojiCatProvider);
    final textController = useTextEditingController();

    return TextField(
      controller: textController,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'Emoji',
        errorText: emoji.state.message,
      ),
      onChanged: (value) => emoji.state =
          ref.read(categoryViewModelProvider.notifier).onChangeEmoji(value),
    );
  }
}

class SubmitCategory extends HookConsumerWidget {
  const SubmitCategory({Key? key, this.enabled = false}) : super(key: key);

  final bool enabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryViewModel = ref.watch(categoryViewModelProvider.notifier);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: const Color(0xFF4A78FA)),
      onPressed: enabled
          ? categoryViewModel.saveCategory
          : null,
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
