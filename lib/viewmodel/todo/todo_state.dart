import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_state.freezed.dart';

@freezed
abstract class TodoState with _$TodoState {
  ///Initial
  const factory TodoState.initial() = _TodoStateInitial;

  /// Loading
  const factory TodoState.loading() = _TodoStateLoading;

  /// Success
  const factory TodoState.add() = _TodoStateAdd;

  const factory TodoState.update() = _TodoStateUpdate;

  const factory TodoState.remove() = _TodoStateRemove;

  const factory TodoState.check() = _TodoStateCheck;

  /// Error
  const factory TodoState.error([String? message]) = _TodoStateError;
}
