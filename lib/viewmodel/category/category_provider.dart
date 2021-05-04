import 'package:crud_todo_app/common/utils.dart';
import 'package:crud_todo_app/model/category.model.dart';
import 'package:crud_todo_app/model/validation_text.model.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoryDataProvider = StreamProvider.autoDispose<List<Category>>(
  (ref) => ref.watch(todoRepositoryProvider).getCategories(),
);

final nameCatProvider = StateProvider.autoDispose((_) => ValidationText());
final emojiCatProvider = StateProvider.autoDispose((_) => ValidationText());

final validationCategoryProvider = StateProvider.autoDispose((ref) {
  final name = ref.watch(nameCatProvider).state.text;
  final emoji = ref.watch(emojiCatProvider).state.text;

  final isValidEmoji = ((emoji ?? '').isNotEmpty && (emoji ?? '').verifyEmoji);
  return (name ?? '').isNotEmpty && isValidEmoji;
});
