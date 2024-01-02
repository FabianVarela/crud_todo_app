// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
abstract class _$$CategoryStateInitialImplCopyWith<$Res> {
  factory _$$CategoryStateInitialImplCopyWith(_$CategoryStateInitialImpl value,
          $Res Function(_$CategoryStateInitialImpl) then) =
      __$$CategoryStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoryStateInitialImplCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryStateInitialImpl>
    implements _$$CategoryStateInitialImplCopyWith<$Res> {
  __$$CategoryStateInitialImplCopyWithImpl(_$CategoryStateInitialImpl _value,
      $Res Function(_$CategoryStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CategoryStateInitialImpl implements _CategoryStateInitial {
  const _$CategoryStateInitialImpl();

  @override
  String toString() {
    return 'CategoryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryStateInitialImpl);
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
  const factory _CategoryStateInitial() = _$CategoryStateInitialImpl;
}

/// @nodoc
abstract class _$$CategoryStateLoadingImplCopyWith<$Res> {
  factory _$$CategoryStateLoadingImplCopyWith(_$CategoryStateLoadingImpl value,
          $Res Function(_$CategoryStateLoadingImpl) then) =
      __$$CategoryStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoryStateLoadingImplCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryStateLoadingImpl>
    implements _$$CategoryStateLoadingImplCopyWith<$Res> {
  __$$CategoryStateLoadingImplCopyWithImpl(_$CategoryStateLoadingImpl _value,
      $Res Function(_$CategoryStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CategoryStateLoadingImpl implements _CategoryStateLoading {
  const _$CategoryStateLoadingImpl();

  @override
  String toString() {
    return 'CategoryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryStateLoadingImpl);
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
  const factory _CategoryStateLoading() = _$CategoryStateLoadingImpl;
}

/// @nodoc
abstract class _$$CategoryStateSuccessImplCopyWith<$Res> {
  factory _$$CategoryStateSuccessImplCopyWith(_$CategoryStateSuccessImpl value,
          $Res Function(_$CategoryStateSuccessImpl) then) =
      __$$CategoryStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryAction action});
}

/// @nodoc
class __$$CategoryStateSuccessImplCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryStateSuccessImpl>
    implements _$$CategoryStateSuccessImplCopyWith<$Res> {
  __$$CategoryStateSuccessImplCopyWithImpl(_$CategoryStateSuccessImpl _value,
      $Res Function(_$CategoryStateSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_$CategoryStateSuccessImpl(
      null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as CategoryAction,
    ));
  }
}

/// @nodoc

class _$CategoryStateSuccessImpl implements _CategoryStateSuccess {
  const _$CategoryStateSuccessImpl(this.action);

  @override
  final CategoryAction action;

  @override
  String toString() {
    return 'CategoryState.success(action: $action)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryStateSuccessImpl &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryStateSuccessImplCopyWith<_$CategoryStateSuccessImpl>
      get copyWith =>
          __$$CategoryStateSuccessImplCopyWithImpl<_$CategoryStateSuccessImpl>(
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
      _$CategoryStateSuccessImpl;

  CategoryAction get action;
  @JsonKey(ignore: true)
  _$$CategoryStateSuccessImplCopyWith<_$CategoryStateSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryStateErrorImplCopyWith<$Res> {
  factory _$$CategoryStateErrorImplCopyWith(_$CategoryStateErrorImpl value,
          $Res Function(_$CategoryStateErrorImpl) then) =
      __$$CategoryStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$CategoryStateErrorImplCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryStateErrorImpl>
    implements _$$CategoryStateErrorImplCopyWith<$Res> {
  __$$CategoryStateErrorImplCopyWithImpl(_$CategoryStateErrorImpl _value,
      $Res Function(_$CategoryStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$CategoryStateErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CategoryStateErrorImpl implements _CategoryStateError {
  const _$CategoryStateErrorImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'CategoryState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryStateErrorImplCopyWith<_$CategoryStateErrorImpl> get copyWith =>
      __$$CategoryStateErrorImplCopyWithImpl<_$CategoryStateErrorImpl>(
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
      _$CategoryStateErrorImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$CategoryStateErrorImplCopyWith<_$CategoryStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
