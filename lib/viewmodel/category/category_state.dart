import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_state.freezed.dart';

enum CategoryAction { add, remove }

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _CategoryStateInitial;

  const factory CategoryState.loading() = _CategoryStateLoading;

  const factory CategoryState.success(CategoryAction action) =
      _CategoryStateSuccess;

  const factory CategoryState.error([String? message]) = _CategoryStateError;
}

extension CategoryStateX on CategoryState {
  bool get isLoading => this is _CategoryStateLoading;

  bool get isSuccess => this is _CategoryStateSuccess;

  bool get isError => this is _CategoryStateError;
}
