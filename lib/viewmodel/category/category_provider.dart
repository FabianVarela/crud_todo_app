import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/*
TODO: Restore autoDispose when error has been fixed
  https://github.com/rrousselGit/riverpod/issues/1713
  https://github.com/dart-lang/sdk/issues/50119
*/

final categoryListPod = StreamProvider<List<Category>>(
  (ref) => ref.watch(categoryRepositoryPod).getCategories(),
);

final categoryDetailPod = FutureProvider.family<Category, String>(
  (ref, id) => ref.watch(categoryRepositoryPod).getCategoryById(id),
);

final nameCategoryPod = StateProvider((_) => const ValidationText());
final emojiCategoryPod = StateProvider((_) => const ValidationText());

final validationCategoryPod = StateProvider((ref) {
  final name = ref.watch(nameCategoryPod).text;
  final emoji = ref.watch(emojiCategoryPod).text;

  final isValidEmoji = (emoji ?? '').isNotEmpty && (emoji ?? '').verifyEmoji;
  return (name ?? '').isNotEmpty && isValidEmoji;
});
