import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_state.freezed.dart';

enum CategoryAction { add, remove }

@freezed
abstract class CategoryState with _$CategoryState {
  ///Initial
  const factory CategoryState.initial() = _CategoryStateInitial;

  /// Loading
  const factory CategoryState.loading() = _CategoryStateLoading;

  /// Success
  const factory CategoryState.success(CategoryAction action) =
      _CategoryStateSuccess;

  /// Error
  const factory CategoryState.error([String? message]) = _CategoryStateError;
}
