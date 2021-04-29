import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_state.freezed.dart';

@freezed
abstract class CategoryState with _$CategoryState {
  ///Initial
  const factory CategoryState.initial() = _CategoryStateInitial;

  /// Loading
  const factory CategoryState.loading() = _CategoryStateLoading;

  /// Success
  const factory CategoryState.success() = _CategoryStateSuccess;

  /// Error
  const factory CategoryState.error([String? message]) = _CategoryStateError;
}
