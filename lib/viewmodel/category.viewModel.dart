import 'package:crud_todo_app/common/validations.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/repository/todo.repository.dart';
import 'package:crud_todo_app/model/category.model.dart';
import 'package:crud_todo_app/model/validation_text.model.dart';
import 'package:crud_todo_app/common/utils.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoryDataProvider = StreamProvider<List<Category>>(
  (ref) => ref.watch(todoRepositoryProvider).getCategories(),
);

final isAddedCategoryProvider = StateProvider.autoDispose((_) => false);

final nameCatProvider = StateProvider.autoDispose((_) => ValidationText());
final emojiCatProvider = StateProvider.autoDispose((_) => ValidationText());

final validationCategoryProvider = StateProvider.autoDispose((ref) {
  final name = ref.watch(nameCatProvider).state.text;
  final emoji = ref.watch(emojiCatProvider).state.text;

  final isValidEmoji = ((emoji ?? '').isNotEmpty && (emoji ?? '').verifyEmoji);
  return (name ?? '').isNotEmpty && isValidEmoji;
});

class CategoryViewModel with Validations {
  late final ITodoRepository _repository;

  CategoryViewModel(this._repository);

  ValidationText onChangeName(String value) => validateEmpty(value);

  ValidationText onChangeEmoji(String value) => validateEmoji(value);

  void saveCategory(String name, String emoji) async => await _repository
      .saveCategory(Category(name: name, emoji: EmojiParser().getEmoji(emoji)));

  void deleteCategory(String id) async => await _repository.deleteCategory(id);
}
