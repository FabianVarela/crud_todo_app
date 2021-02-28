import 'package:crud_todo_app/database/todo.database.dart';
import 'package:crud_todo_app/dependency/injector.dart';
import 'package:crud_todo_app/model/category.model.dart';
import 'package:crud_todo_app/model/validation_text.model.dart';
import 'package:crud_todo_app/utils/utils.dart';
import 'package:crud_todo_app/utils/validations.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoryDataProvider = StreamProvider<List<Category>>(
  (ref) => getIt<ITodoDatabase>().getCategories(),
);

final isAddedCategoryProvider = StateProvider.autoDispose((_) => false);

final nameCategoryProvider = StateProvider.autoDispose((_) => ValidationText());
final emojiCategoryProvider =
    StateProvider.autoDispose((_) => ValidationText());

final validationCategoryProvider = StateProvider.autoDispose((ref) {
  final name = ref.watch(nameCategoryProvider).state.text;
  final emoji = ref.watch(emojiCategoryProvider).state.text;

  return (name ?? '').isNotEmpty &&
      ((emoji ?? '').isNotEmpty && (emoji ?? '').verifyEmoji);
});

final categoryViewModelProvider = Provider((_) => CategoryViewModel());

class CategoryViewModel with Validations {
  final _database = getIt<ITodoDatabase>();

  ValidationText onChangeName(String value) => validateEmpty(value);

  ValidationText onChangeEmoji(String value) => validateEmoji(value);

  void saveCategory(String name, String emoji) async {
    final category = Category(
      name: name,
      emoji: EmojiParser().getEmoji(emoji),
    );
    await _database.saveCategory(category);
  }

  void deleteCategory(String id) async => await _database.deleteCategory(id);
}
