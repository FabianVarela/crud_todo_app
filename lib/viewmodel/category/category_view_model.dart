import 'dart:async';

import 'package:crud_todo_app/dependency/dependency.dart';
import 'package:crud_todo_app/model/category_model.dart';
import 'package:dart_emoji/dart_emoji.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum CategoryAction { add, remove, none }

final class CategoryViewModel extends AsyncNotifier<CategoryAction> {
  @override
  FutureOr<CategoryAction> build() => CategoryAction.none;

  Future<void> saveCategory({
    required String name,
    required String emoji,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.watch(categoryRepositoryProvider);
      await repository.saveCategory(
        category: Category(name: name, emoji: EmojiParser().getEmoji(emoji)),
      );
      return CategoryAction.add;
    });
  }

  Future<void> deleteCategory({required String categoryId}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.watch(categoryRepositoryProvider);
      await repository.deleteCategory(categoryId: categoryId);

      return CategoryAction.remove;
    });
  }
}
