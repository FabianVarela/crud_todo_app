import 'package:crud_todo_app/common/utils.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/repository/category_repository.dart';
import 'package:crud_todo_app/viewmodel/category/category_provider.dart';
import 'package:crud_todo_app/viewmodel/category/category_state.dart';
import 'package:dart_emoji/dart_emoji.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ICategoryViewModel extends StateNotifier<CategoryState> {
  ICategoryViewModel() : super(const CategoryState.initial());

  ValidationText get nameCat;

  ValidationText get emojiCat;

  ICategoryRepository get categoryRepository;

  ValidationText onChangeName(String value) => Utils.validateEmpty(value);

  ValidationText onChangeEmoji(String value) => Utils.validateEmoji(value);

  Future<void> saveCategory() async {
    try {
      state = const CategoryState.loading();

      final name = nameCat;
      final emoji = emojiCat;

      await categoryRepository.saveCategory(
        Category(
          name: name.text!,
          emoji: EmojiParser().getEmoji(emoji.text!),
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
      await categoryRepository.deleteCategory(id);
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
  ValidationText get nameCat => _read(nameCatProvider);

  @override
  ValidationText get emojiCat => _read(emojiCatProvider);

  @override
  ICategoryRepository get categoryRepository =>
      _read(categoryRepositoryProvider);
}
