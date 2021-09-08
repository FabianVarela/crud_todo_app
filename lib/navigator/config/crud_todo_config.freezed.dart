// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'crud_todo_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CrudTodoConfigTearOff {
  const _$CrudTodoConfigTearOff();

  CrudTodoConfigCategoryList categoryList() {
    return const CrudTodoConfigCategoryList();
  }

  CrudTodoConfigTodoList todoList(String categoryId) {
    return CrudTodoConfigTodoList(
      categoryId,
    );
  }

  CrudTodoConfigAddTodo addTodo(String categoryId) {
    return CrudTodoConfigAddTodo(
      categoryId,
    );
  }

  CrudTodoConfigUpdateTodo updateTodo(String categoryId, String todoId) {
    return CrudTodoConfigUpdateTodo(
      categoryId,
      todoId,
    );
  }

  CrudTodoConfigUnknown unknown() {
    return const CrudTodoConfigUnknown();
  }
}

/// @nodoc
const $CrudTodoConfig = _$CrudTodoConfigTearOff();

/// @nodoc
mixin _$CrudTodoConfig {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() categoryList,
    required TResult Function(String categoryId) todoList,
    required TResult Function(String categoryId) addTodo,
    required TResult Function(String categoryId, String todoId) updateTodo,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? categoryList,
    TResult Function(String categoryId)? todoList,
    TResult Function(String categoryId)? addTodo,
    TResult Function(String categoryId, String todoId)? updateTodo,
    TResult Function()? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudTodoConfigCategoryList value) categoryList,
    required TResult Function(CrudTodoConfigTodoList value) todoList,
    required TResult Function(CrudTodoConfigAddTodo value) addTodo,
    required TResult Function(CrudTodoConfigUpdateTodo value) updateTodo,
    required TResult Function(CrudTodoConfigUnknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudTodoConfigCategoryList value)? categoryList,
    TResult Function(CrudTodoConfigTodoList value)? todoList,
    TResult Function(CrudTodoConfigAddTodo value)? addTodo,
    TResult Function(CrudTodoConfigUpdateTodo value)? updateTodo,
    TResult Function(CrudTodoConfigUnknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrudTodoConfigCopyWith<$Res> {
  factory $CrudTodoConfigCopyWith(
          CrudTodoConfig value, $Res Function(CrudTodoConfig) then) =
      _$CrudTodoConfigCopyWithImpl<$Res>;
}

/// @nodoc
class _$CrudTodoConfigCopyWithImpl<$Res>
    implements $CrudTodoConfigCopyWith<$Res> {
  _$CrudTodoConfigCopyWithImpl(this._value, this._then);

  final CrudTodoConfig _value;
  // ignore: unused_field
  final $Res Function(CrudTodoConfig) _then;
}

/// @nodoc
abstract class $CrudTodoConfigCategoryListCopyWith<$Res> {
  factory $CrudTodoConfigCategoryListCopyWith(CrudTodoConfigCategoryList value,
          $Res Function(CrudTodoConfigCategoryList) then) =
      _$CrudTodoConfigCategoryListCopyWithImpl<$Res>;
}

/// @nodoc
class _$CrudTodoConfigCategoryListCopyWithImpl<$Res>
    extends _$CrudTodoConfigCopyWithImpl<$Res>
    implements $CrudTodoConfigCategoryListCopyWith<$Res> {
  _$CrudTodoConfigCategoryListCopyWithImpl(CrudTodoConfigCategoryList _value,
      $Res Function(CrudTodoConfigCategoryList) _then)
      : super(_value, (v) => _then(v as CrudTodoConfigCategoryList));

  @override
  CrudTodoConfigCategoryList get _value =>
      super._value as CrudTodoConfigCategoryList;
}

/// @nodoc

class _$CrudTodoConfigCategoryList implements CrudTodoConfigCategoryList {
  const _$CrudTodoConfigCategoryList();

  @override
  String toString() {
    return 'CrudTodoConfig.categoryList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CrudTodoConfigCategoryList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() categoryList,
    required TResult Function(String categoryId) todoList,
    required TResult Function(String categoryId) addTodo,
    required TResult Function(String categoryId, String todoId) updateTodo,
    required TResult Function() unknown,
  }) {
    return categoryList();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? categoryList,
    TResult Function(String categoryId)? todoList,
    TResult Function(String categoryId)? addTodo,
    TResult Function(String categoryId, String todoId)? updateTodo,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (categoryList != null) {
      return categoryList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudTodoConfigCategoryList value) categoryList,
    required TResult Function(CrudTodoConfigTodoList value) todoList,
    required TResult Function(CrudTodoConfigAddTodo value) addTodo,
    required TResult Function(CrudTodoConfigUpdateTodo value) updateTodo,
    required TResult Function(CrudTodoConfigUnknown value) unknown,
  }) {
    return categoryList(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudTodoConfigCategoryList value)? categoryList,
    TResult Function(CrudTodoConfigTodoList value)? todoList,
    TResult Function(CrudTodoConfigAddTodo value)? addTodo,
    TResult Function(CrudTodoConfigUpdateTodo value)? updateTodo,
    TResult Function(CrudTodoConfigUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (categoryList != null) {
      return categoryList(this);
    }
    return orElse();
  }
}

