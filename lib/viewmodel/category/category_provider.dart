import 'package:crud_todo_app/common/utils.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:crud_todo_app/provider_dependency.dart';
import 'package:crud_todo_app/common/common.dart';

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
