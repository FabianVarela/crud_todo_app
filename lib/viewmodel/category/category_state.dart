import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_state.freezed.dart';

enum CategoryAction { add, remove }

@freezed
sealed class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = CategoryStateInitial;

  const factory CategoryState.loading() = CategoryStateLoading;

  const factory CategoryState.success(CategoryAction action) =
      CategoryStateSuccess;

  const factory CategoryState.error([String? message]) = CategoryStateError;
}

extension CategoryStateX on CategoryState {
  bool get isLoading => this is CategoryStateLoading;

  bool get isSuccess => this is CategoryStateSuccess;

  bool get isError => this is CategoryStateError;
}
