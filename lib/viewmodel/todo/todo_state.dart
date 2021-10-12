import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_state.freezed.dart';

enum TodoAction { add, update, remove, check }

@freezed
class TodoState with _$TodoState {
  const factory TodoState.initial() = _TodoStateInitial;

  const factory TodoState.loading() = _TodoStateLoading;

  const factory TodoState.success(TodoAction action) = _TodoStateSuccess;

  const factory TodoState.error([String? message]) = _TodoStateError;
}

extension TodoStateX on TodoState {
  bool get isLoading => this is _TodoStateLoading;

  bool get isSuccess => this is _TodoStateSuccess;

  bool get isError => this is _TodoStateError;
}
