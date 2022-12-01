// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TodoAction action)? success,
    TResult? Function(String? message)? error,
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
    TResult? Function(_TodoStateInitial value)? initial,
    TResult? Function(_TodoStateLoading value)? loading,
    TResult? Function(_TodoStateSuccess value)? success,
    TResult? Function(_TodoStateError value)? error,
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
      _$TodoStateCopyWithImpl<$Res, TodoState>;
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res, $Val extends TodoState>
    implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_TodoStateInitialCopyWith<$Res> {
  factory _$$_TodoStateInitialCopyWith(
          _$_TodoStateInitial value, $Res Function(_$_TodoStateInitial) then) =
      __$$_TodoStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TodoStateInitialCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$_TodoStateInitial>
    implements _$$_TodoStateInitialCopyWith<$Res> {
  __$$_TodoStateInitialCopyWithImpl(
      _$_TodoStateInitial _value, $Res Function(_$_TodoStateInitial) _then)
      : super(_value, _then);
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_TodoStateInitial);
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
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TodoAction action)? success,
    TResult? Function(String? message)? error,
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
    TResult? Function(_TodoStateInitial value)? initial,
    TResult? Function(_TodoStateLoading value)? loading,
    TResult? Function(_TodoStateSuccess value)? success,
    TResult? Function(_TodoStateError value)? error,
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
abstract class _$$_TodoStateLoadingCopyWith<$Res> {
  factory _$$_TodoStateLoadingCopyWith(
          _$_TodoStateLoading value, $Res Function(_$_TodoStateLoading) then) =
      __$$_TodoStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TodoStateLoadingCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$_TodoStateLoading>
    implements _$$_TodoStateLoadingCopyWith<$Res> {
  __$$_TodoStateLoadingCopyWithImpl(
      _$_TodoStateLoading _value, $Res Function(_$_TodoStateLoading) _then)
      : super(_value, _then);
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_TodoStateLoading);
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
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TodoAction action)? success,
    TResult? Function(String? message)? error,
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
    TResult? Function(_TodoStateInitial value)? initial,
    TResult? Function(_TodoStateLoading value)? loading,
    TResult? Function(_TodoStateSuccess value)? success,
    TResult? Function(_TodoStateError value)? error,
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
abstract class _$$_TodoStateSuccessCopyWith<$Res> {
  factory _$$_TodoStateSuccessCopyWith(
          _$_TodoStateSuccess value, $Res Function(_$_TodoStateSuccess) then) =
      __$$_TodoStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({TodoAction action});
}

/// @nodoc
class __$$_TodoStateSuccessCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$_TodoStateSuccess>
    implements _$$_TodoStateSuccessCopyWith<$Res> {
  __$$_TodoStateSuccessCopyWithImpl(
      _$_TodoStateSuccess _value, $Res Function(_$_TodoStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_$_TodoStateSuccess(
      null == action
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
        (other.runtimeType == runtimeType &&
            other is _$_TodoStateSuccess &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoStateSuccessCopyWith<_$_TodoStateSuccess> get copyWith =>
      __$$_TodoStateSuccessCopyWithImpl<_$_TodoStateSuccess>(this, _$identity);

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
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TodoAction action)? success,
    TResult? Function(String? message)? error,
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
    TResult? Function(_TodoStateInitial value)? initial,
    TResult? Function(_TodoStateLoading value)? loading,
    TResult? Function(_TodoStateSuccess value)? success,
    TResult? Function(_TodoStateError value)? error,
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
  const factory _TodoStateSuccess(final TodoAction action) =
      _$_TodoStateSuccess;

  TodoAction get action;
  @JsonKey(ignore: true)
  _$$_TodoStateSuccessCopyWith<_$_TodoStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TodoStateErrorCopyWith<$Res> {
  factory _$$_TodoStateErrorCopyWith(
          _$_TodoStateError value, $Res Function(_$_TodoStateError) then) =
      __$$_TodoStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$_TodoStateErrorCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$_TodoStateError>
    implements _$$_TodoStateErrorCopyWith<$Res> {
  __$$_TodoStateErrorCopyWithImpl(
      _$_TodoStateError _value, $Res Function(_$_TodoStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_TodoStateError(
      freezed == message
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
        (other.runtimeType == runtimeType &&
            other is _$_TodoStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoStateErrorCopyWith<_$_TodoStateError> get copyWith =>
      __$$_TodoStateErrorCopyWithImpl<_$_TodoStateError>(this, _$identity);

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
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TodoAction action)? success,
    TResult? Function(String? message)? error,
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
    TResult? Function(_TodoStateInitial value)? initial,
    TResult? Function(_TodoStateLoading value)? loading,
    TResult? Function(_TodoStateSuccess value)? success,
    TResult? Function(_TodoStateError value)? error,
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
  const factory _TodoStateError([final String? message]) = _$_TodoStateError;

  String? get message;
  @JsonKey(ignore: true)
  _$$_TodoStateErrorCopyWith<_$_TodoStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