abstract class CrudTodoConfigCategoryList implements CrudTodoConfig {
  const factory CrudTodoConfigCategoryList() = _$CrudTodoConfigCategoryList;
}

/// @nodoc
abstract class $CrudTodoConfigTodoListCopyWith<$Res> {
  factory $CrudTodoConfigTodoListCopyWith(CrudTodoConfigTodoList value,
          $Res Function(CrudTodoConfigTodoList) then) =
      _$CrudTodoConfigTodoListCopyWithImpl<$Res>;
  $Res call({String categoryId});
}

/// @nodoc
class _$CrudTodoConfigTodoListCopyWithImpl<$Res>
    extends _$CrudTodoConfigCopyWithImpl<$Res>
    implements $CrudTodoConfigTodoListCopyWith<$Res> {
  _$CrudTodoConfigTodoListCopyWithImpl(CrudTodoConfigTodoList _value,
      $Res Function(CrudTodoConfigTodoList) _then)
      : super(_value, (v) => _then(v as CrudTodoConfigTodoList));

  @override
  CrudTodoConfigTodoList get _value => super._value as CrudTodoConfigTodoList;

  @override
  $Res call({
    Object? categoryId = freezed,
  }) {
    return _then(CrudTodoConfigTodoList(
      categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CrudTodoConfigTodoList implements CrudTodoConfigTodoList {
  const _$CrudTodoConfigTodoList(this.categoryId);

  @override
  final String categoryId;

  @override
  String toString() {
    return 'CrudTodoConfig.todoList(categoryId: $categoryId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CrudTodoConfigTodoList &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(categoryId);

  @JsonKey(ignore: true)
  @override
  $CrudTodoConfigTodoListCopyWith<CrudTodoConfigTodoList> get copyWith =>
      _$CrudTodoConfigTodoListCopyWithImpl<CrudTodoConfigTodoList>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() categoryList,
    required TResult Function(String categoryId) todoList,
    required TResult Function(String categoryId) addTodo,
    required TResult Function(String categoryId, String todoId) updateTodo,
    required TResult Function() unknown,
  }) {
    return todoList(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? categoryList,
    TResult Function(String categoryId)? todoList,
    TResult Function(String categoryId)? addTodo,
    TResult Function(String categoryId, String todoId)? updateTodo,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (todoList != null) {
      return todoList(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudTodoConfigCategoryList value) categoryList,
    required TResult Function(CrudTodoConfigTodoList value) todoList,
    required TResult Function(CrudTodoConfigAddTodo value) addTodo,
    required TResult Function(CrudTodoConfigUpdateTodo value) updateTodo,
    required TResult Function(CrudTodoConfigUnknown value) unknown,
  }) {
    return todoList(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudTodoConfigCategoryList value)? categoryList,
    TResult Function(CrudTodoConfigTodoList value)? todoList,
    TResult Function(CrudTodoConfigAddTodo value)? addTodo,
    TResult Function(CrudTodoConfigUpdateTodo value)? updateTodo,
    TResult Function(CrudTodoConfigUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (todoList != null) {
      return todoList(this);
    }
    return orElse();
  }
}

abstract class CrudTodoConfigTodoList implements CrudTodoConfig {
  const factory CrudTodoConfigTodoList(String categoryId) =
      _$CrudTodoConfigTodoList;

  String get categoryId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrudTodoConfigTodoListCopyWith<CrudTodoConfigTodoList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrudTodoConfigAddTodoCopyWith<$Res> {
  factory $CrudTodoConfigAddTodoCopyWith(CrudTodoConfigAddTodo value,
          $Res Function(CrudTodoConfigAddTodo) then) =
      _$CrudTodoConfigAddTodoCopyWithImpl<$Res>;
  $Res call({String categoryId});
}

/// @nodoc
class _$CrudTodoConfigAddTodoCopyWithImpl<$Res>
    extends _$CrudTodoConfigCopyWithImpl<$Res>
    implements $CrudTodoConfigAddTodoCopyWith<$Res> {
  _$CrudTodoConfigAddTodoCopyWithImpl(
      CrudTodoConfigAddTodo _value, $Res Function(CrudTodoConfigAddTodo) _then)
      : super(_value, (v) => _then(v as CrudTodoConfigAddTodo));

  @override
  CrudTodoConfigAddTodo get _value => super._value as CrudTodoConfigAddTodo;

  @override
  $Res call({
    Object? categoryId = freezed,
  }) {
    return _then(CrudTodoConfigAddTodo(
      categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CrudTodoConfigAddTodo implements CrudTodoConfigAddTodo {
  const _$CrudTodoConfigAddTodo(this.categoryId);

  @override
  final String categoryId;

  @override
  String toString() {
    return 'CrudTodoConfig.addTodo(categoryId: $categoryId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CrudTodoConfigAddTodo &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(categoryId);

  @JsonKey(ignore: true)
  @override
  $CrudTodoConfigAddTodoCopyWith<CrudTodoConfigAddTodo> get copyWith =>
      _$CrudTodoConfigAddTodoCopyWithImpl<CrudTodoConfigAddTodo>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() categoryList,
    required TResult Function(String categoryId) todoList,
    required TResult Function(String categoryId) addTodo,
    required TResult Function(String categoryId, String todoId) updateTodo,
    required TResult Function() unknown,
  }) {
    return addTodo(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? categoryList,
    TResult Function(String categoryId)? todoList,
    TResult Function(String categoryId)? addTodo,
    TResult Function(String categoryId, String todoId)? updateTodo,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (addTodo != null) {
      return addTodo(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudTodoConfigCategoryList value) categoryList,
    required TResult Function(CrudTodoConfigTodoList value) todoList,
    required TResult Function(CrudTodoConfigAddTodo value) addTodo,
    required TResult Function(CrudTodoConfigUpdateTodo value) updateTodo,
    required TResult Function(CrudTodoConfigUnknown value) unknown,
  }) {
    return addTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudTodoConfigCategoryList value)? categoryList,
    TResult Function(CrudTodoConfigTodoList value)? todoList,
    TResult Function(CrudTodoConfigAddTodo value)? addTodo,
    TResult Function(CrudTodoConfigUpdateTodo value)? updateTodo,
    TResult Function(CrudTodoConfigUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (addTodo != null) {
      return addTodo(this);
    }
    return orElse();
  }
}

abstract class CrudTodoConfigAddTodo implements CrudTodoConfig {
  const factory CrudTodoConfigAddTodo(String categoryId) =
      _$CrudTodoConfigAddTodo;

  String get categoryId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrudTodoConfigAddTodoCopyWith<CrudTodoConfigAddTodo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrudTodoConfigUpdateTodoCopyWith<$Res> {
  factory $CrudTodoConfigUpdateTodoCopyWith(CrudTodoConfigUpdateTodo value,
          $Res Function(CrudTodoConfigUpdateTodo) then) =
      _$CrudTodoConfigUpdateTodoCopyWithImpl<$Res>;
  $Res call({String categoryId, String todoId});
}

/// @nodoc
class _$CrudTodoConfigUpdateTodoCopyWithImpl<$Res>
    extends _$CrudTodoConfigCopyWithImpl<$Res>
    implements $CrudTodoConfigUpdateTodoCopyWith<$Res> {
  _$CrudTodoConfigUpdateTodoCopyWithImpl(CrudTodoConfigUpdateTodo _value,
      $Res Function(CrudTodoConfigUpdateTodo) _then)
      : super(_value, (v) => _then(v as CrudTodoConfigUpdateTodo));

  @override
  CrudTodoConfigUpdateTodo get _value =>
      super._value as CrudTodoConfigUpdateTodo;

  @override
  $Res call({
    Object? categoryId = freezed,
    Object? todoId = freezed,
  }) {
    return _then(CrudTodoConfigUpdateTodo(
      categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      todoId == freezed
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CrudTodoConfigUpdateTodo implements CrudTodoConfigUpdateTodo {
  const _$CrudTodoConfigUpdateTodo(this.categoryId, this.todoId);

  @override
  final String categoryId;
  @override
  final String todoId;

  @override
  String toString() {
    return 'CrudTodoConfig.updateTodo(categoryId: $categoryId, todoId: $todoId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CrudTodoConfigUpdateTodo &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.todoId, todoId) ||
                const DeepCollectionEquality().equals(other.todoId, todoId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(todoId);

  @JsonKey(ignore: true)
  @override
  $CrudTodoConfigUpdateTodoCopyWith<CrudTodoConfigUpdateTodo> get copyWith =>
      _$CrudTodoConfigUpdateTodoCopyWithImpl<CrudTodoConfigUpdateTodo>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() categoryList,
    required TResult Function(String categoryId) todoList,
    required TResult Function(String categoryId) addTodo,
    required TResult Function(String categoryId, String todoId) updateTodo,
    required TResult Function() unknown,
  }) {
    return updateTodo(categoryId, todoId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? categoryList,
    TResult Function(String categoryId)? todoList,
    TResult Function(String categoryId)? addTodo,
    TResult Function(String categoryId, String todoId)? updateTodo,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (updateTodo != null) {
      return updateTodo(categoryId, todoId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudTodoConfigCategoryList value) categoryList,
    required TResult Function(CrudTodoConfigTodoList value) todoList,
    required TResult Function(CrudTodoConfigAddTodo value) addTodo,
    required TResult Function(CrudTodoConfigUpdateTodo value) updateTodo,
    required TResult Function(CrudTodoConfigUnknown value) unknown,
  }) {
    return updateTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudTodoConfigCategoryList value)? categoryList,
    TResult Function(CrudTodoConfigTodoList value)? todoList,
    TResult Function(CrudTodoConfigAddTodo value)? addTodo,
    TResult Function(CrudTodoConfigUpdateTodo value)? updateTodo,
    TResult Function(CrudTodoConfigUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (updateTodo != null) {
      return updateTodo(this);
    }
    return orElse();
  }
}

abstract class CrudTodoConfigUpdateTodo implements CrudTodoConfig {
  const factory CrudTodoConfigUpdateTodo(String categoryId, String todoId) =
      _$CrudTodoConfigUpdateTodo;

  String get categoryId => throw _privateConstructorUsedError;
  String get todoId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrudTodoConfigUpdateTodoCopyWith<CrudTodoConfigUpdateTodo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrudTodoConfigUnknownCopyWith<$Res> {
  factory $CrudTodoConfigUnknownCopyWith(CrudTodoConfigUnknown value,
          $Res Function(CrudTodoConfigUnknown) then) =
      _$CrudTodoConfigUnknownCopyWithImpl<$Res>;
}

/// @nodoc
class _$CrudTodoConfigUnknownCopyWithImpl<$Res>
    extends _$CrudTodoConfigCopyWithImpl<$Res>
    implements $CrudTodoConfigUnknownCopyWith<$Res> {
  _$CrudTodoConfigUnknownCopyWithImpl(
      CrudTodoConfigUnknown _value, $Res Function(CrudTodoConfigUnknown) _then)
      : super(_value, (v) => _then(v as CrudTodoConfigUnknown));

  @override
  CrudTodoConfigUnknown get _value => super._value as CrudTodoConfigUnknown;
}

/// @nodoc

class _$CrudTodoConfigUnknown implements CrudTodoConfigUnknown {
  const _$CrudTodoConfigUnknown();

  @override
  String toString() {
    return 'CrudTodoConfig.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CrudTodoConfigUnknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() categoryList,
    required TResult Function(String categoryId) todoList,
    required TResult Function(String categoryId) addTodo,
    required TResult Function(String categoryId, String todoId) updateTodo,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? categoryList,
    TResult Function(String categoryId)? todoList,
    TResult Function(String categoryId)? addTodo,
    TResult Function(String categoryId, String todoId)? updateTodo,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CrudTodoConfigCategoryList value) categoryList,
    required TResult Function(CrudTodoConfigTodoList value) todoList,
    required TResult Function(CrudTodoConfigAddTodo value) addTodo,
    required TResult Function(CrudTodoConfigUpdateTodo value) updateTodo,
    required TResult Function(CrudTodoConfigUnknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CrudTodoConfigCategoryList value)? categoryList,
    TResult Function(CrudTodoConfigTodoList value)? todoList,
    TResult Function(CrudTodoConfigAddTodo value)? addTodo,
    TResult Function(CrudTodoConfigUpdateTodo value)? updateTodo,
    TResult Function(CrudTodoConfigUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class CrudTodoConfigUnknown implements CrudTodoConfig {
  const factory CrudTodoConfigUnknown() = _$CrudTodoConfigUnknown;
}
