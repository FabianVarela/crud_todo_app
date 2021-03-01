import 'package:crud_todo_app/model/validation_text.model.dart';
import 'package:crud_todo_app/utils/utils.dart';
import 'package:crud_todo_app/viewModel/category.viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryFormDialog extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = useProvider(categoryViewModelProvider);

    final name = useProvider(nameCategoryProvider);
    final emoji = useProvider(emojiCategoryProvider);
    
    final isAdded = useProvider(isAddedCategoryProvider);
    final validation = useProvider(validationCategoryProvider);

    return ProviderListener<StateController<bool>>(
      provider: isAddedCategoryProvider,
      onChange: (_, addedState) {
        if (addedState.state) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => Navigator.pop(context),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(Icons.close, color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: <Widget>[
                _setTitle(),
                const SizedBox(height: 20),
                _setTextName(categoryProvider, name),
                const SizedBox(height: 10),
                _setTextEmoji(categoryProvider, emoji),
                const SizedBox(height: 30),
                _setButton(categoryProvider, validation.state, name.state.text,
                    emoji.state.text, isAdded),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _setTitle() => Text(
        'Add category',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      );

  Widget _setTextName(
      CategoryViewModel vm, StateController<ValidationText> name) {
    final nameController = useTextEditingController(text: name.state.text);

    return TextField(
      controller: nameController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Name',
        errorText: name.state.message,
      ),
      onChanged: (val) => name.state = vm.onChangeName(val),
    );
  }

  Widget _setTextEmoji(
      CategoryViewModel vm, StateController<ValidationText> emoji) {
    final emojiController = useTextEditingController(text: emoji.state.text);
    return TextField(
      controller: emojiController,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'Emoji',
        errorText: emoji.state.message,
      ),
      onChanged: (val) => emoji.state = vm.onChangeEmoji(val),
    );
  }

  Widget _setButton(CategoryViewModel vm, bool isValid, String name,
      String emoji, StateController<bool> isAdded) {
    return RaisedButton(
      color: Color(0xFF4A78FA),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          'Create',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ).paddingVertical(12),
      onPressed: isValid
          ? () {
              vm.saveCategory(name, emoji);
              isAdded.state = true;
            }
          : null,
    );
  }
}
