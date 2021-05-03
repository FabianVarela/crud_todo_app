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

  _TodoStateInitial initial() {
    return const _TodoStateInitial();
  }

  _TodoStateLoading loading() {
    return const _TodoStateLoading();
  }

  _TodoStateAdd add() {
    return const _TodoStateAdd();
  }

  _TodoStateUpdate update() {
    return const _TodoStateUpdate();
  }

  _TodoStateRemove remove() {
    return const _TodoStateRemove();
  }

  _TodoStateCheck check() {
    return const _TodoStateCheck();
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
    required TResult Function() add,
    required TResult Function() update,
    required TResult Function() remove,
    required TResult Function() check,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? add,
    TResult Function()? update,
    TResult Function()? remove,
    TResult Function()? check,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateAdd value) add,
    required TResult Function(_TodoStateUpdate value) update,
    required TResult Function(_TodoStateRemove value) remove,
    required TResult Function(_TodoStateCheck value) check,
    required TResult Function(_TodoStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateAdd value)? add,
    TResult Function(_TodoStateUpdate value)? update,
    TResult Function(_TodoStateRemove value)? remove,
    TResult Function(_TodoStateCheck value)? check,
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
    required TResult Function() add,
    required TResult Function() update,
    required TResult Function() remove,
    required TResult Function() check,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? add,
    TResult Function()? update,
    TResult Function()? remove,
    TResult Function()? check,
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
    required TResult Function(_TodoStateAdd value) add,
    required TResult Function(_TodoStateUpdate value) update,
    required TResult Function(_TodoStateRemove value) remove,
    required TResult Function(_TodoStateCheck value) check,
    required TResult Function(_TodoStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateAdd value)? add,
    TResult Function(_TodoStateUpdate value)? update,
    TResult Function(_TodoStateRemove value)? remove,
    TResult Function(_TodoStateCheck value)? check,
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
    required TResult Function() add,
    required TResult Function() update,
    required TResult Function() remove,
    required TResult Function() check,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? add,
    TResult Function()? update,
    TResult Function()? remove,
    TResult Function()? check,
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
    required TResult Function(_TodoStateAdd value) add,
    required TResult Function(_TodoStateUpdate value) update,
    required TResult Function(_TodoStateRemove value) remove,
    required TResult Function(_TodoStateCheck value) check,
    required TResult Function(_TodoStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateAdd value)? add,
    TResult Function(_TodoStateUpdate value)? update,
    TResult Function(_TodoStateRemove value)? remove,
    TResult Function(_TodoStateCheck value)? check,
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
abstract class _$TodoStateAddCopyWith<$Res> {
  factory _$TodoStateAddCopyWith(
          _TodoStateAdd value, $Res Function(_TodoStateAdd) then) =
      __$TodoStateAddCopyWithImpl<$Res>;
}

/// @nodoc
class __$TodoStateAddCopyWithImpl<$Res> extends _$TodoStateCopyWithImpl<$Res>
    implements _$TodoStateAddCopyWith<$Res> {
  __$TodoStateAddCopyWithImpl(
      _TodoStateAdd _value, $Res Function(_TodoStateAdd) _then)
      : super(_value, (v) => _then(v as _TodoStateAdd));

  @override
  _TodoStateAdd get _value => super._value as _TodoStateAdd;
}

/// @nodoc

class _$_TodoStateAdd implements _TodoStateAdd {
  const _$_TodoStateAdd();

