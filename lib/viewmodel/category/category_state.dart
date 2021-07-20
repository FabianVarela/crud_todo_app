import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_state.freezed.dart';

enum CategoryAction { add, remove }

@freezed
class CategoryState with _$CategoryState {
  ///Initial
  const factory CategoryState.initial() = CategoryStateInitial;

  /// Loading
  const factory CategoryState.loading() = CategoryStateLoading;

  /// Success
  const factory CategoryState.success(CategoryAction action) =
      CategoryStateSuccess;

  /// Error
  const factory CategoryState.error([String? message]) = CategoryStateError;
}
