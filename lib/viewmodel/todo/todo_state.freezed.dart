// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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

  _TodoStateInitial initial() {
    return const _TodoStateInitial();
  }

  _TodoStateLoading loading() {
    return const _TodoStateLoading();
  }

  _TodoStateSuccess success(TodoAction action) {
    return _TodoStateSuccess(
      action,
    );
  }

  _TodoStateError error([String? message]) {
    return _TodoStateError(
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoAction action)? success,
    TResult Function(String? message)? error,
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
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateSuccess value) success,
    required TResult Function(_TodoStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateSuccess value)? success,
    TResult Function(_TodoStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateSuccess value)? success,
    TResult Function(_TodoStateError value)? error,
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
abstract class _$TodoStateInitialCopyWith<$Res> {
  factory _$TodoStateInitialCopyWith(
          _TodoStateInitial value, $Res Function(_TodoStateInitial) then) =
      __$TodoStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$TodoStateInitialCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res>
    implements _$TodoStateInitialCopyWith<$Res> {
  __$TodoStateInitialCopyWithImpl(
      _TodoStateInitial _value, $Res Function(_TodoStateInitial) _then)
      : super(_value, (v) => _then(v as _TodoStateInitial));

  @override
  _TodoStateInitial get _value => super._value as _TodoStateInitial;
}

/// @nodoc

class _$_TodoStateInitial implements _TodoStateInitial {
  const _$_TodoStateInitial();

  @override
  String toString() {
    return 'TodoState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TodoStateInitial);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoAction action)? success,
    TResult Function(String? message)? error,
  }) {
    return initial?.call();
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
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateSuccess value) success,
    required TResult Function(_TodoStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateSuccess value)? success,
    TResult Function(_TodoStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateSuccess value)? success,
    TResult Function(_TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _TodoStateInitial implements TodoState {
  const factory _TodoStateInitial() = _$_TodoStateInitial;
}

/// @nodoc
abstract class _$TodoStateLoadingCopyWith<$Res> {
  factory _$TodoStateLoadingCopyWith(
          _TodoStateLoading value, $Res Function(_TodoStateLoading) then) =
      __$TodoStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$TodoStateLoadingCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res>
    implements _$TodoStateLoadingCopyWith<$Res> {
  __$TodoStateLoadingCopyWithImpl(
      _TodoStateLoading _value, $Res Function(_TodoStateLoading) _then)
      : super(_value, (v) => _then(v as _TodoStateLoading));

  @override
  _TodoStateLoading get _value => super._value as _TodoStateLoading;
}

/// @nodoc

class _$_TodoStateLoading implements _TodoStateLoading {
  const _$_TodoStateLoading();

  @override
  String toString() {
    return 'TodoState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TodoStateLoading);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoAction action)? success,
    TResult Function(String? message)? error,
  }) {
    return loading?.call();
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
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateSuccess value) success,
    required TResult Function(_TodoStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateSuccess value)? success,
    TResult Function(_TodoStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateSuccess value)? success,
    TResult Function(_TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _TodoStateLoading implements TodoState {
  const factory _TodoStateLoading() = _$_TodoStateLoading;
}

/// @nodoc
abstract class _$TodoStateSuccessCopyWith<$Res> {
  factory _$TodoStateSuccessCopyWith(
          _TodoStateSuccess value, $Res Function(_TodoStateSuccess) then) =
      __$TodoStateSuccessCopyWithImpl<$Res>;
  $Res call({TodoAction action});
}

/// @nodoc
class __$TodoStateSuccessCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res>
    implements _$TodoStateSuccessCopyWith<$Res> {
  __$TodoStateSuccessCopyWithImpl(
      _TodoStateSuccess _value, $Res Function(_TodoStateSuccess) _then)
      : super(_value, (v) => _then(v as _TodoStateSuccess));

  @override
  _TodoStateSuccess get _value => super._value as _TodoStateSuccess;

  @override
  $Res call({
    Object? action = freezed,
  }) {
    return _then(_TodoStateSuccess(
      action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as TodoAction,
    ));
  }
}

/// @nodoc

class _$_TodoStateSuccess implements _TodoStateSuccess {
  const _$_TodoStateSuccess(this.action);

  @override
  final TodoAction action;

  @override
  String toString() {
    return 'TodoState.success(action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodoStateSuccess &&
            (identical(other.action, action) ||
                const DeepCollectionEquality().equals(other.action, action)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(action);

  @JsonKey(ignore: true)
  @override
  _$TodoStateSuccessCopyWith<_TodoStateSuccess> get copyWith =>
      __$TodoStateSuccessCopyWithImpl<_TodoStateSuccess>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoAction action)? success,
    TResult Function(String? message)? error,
  }) {
    return success?.call(action);
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
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateSuccess value) success,
    required TResult Function(_TodoStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateSuccess value)? success,
    TResult Function(_TodoStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateSuccess value)? success,
    TResult Function(_TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _TodoStateSuccess implements TodoState {
  const factory _TodoStateSuccess(TodoAction action) = _$_TodoStateSuccess;

  TodoAction get action => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$TodoStateSuccessCopyWith<_TodoStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TodoStateErrorCopyWith<$Res> {
  factory _$TodoStateErrorCopyWith(
          _TodoStateError value, $Res Function(_TodoStateError) then) =
      __$TodoStateErrorCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$TodoStateErrorCopyWithImpl<$Res> extends _$TodoStateCopyWithImpl<$Res>
    implements _$TodoStateErrorCopyWith<$Res> {
  __$TodoStateErrorCopyWithImpl(
      _TodoStateError _value, $Res Function(_TodoStateError) _then)
      : super(_value, (v) => _then(v as _TodoStateError));

  @override
  _TodoStateError get _value => super._value as _TodoStateError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_TodoStateError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TodoStateError implements _TodoStateError {
  const _$_TodoStateError([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'TodoState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodoStateError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$TodoStateErrorCopyWith<_TodoStateError> get copyWith =>
      __$TodoStateErrorCopyWithImpl<_TodoStateError>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoAction action)? success,
    TResult Function(String? message)? error,
  }) {
    return error?.call(message);
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
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateSuccess value) success,
    required TResult Function(_TodoStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateSuccess value)? success,
    TResult Function(_TodoStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateSuccess value)? success,
    TResult Function(_TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _TodoStateError implements TodoState {
  const factory _TodoStateError([String? message]) = _$_TodoStateError;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$TodoStateErrorCopyWith<_TodoStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
