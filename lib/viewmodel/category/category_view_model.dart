import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:dart_emoji/dart_emoji.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryViewModel extends StateNotifier<CategoryState> {
  CategoryViewModel(this._repository) : super(const CategoryState.initial());

  late final ICategoryRepository _repository;

  ValidationText onChangeName(String value) => value.validateEmpty();

  ValidationText onChangeEmoji(String value) => value.validateEmoji();

  Future<void> saveCategory(String name, String emoji) async {
    try {
      state = const CategoryState.loading();

      await _repository.saveCategory(
        Category(
          name: name,
          emoji: EmojiParser().getEmoji(emoji),
        ),
      );

      state = const CategoryState.success(CategoryAction.add);
    } catch (_) {
      state = const CategoryState.error();
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      state = const CategoryState.loading();
      await _repository.deleteCategory(id);
      state = const CategoryState.success(CategoryAction.remove);
    } on Exception catch (e) {
      state = CategoryState.error(e.toString());
    }
  }
}
