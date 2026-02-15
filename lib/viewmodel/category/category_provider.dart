import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoryListProvider = StreamProvider.autoDispose(
  (ref) => ref.watch(categoryRepositoryProvider).getCategories(),
);

final categoryDetailProvider = FutureProvider.family
    .autoDispose<Category, String>((ref, categoryId) {
      return ref
          .watch(categoryRepositoryProvider)
          .getCategoryById(categoryId: categoryId);
    });

class NameCategory extends Notifier<ValidationText> {
  @override
  ValidationText build() => const ValidationText();

  void onChangeValue(String value) => state = value.validateEmpty;
}

final nameCategoryProvider = NotifierProvider.autoDispose(NameCategory.new);

class EmojiCategory extends Notifier<ValidationText> {
  @override
  ValidationText build() => const ValidationText();

  void onChangeValue(String value) => state = value.validateEmoji;
}

final emojiCategoryProvider = NotifierProvider.autoDispose(EmojiCategory.new);

class ValidationCategory extends Notifier<bool> {
  @override
  bool build() {
    final name = ref.watch(nameCategoryProvider).text;
    final emoji = ref.watch(emojiCategoryProvider).text;

    final isValidEmoji = (emoji ?? '').isNotEmpty && (emoji ?? '').isEmoji;
    return (name ?? '').isNotEmpty && isValidEmoji;
  }
}

final validationCategoryProvider = NotifierProvider.autoDispose(
  ValidationCategory.new,
);
