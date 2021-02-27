import 'package:crud_todo_app/database/todo.database.dart';
import 'package:crud_todo_app/dependency/injector.dart';
import 'package:crud_todo_app/model/category.model.dart';
import 'package:crud_todo_app/utils/utils.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoryDataProvider = StreamProvider<List<Category>>(
  (ref) => getIt<ITodoDatabase>().getCategories(),
);

final isAddedCategoryProvider = StateProvider.autoDispose((_) => false);

final nameCategoryProvider = StateProvider.autoDispose((_) => '');
final emojiCategoryProvider = StateProvider.autoDispose((_) => '');

final validationCategoryProvider = StateProvider.autoDispose((ref) {
  final name = ref.watch(nameCategoryProvider);
  final emoji = ref.watch(emojiCategoryProvider);

  return name.state.isNotEmpty &&
      (emoji.state.isNotEmpty && emoji.state.verifyEmoji);
});

final categoryViewModelProvider = Provider((_) => CategoryViewModel());

class CategoryViewModel {
  final _database = getIt<ITodoDatabase>();

  void saveCategory(String name, String emoji) async {
    final category = Category(
      name: name,
      emoji: EmojiParser().getEmoji(emoji),
    );
    await _database.saveCategory(category);
  }

  void deleteCategory(String id) async => await _database.deleteCategory(id);
}
