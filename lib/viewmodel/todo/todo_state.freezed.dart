// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$TodoStateInitialImplCopyWith<$Res> {
  factory _$$TodoStateInitialImplCopyWith(_$TodoStateInitialImpl value,
          $Res Function(_$TodoStateInitialImpl) then) =
      __$$TodoStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TodoStateInitialImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateInitialImpl>
    implements _$$TodoStateInitialImplCopyWith<$Res> {
  __$$TodoStateInitialImplCopyWithImpl(_$TodoStateInitialImpl _value,
      $Res Function(_$TodoStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TodoStateInitialImpl implements _TodoStateInitial {
  const _$TodoStateInitialImpl();

  @override
  String toString() {
    return 'TodoState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TodoStateInitialImpl);
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
  const factory _TodoStateInitial() = _$TodoStateInitialImpl;
}

/// @nodoc
abstract class _$$TodoStateLoadingImplCopyWith<$Res> {
  factory _$$TodoStateLoadingImplCopyWith(_$TodoStateLoadingImpl value,
          $Res Function(_$TodoStateLoadingImpl) then) =
      __$$TodoStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TodoStateLoadingImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateLoadingImpl>
    implements _$$TodoStateLoadingImplCopyWith<$Res> {
  __$$TodoStateLoadingImplCopyWithImpl(_$TodoStateLoadingImpl _value,
      $Res Function(_$TodoStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TodoStateLoadingImpl implements _TodoStateLoading {
  const _$TodoStateLoadingImpl();

  @override
  String toString() {
    return 'TodoState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TodoStateLoadingImpl);
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
  const factory _TodoStateLoading() = _$TodoStateLoadingImpl;
}

/// @nodoc
abstract class _$$TodoStateSuccessImplCopyWith<$Res> {
  factory _$$TodoStateSuccessImplCopyWith(_$TodoStateSuccessImpl value,
          $Res Function(_$TodoStateSuccessImpl) then) =
      __$$TodoStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TodoAction action});
}

/// @nodoc
class __$$TodoStateSuccessImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateSuccessImpl>
    implements _$$TodoStateSuccessImplCopyWith<$Res> {
  __$$TodoStateSuccessImplCopyWithImpl(_$TodoStateSuccessImpl _value,
      $Res Function(_$TodoStateSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_$TodoStateSuccessImpl(
      null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as TodoAction,
    ));
  }
}

/// @nodoc

class _$TodoStateSuccessImpl implements _TodoStateSuccess {
  const _$TodoStateSuccessImpl(this.action);

  @override
  final TodoAction action;

  @override
  String toString() {
    return 'TodoState.success(action: $action)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoStateSuccessImpl &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoStateSuccessImplCopyWith<_$TodoStateSuccessImpl> get copyWith =>
      __$$TodoStateSuccessImplCopyWithImpl<_$TodoStateSuccessImpl>(
          this, _$identity);

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
      _$TodoStateSuccessImpl;

  TodoAction get action;
  @JsonKey(ignore: true)
  _$$TodoStateSuccessImplCopyWith<_$TodoStateSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TodoStateErrorImplCopyWith<$Res> {
  factory _$$TodoStateErrorImplCopyWith(_$TodoStateErrorImpl value,
          $Res Function(_$TodoStateErrorImpl) then) =
      __$$TodoStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$TodoStateErrorImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateErrorImpl>
    implements _$$TodoStateErrorImplCopyWith<$Res> {
  __$$TodoStateErrorImplCopyWithImpl(
      _$TodoStateErrorImpl _value, $Res Function(_$TodoStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$TodoStateErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TodoStateErrorImpl implements _TodoStateError {
  const _$TodoStateErrorImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'TodoState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoStateErrorImplCopyWith<_$TodoStateErrorImpl> get copyWith =>
      __$$TodoStateErrorImplCopyWithImpl<_$TodoStateErrorImpl>(
          this, _$identity);

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
  const factory _TodoStateError([final String? message]) = _$TodoStateErrorImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$TodoStateErrorImplCopyWith<_$TodoStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
