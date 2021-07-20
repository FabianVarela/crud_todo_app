// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategoryStateTearOff {
  const _$CategoryStateTearOff();

  CategoryStateInitial initial() {
    return const CategoryStateInitial();
  }

  CategoryStateLoading loading() {
    return const CategoryStateLoading();
  }

  CategoryStateSuccess success(CategoryAction action) {
    return CategoryStateSuccess(
      action,
    );
  }

  CategoryStateError error([String? message]) {
    return CategoryStateError(
      message,
    );
  }
}

/// @nodoc
const $CategoryState = _$CategoryStateTearOff();

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
    required TResult Function(CategoryStateInitial value) initial,
    required TResult Function(CategoryStateLoading value) loading,
    required TResult Function(CategoryStateSuccess value) success,
    required TResult Function(CategoryStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryStateInitial value)? initial,
    TResult Function(CategoryStateLoading value)? loading,
    TResult Function(CategoryStateSuccess value)? success,
    TResult Function(CategoryStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) then) =
      _$CategoryStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  final CategoryState _value;
  // ignore: unused_field
  final $Res Function(CategoryState) _then;
}

/// @nodoc
abstract class $CategoryStateInitialCopyWith<$Res> {
  factory $CategoryStateInitialCopyWith(CategoryStateInitial value,
          $Res Function(CategoryStateInitial) then) =
      _$CategoryStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryStateInitialCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateInitialCopyWith<$Res> {
  _$CategoryStateInitialCopyWithImpl(
      CategoryStateInitial _value, $Res Function(CategoryStateInitial) _then)
      : super(_value, (v) => _then(v as CategoryStateInitial));

  @override
  CategoryStateInitial get _value => super._value as CategoryStateInitial;
}

/// @nodoc

class _$CategoryStateInitial implements CategoryStateInitial {
  const _$CategoryStateInitial();

  @override
  String toString() {
    return 'CategoryState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CategoryStateInitial);
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
    required TResult Function(CategoryStateInitial value) initial,
    required TResult Function(CategoryStateLoading value) loading,
    required TResult Function(CategoryStateSuccess value) success,
    required TResult Function(CategoryStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryStateInitial value)? initial,
    TResult Function(CategoryStateLoading value)? loading,
    TResult Function(CategoryStateSuccess value)? success,
    TResult Function(CategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CategoryStateInitial implements CategoryState {
  const factory CategoryStateInitial() = _$CategoryStateInitial;
}

/// @nodoc
abstract class $CategoryStateLoadingCopyWith<$Res> {
  factory $CategoryStateLoadingCopyWith(CategoryStateLoading value,
          $Res Function(CategoryStateLoading) then) =
      _$CategoryStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryStateLoadingCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateLoadingCopyWith<$Res> {
  _$CategoryStateLoadingCopyWithImpl(
      CategoryStateLoading _value, $Res Function(CategoryStateLoading) _then)
      : super(_value, (v) => _then(v as CategoryStateLoading));

  @override
  CategoryStateLoading get _value => super._value as CategoryStateLoading;
}

/// @nodoc

class _$CategoryStateLoading implements CategoryStateLoading {
  const _$CategoryStateLoading();

  @override
  String toString() {
    return 'CategoryState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CategoryStateLoading);
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
    required TResult Function(CategoryStateInitial value) initial,
    required TResult Function(CategoryStateLoading value) loading,
    required TResult Function(CategoryStateSuccess value) success,
    required TResult Function(CategoryStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryStateInitial value)? initial,
    TResult Function(CategoryStateLoading value)? loading,
    TResult Function(CategoryStateSuccess value)? success,
    TResult Function(CategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CategoryStateLoading implements CategoryState {
  const factory CategoryStateLoading() = _$CategoryStateLoading;
}

/// @nodoc
abstract class $CategoryStateSuccessCopyWith<$Res> {
  factory $CategoryStateSuccessCopyWith(CategoryStateSuccess value,
          $Res Function(CategoryStateSuccess) then) =
      _$CategoryStateSuccessCopyWithImpl<$Res>;
  $Res call({CategoryAction action});
}

/// @nodoc
class _$CategoryStateSuccessCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateSuccessCopyWith<$Res> {
  _$CategoryStateSuccessCopyWithImpl(
      CategoryStateSuccess _value, $Res Function(CategoryStateSuccess) _then)
      : super(_value, (v) => _then(v as CategoryStateSuccess));

  @override
  CategoryStateSuccess get _value => super._value as CategoryStateSuccess;

  @override
  $Res call({
    Object? action = freezed,
  }) {
    return _then(CategoryStateSuccess(
      action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as CategoryAction,
    ));
  }
}

/// @nodoc

class _$CategoryStateSuccess implements CategoryStateSuccess {
  const _$CategoryStateSuccess(this.action);

  @override
  final CategoryAction action;

  @override
  String toString() {
    return 'CategoryState.success(action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryStateSuccess &&
            (identical(other.action, action) ||
                const DeepCollectionEquality().equals(other.action, action)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(action);

  @JsonKey(ignore: true)
  @override
  $CategoryStateSuccessCopyWith<CategoryStateSuccess> get copyWith =>
      _$CategoryStateSuccessCopyWithImpl<CategoryStateSuccess>(
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
    required TResult Function(CategoryStateInitial value) initial,
    required TResult Function(CategoryStateLoading value) loading,
    required TResult Function(CategoryStateSuccess value) success,
    required TResult Function(CategoryStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryStateInitial value)? initial,
    TResult Function(CategoryStateLoading value)? loading,
    TResult Function(CategoryStateSuccess value)? success,
    TResult Function(CategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CategoryStateSuccess implements CategoryState {
  const factory CategoryStateSuccess(CategoryAction action) =
      _$CategoryStateSuccess;

  CategoryAction get action => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryStateSuccessCopyWith<CategoryStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateErrorCopyWith<$Res> {
  factory $CategoryStateErrorCopyWith(
          CategoryStateError value, $Res Function(CategoryStateError) then) =
      _$CategoryStateErrorCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$CategoryStateErrorCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateErrorCopyWith<$Res> {
  _$CategoryStateErrorCopyWithImpl(
      CategoryStateError _value, $Res Function(CategoryStateError) _then)
      : super(_value, (v) => _then(v as CategoryStateError));

  @override
  CategoryStateError get _value => super._value as CategoryStateError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(CategoryStateError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CategoryStateError implements CategoryStateError {
  const _$CategoryStateError([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'CategoryState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryStateError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $CategoryStateErrorCopyWith<CategoryStateError> get copyWith =>
      _$CategoryStateErrorCopyWithImpl<CategoryStateError>(this, _$identity);

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
    required TResult Function(CategoryStateInitial value) initial,
    required TResult Function(CategoryStateLoading value) loading,
    required TResult Function(CategoryStateSuccess value) success,
    required TResult Function(CategoryStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryStateInitial value)? initial,
    TResult Function(CategoryStateLoading value)? loading,
    TResult Function(CategoryStateSuccess value)? success,
    TResult Function(CategoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CategoryStateError implements CategoryState {
  const factory CategoryStateError([String? message]) = _$CategoryStateError;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryStateErrorCopyWith<CategoryStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
