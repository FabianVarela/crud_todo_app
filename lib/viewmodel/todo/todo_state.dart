import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_state.freezed.dart';

enum TodoAction { add, update, remove, check }

@freezed
class TodoState with _$TodoState {
  ///Initial
  const factory TodoState.initial() = _TodoStateInitial;

  /// Loading
  const factory TodoState.loading() = _TodoStateLoading;

  /// Success
  const factory TodoState.success(TodoAction action) = _TodoStateSuccess;

  /// Error
  const factory TodoState.error([String? message]) = _TodoStateError;
}
