// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoStateTearOff {
  const _$TodoStateTearOff();

  TodoStateInitial initial() {
    return const TodoStateInitial();
  }

  TodoStateLoading loading() {
    return const TodoStateLoading();
  }

  TodoStateSuccess success(TodoAction action) {
    return TodoStateSuccess(
      action,
    );
  }

  TodoStateError error([String? message]) {
    return TodoStateError(
      message,
    );
  }
}

/// @nodoc
const $TodoState = _$TodoStateTearOff();

/// @nodoc
mixin _$TodoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TodoAction action) success,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoAction action)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoStateInitial value) initial,
    required TResult Function(TodoStateLoading value) loading,
    required TResult Function(TodoStateSuccess value) success,
    required TResult Function(TodoStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoStateInitial value)? initial,
    TResult Function(TodoStateLoading value)? loading,
    TResult Function(TodoStateSuccess value)? success,
    TResult Function(TodoStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateCopyWith<$Res> {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) then) =
      _$TodoStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res> implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  final TodoState _value;
  // ignore: unused_field
  final $Res Function(TodoState) _then;
}

/// @nodoc
abstract class $TodoStateInitialCopyWith<$Res> {
  factory $TodoStateInitialCopyWith(
          TodoStateInitial value, $Res Function(TodoStateInitial) then) =
      _$TodoStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$TodoStateInitialCopyWithImpl<$Res> extends _$TodoStateCopyWithImpl<$Res>
    implements $TodoStateInitialCopyWith<$Res> {
  _$TodoStateInitialCopyWithImpl(
      TodoStateInitial _value, $Res Function(TodoStateInitial) _then)
      : super(_value, (v) => _then(v as TodoStateInitial));

  @override
  TodoStateInitial get _value => super._value as TodoStateInitial;
}

/// @nodoc

class _$TodoStateInitial implements TodoStateInitial {
  const _$TodoStateInitial();

  @override
  String toString() {
    return 'TodoState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is TodoStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TodoAction action) success,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoAction action)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoStateInitial value) initial,
    required TResult Function(TodoStateLoading value) loading,
    required TResult Function(TodoStateSuccess value) success,
    required TResult Function(TodoStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoStateInitial value)? initial,
    TResult Function(TodoStateLoading value)? loading,
    TResult Function(TodoStateSuccess value)? success,
    TResult Function(TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TodoStateInitial implements TodoState {
  const factory TodoStateInitial() = _$TodoStateInitial;
}

/// @nodoc
abstract class $TodoStateLoadingCopyWith<$Res> {
  factory $TodoStateLoadingCopyWith(
          TodoStateLoading value, $Res Function(TodoStateLoading) then) =
      _$TodoStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$TodoStateLoadingCopyWithImpl<$Res> extends _$TodoStateCopyWithImpl<$Res>
    implements $TodoStateLoadingCopyWith<$Res> {
  _$TodoStateLoadingCopyWithImpl(
      TodoStateLoading _value, $Res Function(TodoStateLoading) _then)
      : super(_value, (v) => _then(v as TodoStateLoading));

  @override
  TodoStateLoading get _value => super._value as TodoStateLoading;
}

/// @nodoc

class _$TodoStateLoading implements TodoStateLoading {
  const _$TodoStateLoading();

  @override
  String toString() {
    return 'TodoState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is TodoStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TodoAction action) success,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoAction action)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoStateInitial value) initial,
    required TResult Function(TodoStateLoading value) loading,
    required TResult Function(TodoStateSuccess value) success,
    required TResult Function(TodoStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoStateInitial value)? initial,
    TResult Function(TodoStateLoading value)? loading,
    TResult Function(TodoStateSuccess value)? success,
    TResult Function(TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TodoStateLoading implements TodoState {
  const factory TodoStateLoading() = _$TodoStateLoading;
}

/// @nodoc
abstract class $TodoStateSuccessCopyWith<$Res> {
  factory $TodoStateSuccessCopyWith(
          TodoStateSuccess value, $Res Function(TodoStateSuccess) then) =
      _$TodoStateSuccessCopyWithImpl<$Res>;
  $Res call({TodoAction action});
}

/// @nodoc
class _$TodoStateSuccessCopyWithImpl<$Res> extends _$TodoStateCopyWithImpl<$Res>
    implements $TodoStateSuccessCopyWith<$Res> {
  _$TodoStateSuccessCopyWithImpl(
      TodoStateSuccess _value, $Res Function(TodoStateSuccess) _then)
      : super(_value, (v) => _then(v as TodoStateSuccess));

  @override
  TodoStateSuccess get _value => super._value as TodoStateSuccess;

  @override
  $Res call({
    Object? action = freezed,
  }) {
    return _then(TodoStateSuccess(
      action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as TodoAction,
    ));
  }
}

/// @nodoc

class _$TodoStateSuccess implements TodoStateSuccess {
  const _$TodoStateSuccess(this.action);

  @override
  final TodoAction action;

  @override
  String toString() {
    return 'TodoState.success(action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TodoStateSuccess &&
            (identical(other.action, action) ||
                const DeepCollectionEquality().equals(other.action, action)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(action);

  @JsonKey(ignore: true)
  @override
  $TodoStateSuccessCopyWith<TodoStateSuccess> get copyWith =>
      _$TodoStateSuccessCopyWithImpl<TodoStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TodoAction action) success,
    required TResult Function(String? message) error,
  }) {
    return success(action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoAction action)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(action);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoStateInitial value) initial,
    required TResult Function(TodoStateLoading value) loading,
    required TResult Function(TodoStateSuccess value) success,
    required TResult Function(TodoStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoStateInitial value)? initial,
    TResult Function(TodoStateLoading value)? loading,
    TResult Function(TodoStateSuccess value)? success,
    TResult Function(TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class TodoStateSuccess implements TodoState {
  const factory TodoStateSuccess(TodoAction action) = _$TodoStateSuccess;

  TodoAction get action => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoStateSuccessCopyWith<TodoStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateErrorCopyWith<$Res> {
  factory $TodoStateErrorCopyWith(
          TodoStateError value, $Res Function(TodoStateError) then) =
      _$TodoStateErrorCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$TodoStateErrorCopyWithImpl<$Res> extends _$TodoStateCopyWithImpl<$Res>
    implements $TodoStateErrorCopyWith<$Res> {
  _$TodoStateErrorCopyWithImpl(
      TodoStateError _value, $Res Function(TodoStateError) _then)
      : super(_value, (v) => _then(v as TodoStateError));

  @override
  TodoStateError get _value => super._value as TodoStateError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(TodoStateError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TodoStateError implements TodoStateError {
  const _$TodoStateError([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'TodoState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TodoStateError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $TodoStateErrorCopyWith<TodoStateError> get copyWith =>
      _$TodoStateErrorCopyWithImpl<TodoStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TodoAction action) success,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoAction action)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoStateInitial value) initial,
    required TResult Function(TodoStateLoading value) loading,
    required TResult Function(TodoStateSuccess value) success,
    required TResult Function(TodoStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoStateInitial value)? initial,
    TResult Function(TodoStateLoading value)? loading,
    TResult Function(TodoStateSuccess value)? success,
    TResult Function(TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TodoStateError implements TodoState {
  const factory TodoStateError([String? message]) = _$TodoStateError;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoStateErrorCopyWith<TodoStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
