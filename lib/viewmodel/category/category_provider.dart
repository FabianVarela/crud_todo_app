import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoryListProvider = StreamProvider.autoDispose(
  (ref) => ref.watch(categoryRepositoryProvider).getCategories(),
);

final categoryDetailProvider = FutureProvider.family.autoDispose((
  ref,
  String categoryId,
) {
  return ref
      .watch(categoryRepositoryProvider)
      .getCategoryById(categoryId: categoryId);
});

final nameCategoryProvider = StateProvider.autoDispose(
  (_) => const ValidationText(),
);
final emojiCategoryProvider = StateProvider.autoDispose(
  (_) => const ValidationText(),
);

final validationCategoryProvider = StateProvider.autoDispose((ref) {
  final name = ref.watch(nameCategoryProvider).text;
  final emoji = ref.watch(emojiCategoryProvider).text;

  final isValidEmoji = (emoji ?? '').isNotEmpty && (emoji ?? '').isEmoji;
  return (name ?? '').isNotEmpty && isValidEmoji;
});
