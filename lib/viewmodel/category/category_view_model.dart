import 'package:crud_todo_app/common/validations.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:crud_todo_app/repository/todo_repository.dart';
import 'package:crud_todo_app/viewmodel/category/category_provider.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:crud_todo_app/common/common.dart';

abstract class ICategoryViewModel extends StateNotifier<CategoryState>
    with Validations {
  ICategoryViewModel() : super(const CategoryState.initial());

  ValidationText get nameCat;

  ValidationText get emojiCat;

  ITodoRepository get todoRepository;

  ValidationText onChangeName(String value) => validateEmpty(value);

  ValidationText onChangeEmoji(String value) => validateEmoji(value);

  void saveCategory() async {
    try {
      state = const CategoryState.loading();

      final name = nameCat;
      final emoji = emojiCat;

      await todoRepository.saveCategory(Category(
        name: name.text!,
        emoji: EmojiParser().getEmoji(emoji.text!),
      ));

      state = const CategoryState.success(CategoryAction.add);
    } catch (_) {
      state = const CategoryState.error();
    }
  }

  void removeCategory(String id) async {
    try {
      state = const CategoryState.loading();
      await todoRepository.deleteCategory(id);
      state = const CategoryState.success(CategoryAction.remove);
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
  ITodoRepository get todoRepository => _read(todoRepositoryProvider);
}