  @override
  String toString() {
    return 'TodoState.add()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TodoStateAdd);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() add,
    required TResult Function() update,
    required TResult Function() remove,
    required TResult Function() check,
    required TResult Function(String? message) error,
  }) {
    return add();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? add,
    TResult Function()? update,
    TResult Function()? remove,
    TResult Function()? check,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateAdd value) add,
    required TResult Function(_TodoStateUpdate value) update,
    required TResult Function(_TodoStateRemove value) remove,
    required TResult Function(_TodoStateCheck value) check,
    required TResult Function(_TodoStateError value) error,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateAdd value)? add,
    TResult Function(_TodoStateUpdate value)? update,
    TResult Function(_TodoStateRemove value)? remove,
    TResult Function(_TodoStateCheck value)? check,
    TResult Function(_TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _TodoStateAdd implements TodoState {
  const factory _TodoStateAdd() = _$_TodoStateAdd;
}

/// @nodoc
abstract class _$TodoStateUpdateCopyWith<$Res> {
  factory _$TodoStateUpdateCopyWith(
          _TodoStateUpdate value, $Res Function(_TodoStateUpdate) then) =
      __$TodoStateUpdateCopyWithImpl<$Res>;
}

/// @nodoc
class __$TodoStateUpdateCopyWithImpl<$Res> extends _$TodoStateCopyWithImpl<$Res>
    implements _$TodoStateUpdateCopyWith<$Res> {
  __$TodoStateUpdateCopyWithImpl(
      _TodoStateUpdate _value, $Res Function(_TodoStateUpdate) _then)
      : super(_value, (v) => _then(v as _TodoStateUpdate));

  @override
  _TodoStateUpdate get _value => super._value as _TodoStateUpdate;
}

/// @nodoc

class _$_TodoStateUpdate implements _TodoStateUpdate {
  const _$_TodoStateUpdate();

  @override
  String toString() {
    return 'TodoState.update()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TodoStateUpdate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() add,
    required TResult Function() update,
    required TResult Function() remove,
    required TResult Function() check,
    required TResult Function(String? message) error,
  }) {
    return update();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? add,
    TResult Function()? update,
    TResult Function()? remove,
    TResult Function()? check,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateAdd value) add,
    required TResult Function(_TodoStateUpdate value) update,
    required TResult Function(_TodoStateRemove value) remove,
    required TResult Function(_TodoStateCheck value) check,
    required TResult Function(_TodoStateError value) error,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateAdd value)? add,
    TResult Function(_TodoStateUpdate value)? update,
    TResult Function(_TodoStateRemove value)? remove,
    TResult Function(_TodoStateCheck value)? check,
    TResult Function(_TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _TodoStateUpdate implements TodoState {
  const factory _TodoStateUpdate() = _$_TodoStateUpdate;
}

/// @nodoc
abstract class _$TodoStateRemoveCopyWith<$Res> {
  factory _$TodoStateRemoveCopyWith(
          _TodoStateRemove value, $Res Function(_TodoStateRemove) then) =
      __$TodoStateRemoveCopyWithImpl<$Res>;
}

/// @nodoc
class __$TodoStateRemoveCopyWithImpl<$Res> extends _$TodoStateCopyWithImpl<$Res>
    implements _$TodoStateRemoveCopyWith<$Res> {
  __$TodoStateRemoveCopyWithImpl(
      _TodoStateRemove _value, $Res Function(_TodoStateRemove) _then)
      : super(_value, (v) => _then(v as _TodoStateRemove));

  @override
  _TodoStateRemove get _value => super._value as _TodoStateRemove;
}

/// @nodoc

class _$_TodoStateRemove implements _TodoStateRemove {
  const _$_TodoStateRemove();

  @override
  String toString() {
    return 'TodoState.remove()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TodoStateRemove);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() add,
    required TResult Function() update,
    required TResult Function() remove,
    required TResult Function() check,
    required TResult Function(String? message) error,
  }) {
    return remove();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? add,
    TResult Function()? update,
    TResult Function()? remove,
    TResult Function()? check,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateAdd value) add,
    required TResult Function(_TodoStateUpdate value) update,
    required TResult Function(_TodoStateRemove value) remove,
    required TResult Function(_TodoStateCheck value) check,
    required TResult Function(_TodoStateError value) error,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateAdd value)? add,
    TResult Function(_TodoStateUpdate value)? update,
    TResult Function(_TodoStateRemove value)? remove,
    TResult Function(_TodoStateCheck value)? check,
    TResult Function(_TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _TodoStateRemove implements TodoState {
  const factory _TodoStateRemove() = _$_TodoStateRemove;
}

/// @nodoc
abstract class _$TodoStateCheckCopyWith<$Res> {
  factory _$TodoStateCheckCopyWith(
          _TodoStateCheck value, $Res Function(_TodoStateCheck) then) =
      __$TodoStateCheckCopyWithImpl<$Res>;
}

/// @nodoc
class __$TodoStateCheckCopyWithImpl<$Res> extends _$TodoStateCopyWithImpl<$Res>
    implements _$TodoStateCheckCopyWith<$Res> {
  __$TodoStateCheckCopyWithImpl(
      _TodoStateCheck _value, $Res Function(_TodoStateCheck) _then)
      : super(_value, (v) => _then(v as _TodoStateCheck));

  @override
  _TodoStateCheck get _value => super._value as _TodoStateCheck;
}

/// @nodoc

class _$_TodoStateCheck implements _TodoStateCheck {
  const _$_TodoStateCheck();

  @override
  String toString() {
    return 'TodoState.check()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TodoStateCheck);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() add,
    required TResult Function() update,
    required TResult Function() remove,
    required TResult Function() check,
    required TResult Function(String? message) error,
  }) {
    return check();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? add,
    TResult Function()? update,
    TResult Function()? remove,
    TResult Function()? check,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (check != null) {
      return check();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateAdd value) add,
    required TResult Function(_TodoStateUpdate value) update,
    required TResult Function(_TodoStateRemove value) remove,
    required TResult Function(_TodoStateCheck value) check,
    required TResult Function(_TodoStateError value) error,
  }) {
    return check(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateAdd value)? add,
    TResult Function(_TodoStateUpdate value)? update,
    TResult Function(_TodoStateRemove value)? remove,
    TResult Function(_TodoStateCheck value)? check,
    TResult Function(_TodoStateError value)? error,
    required TResult orElse(),
  }) {
    if (check != null) {
      return check(this);
    }
    return orElse();
  }
}

abstract class _TodoStateCheck implements TodoState {
  const factory _TodoStateCheck() = _$_TodoStateCheck;
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
    required TResult Function() add,
    required TResult Function() update,
    required TResult Function() remove,
    required TResult Function() check,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? add,
    TResult Function()? update,
    TResult Function()? remove,
    TResult Function()? check,
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
    required TResult Function(_TodoStateAdd value) add,
    required TResult Function(_TodoStateUpdate value) update,
    required TResult Function(_TodoStateRemove value) remove,
    required TResult Function(_TodoStateCheck value) check,
    required TResult Function(_TodoStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateAdd value)? add,
    TResult Function(_TodoStateUpdate value)? update,
    TResult Function(_TodoStateRemove value)? remove,
    TResult Function(_TodoStateCheck value)? check,
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
