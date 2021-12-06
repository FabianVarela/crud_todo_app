import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoriesProvider = StreamProvider.autoDispose<List<Category>>(
  (ref) => ref.watch(categoryRepositoryProvider).getCategories(),
);

final categoryProvider = FutureProvider.autoDispose.family<Category, String>(
  (ref, id) => ref.watch(categoryRepositoryProvider).getCategoryById(id),
);

final nameCatProvider = StateProvider.autoDispose(
  (_) => const ValidationText(),
);
final emojiCatProvider = StateProvider.autoDispose(
  (_) => const ValidationText(),
);

final validationCategoryProvider = StateProvider.autoDispose((ref) {
  final name = ref.watch(nameCatProvider).text;
  final emoji = ref.watch(emojiCatProvider).text;

  final isValidEmoji = (emoji ?? '').isNotEmpty && (emoji ?? '').verifyEmoji;
  return (name ?? '').isNotEmpty && isValidEmoji;
});
