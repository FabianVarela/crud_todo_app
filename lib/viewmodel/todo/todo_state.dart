import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_state.freezed.dart';

enum TodoAction { add, update, remove, check }

@freezed
sealed class TodoState with _$TodoState {
  const factory TodoState.initial() = TodoStateInitial;

  const factory TodoState.loading() = TodoStateLoading;

  const factory TodoState.success(TodoAction action) = TodoStateSuccess;

  const factory TodoState.error([String? message]) = TodoStateError;
}

extension TodoStateX on TodoState {
  bool get isLoading => this is TodoStateLoading;

  bool get isSuccess => this is TodoStateSuccess;

  bool get isError => this is TodoStateError;
}
