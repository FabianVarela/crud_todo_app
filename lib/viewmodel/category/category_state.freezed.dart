// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CategoryAction action) success,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CategoryAction action)? success,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CategoryAction action)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoryStateInitial value) initial,
    required TResult Function(_CategoryStateLoading value) loading,
    required TResult Function(_CategoryStateSuccess value) success,
    required TResult Function(_CategoryStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoryStateInitial value)? initial,
    TResult? Function(_CategoryStateLoading value)? loading,
    TResult? Function(_CategoryStateSuccess value)? success,
    TResult? Function(_CategoryStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryStateInitial value)? initial,
    TResult Function(_CategoryStateLoading value)? loading,
    TResult Function(_CategoryStateSuccess value)? success,
    TResult Function(_CategoryStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) then) =
      _$CategoryStateCopyWithImpl<$Res, CategoryState>;
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res, $Val extends CategoryState>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CategoryStateInitialCopyWith<$Res> {
  factory _$$_CategoryStateInitialCopyWith(_$_CategoryStateInitial value,
          $Res Function(_$_CategoryStateInitial) then) =
      __$$_CategoryStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CategoryStateInitialCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$_CategoryStateInitial>
    implements _$$_CategoryStateInitialCopyWith<$Res> {
  __$$_CategoryStateInitialCopyWithImpl(_$_CategoryStateInitial _value,
      $Res Function(_$_CategoryStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CategoryStateInitial implements _CategoryStateInitial {
  const _$_CategoryStateInitial();

  @override
  String toString() {
    return 'CategoryState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CategoryStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CategoryAction action) success,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CategoryAction action)? success,
    TResult? Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CategoryAction action)? success,
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
    required TResult Function(_CategoryStateInitial value) initial,
    required TResult Function(_CategoryStateLoading value) loading,
    required TResult Function(_CategoryStateSuccess value) success,
    required TResult Function(_CategoryStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoryStateInitial value)? initial,
    TResult? Function(_CategoryStateLoading value)? loading,
    TResult? Function(_CategoryStateSuccess value)? success,
    TResult? Function(_CategoryStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryStateInitial value)? initial,
    TResult Function(_CategoryStateLoading value)? loading,
    TResult Function(_CategoryStateSuccess value)? success,
    TResult Function(_CategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _CategoryStateInitial implements CategoryState {
  const factory _CategoryStateInitial() = _$_CategoryStateInitial;
}

/// @nodoc
abstract class _$$_CategoryStateLoadingCopyWith<$Res> {
  factory _$$_CategoryStateLoadingCopyWith(_$_CategoryStateLoading value,
          $Res Function(_$_CategoryStateLoading) then) =
      __$$_CategoryStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CategoryStateLoadingCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$_CategoryStateLoading>
    implements _$$_CategoryStateLoadingCopyWith<$Res> {
  __$$_CategoryStateLoadingCopyWithImpl(_$_CategoryStateLoading _value,
      $Res Function(_$_CategoryStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CategoryStateLoading implements _CategoryStateLoading {
  const _$_CategoryStateLoading();

  @override
  String toString() {
    return 'CategoryState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CategoryStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CategoryAction action) success,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CategoryAction action)? success,
    TResult? Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CategoryAction action)? success,
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
    required TResult Function(_CategoryStateInitial value) initial,
    required TResult Function(_CategoryStateLoading value) loading,
    required TResult Function(_CategoryStateSuccess value) success,
    required TResult Function(_CategoryStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoryStateInitial value)? initial,
    TResult? Function(_CategoryStateLoading value)? loading,
    TResult? Function(_CategoryStateSuccess value)? success,
    TResult? Function(_CategoryStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryStateInitial value)? initial,
    TResult Function(_CategoryStateLoading value)? loading,
    TResult Function(_CategoryStateSuccess value)? success,
    TResult Function(_CategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _CategoryStateLoading implements CategoryState {
  const factory _CategoryStateLoading() = _$_CategoryStateLoading;
}

/// @nodoc
abstract class _$$_CategoryStateSuccessCopyWith<$Res> {
  factory _$$_CategoryStateSuccessCopyWith(_$_CategoryStateSuccess value,
          $Res Function(_$_CategoryStateSuccess) then) =
      __$$_CategoryStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryAction action});
}

/// @nodoc
class __$$_CategoryStateSuccessCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$_CategoryStateSuccess>
    implements _$$_CategoryStateSuccessCopyWith<$Res> {
  __$$_CategoryStateSuccessCopyWithImpl(_$_CategoryStateSuccess _value,
      $Res Function(_$_CategoryStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_$_CategoryStateSuccess(
      null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as CategoryAction,
    ));
  }
}

/// @nodoc

class _$_CategoryStateSuccess implements _CategoryStateSuccess {
  const _$_CategoryStateSuccess(this.action);

  @override
  final CategoryAction action;

  @override
  String toString() {
    return 'CategoryState.success(action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryStateSuccess &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryStateSuccessCopyWith<_$_CategoryStateSuccess> get copyWith =>
      __$$_CategoryStateSuccessCopyWithImpl<_$_CategoryStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CategoryAction action) success,
    required TResult Function(String? message) error,
  }) {
    return success(action);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CategoryAction action)? success,
    TResult? Function(String? message)? error,
  }) {
    return success?.call(action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CategoryAction action)? success,
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
    required TResult Function(_CategoryStateInitial value) initial,
    required TResult Function(_CategoryStateLoading value) loading,
    required TResult Function(_CategoryStateSuccess value) success,
    required TResult Function(_CategoryStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoryStateInitial value)? initial,
    TResult? Function(_CategoryStateLoading value)? loading,
    TResult? Function(_CategoryStateSuccess value)? success,
    TResult? Function(_CategoryStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryStateInitial value)? initial,
    TResult Function(_CategoryStateLoading value)? loading,
    TResult Function(_CategoryStateSuccess value)? success,
    TResult Function(_CategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _CategoryStateSuccess implements CategoryState {
  const factory _CategoryStateSuccess(final CategoryAction action) =
      _$_CategoryStateSuccess;

  CategoryAction get action;
  @JsonKey(ignore: true)
  _$$_CategoryStateSuccessCopyWith<_$_CategoryStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CategoryStateErrorCopyWith<$Res> {
  factory _$$_CategoryStateErrorCopyWith(_$_CategoryStateError value,
          $Res Function(_$_CategoryStateError) then) =
      __$$_CategoryStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$_CategoryStateErrorCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$_CategoryStateError>
    implements _$$_CategoryStateErrorCopyWith<$Res> {
  __$$_CategoryStateErrorCopyWithImpl(
      _$_CategoryStateError _value, $Res Function(_$_CategoryStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_CategoryStateError(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CategoryStateError implements _CategoryStateError {
  const _$_CategoryStateError([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'CategoryState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryStateErrorCopyWith<_$_CategoryStateError> get copyWith =>
      __$$_CategoryStateErrorCopyWithImpl<_$_CategoryStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CategoryAction action) success,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CategoryAction action)? success,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CategoryAction action)? success,
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
    required TResult Function(_CategoryStateInitial value) initial,
    required TResult Function(_CategoryStateLoading value) loading,
    required TResult Function(_CategoryStateSuccess value) success,
    required TResult Function(_CategoryStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CategoryStateInitial value)? initial,
    TResult? Function(_CategoryStateLoading value)? loading,
    TResult? Function(_CategoryStateSuccess value)? success,
    TResult? Function(_CategoryStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryStateInitial value)? initial,
    TResult Function(_CategoryStateLoading value)? loading,
    TResult Function(_CategoryStateSuccess value)? success,
    TResult Function(_CategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _CategoryStateError implements CategoryState {
  const factory _CategoryStateError([final String? message]) =
      _$_CategoryStateError;

  String? get message;
  @JsonKey(ignore: true)
  _$$_CategoryStateErrorCopyWith<_$_CategoryStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
