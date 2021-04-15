import 'package:crud_todo_app/common/utils.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/viewmodel/category.viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryFormDialog extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final name = useProvider(nameCatProvider);
    final emoji = useProvider(emojiCatProvider);

    final nameText = useTextEditingController(text: name.state.text ?? '');
    final emojiText = useTextEditingController(text: emoji.state.text ?? '');

    return ProviderListener<StateController<bool>>(
      provider: isAddedCategoryProvider,
      onChange: (_, addedState) {
        if (addedState.state) {
          WidgetsBinding.instance!.addPostFrameCallback(
            (_) => Navigator.pop(context),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.close, color: Colors.white),
          ).paddingVertical(5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Add category',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 15),
                _nameTextField(context, nameText),
                const SizedBox(height: 5),
                _emojiTextField(context, emojiText),
                const SizedBox(height: 25),
                _categoryButton(name.state.text ?? '', emoji.state.text ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _nameTextField(BuildContext ctx, TextEditingController controller) {
    return Consumer(
      builder: (_, watch, __) => TextField(
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: 'Name',
          errorText: watch(nameCatProvider).state.message,
        ),
        onChanged: (value) => watch(nameCatProvider).state =
            ctx.read(categoryViewModelProvider).onChangeName(value),
      ),
    );
  }

  Widget _emojiTextField(BuildContext ctx, TextEditingController controller) {
    return Consumer(
      builder: (_, watch, __) => TextField(
        controller: controller,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: 'Emoji',
          errorText: watch(emojiCatProvider).state.message,
        ),
        onChanged: (value) => watch(emojiCatProvider).state =
            ctx.read(categoryViewModelProvider).onChangeEmoji(value),
      ),
    );
  }

  Widget _categoryButton(String name, String emoji) {
    return Consumer(builder: (_, watch, __) {
      final categoryViewModel = watch(categoryViewModelProvider);

      final isValid = watch(validationCategoryProvider).state;
      final isAdded = watch(isAddedCategoryProvider);

      return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Color(0xFF4A78FA)),
        onPressed: isValid
            ? () {
                categoryViewModel.saveCategory(name, emoji);
                isAdded.state = true;
              }
            : null,
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            'Create',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ).paddingVertical(12),
      );
    });
  }
}
