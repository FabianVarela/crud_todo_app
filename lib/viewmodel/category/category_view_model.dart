import 'package:crud_todo_app/common/validations.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/model/category.model.dart';
import 'package:crud_todo_app/model/validation_text.model.dart';
import 'package:crud_todo_app/viewmodel/category/category_provider.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:crud_todo_app/common/common.dart';

import '../../model/validation_text.model.dart';
import '../../repository/todo.repository.dart';

abstract class ICategoryViewModel extends StateNotifier<CategoryState>
    with Validations {
  ICategoryViewModel() : super(const CategoryState.initial());

  ValidationText get nameCat;
  ValidationText get emojiCat;
  ITodoRepository get todoRepo;

  ValidationText onChangeName(String value) => validateEmpty(value);

  ValidationText onChangeEmoji(String value) => validateEmoji(value);

  void saveCategory() async {
    try {
      state = CategoryState.loading();

      final name = nameCat;
      final emoji = emojiCat;

      await todoRepo.saveCategory(Category(
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
      await todoRepo.deleteCategory(id);
      state = CategoryState.success(CategoryAction.remove);
    } on Exception catch (e) {
      state = CategoryState.error(e.toString());
    }
  }
}

class CategoryViewModel extends ICategoryViewModel {
  CategoryViewModel(this._read);

  late final Reader _read;

  @override
  ValidationText get nameCat => _read(nameCatProvider).state;

  @override
  ValidationText get emojiCat => _read(emojiCatProvider).state;

  @override
  ITodoRepository get todoRepo => _read(todoRepositoryProvider);
}
