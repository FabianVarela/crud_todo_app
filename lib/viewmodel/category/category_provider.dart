import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoryListPod = StreamProvider.autoDispose<List<Category>>(
  (ref) => ref.watch(categoryRepositoryPod).getCategories(),
);

final categoryDetailPod = FutureProvider.family.autoDispose<Category, String>(
  (ref, id) => ref.watch(categoryRepositoryPod).getCategoryById(id),
);

final nameCategoryPod = StateProvider.autoDispose(
  (_) => const ValidationText(),
);
final emojiCategoryPod = StateProvider.autoDispose(
  (_) => const ValidationText(),
);

final validationCategoryPod = StateProvider.autoDispose((ref) {
  final name = ref.watch(nameCategoryPod).text;
  final emoji = ref.watch(emojiCategoryPod).text;

  final isValidEmoji = (emoji ?? '').isNotEmpty && (emoji ?? '').verifyEmoji;
  return (name ?? '').isNotEmpty && isValidEmoji;
});
