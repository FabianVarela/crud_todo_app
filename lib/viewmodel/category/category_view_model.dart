import 'package:crud_todo_app/common/validations.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/model/category.model.dart';
import 'package:crud_todo_app/model/validation_text.model.dart';
import 'package:crud_todo_app/viewmodel/category/category_provider.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryViewModel extends StateNotifier<CategoryState> with Validations {
  late final Reader _read;

  CategoryViewModel(this._read) : super(const CategoryState.initial());

  ValidationText onChangeName(String value) => validateEmpty(value);

  ValidationText onChangeEmoji(String value) => validateEmoji(value);

  void saveCategory() async {
    try {
      state = CategoryState.loading();

      final name = _read(nameCatProvider).state;
      final emoji = _read(emojiCatProvider).state;

      await _read(todoRepositoryProvider).saveCategory(Category(
        name: name.text!,
        emoji: EmojiParser().getEmoji(emoji.text!),
      ));

      state = CategoryState.success(CategoryAction.add);
    } catch (_) {
      state = CategoryState.error();
    }
  }

  void removeCategory(String id) async {
    try {
      state = CategoryState.loading();
      await _read(todoRepositoryProvider).deleteCategory(id);
      state = CategoryState.success(CategoryAction.remove);
    } on Exception catch (e) {
      state = CategoryState.error(e.toString());
    }
  }
}
