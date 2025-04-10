// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crud_todo_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CrudTodoConfig {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CrudTodoConfig);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CrudTodoConfig()';
}


}

/// @nodoc
class $CrudTodoConfigCopyWith<$Res>  {
$CrudTodoConfigCopyWith(CrudTodoConfig _, $Res Function(CrudTodoConfig) __);
}


/// @nodoc


class CrudTodoConfigCategoryList implements CrudTodoConfig {
  const CrudTodoConfigCategoryList();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CrudTodoConfigCategoryList);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CrudTodoConfig.categoryList()';
}


}




/// @nodoc


class CrudTodoConfigAddCategory implements CrudTodoConfig {
  const CrudTodoConfigAddCategory();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CrudTodoConfigAddCategory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CrudTodoConfig.addCategory()';
}


}




/// @nodoc


class CrudTodoConfigTodoList implements CrudTodoConfig {
  const CrudTodoConfigTodoList({required this.categoryId});
  

 final  String categoryId;

/// Create a copy of CrudTodoConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CrudTodoConfigTodoListCopyWith<CrudTodoConfigTodoList> get copyWith => _$CrudTodoConfigTodoListCopyWithImpl<CrudTodoConfigTodoList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CrudTodoConfigTodoList&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'CrudTodoConfig.todoList(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $CrudTodoConfigTodoListCopyWith<$Res> implements $CrudTodoConfigCopyWith<$Res> {
  factory $CrudTodoConfigTodoListCopyWith(CrudTodoConfigTodoList value, $Res Function(CrudTodoConfigTodoList) _then) = _$CrudTodoConfigTodoListCopyWithImpl;
@useResult
$Res call({
 String categoryId
});




}
/// @nodoc
class _$CrudTodoConfigTodoListCopyWithImpl<$Res>
    implements $CrudTodoConfigTodoListCopyWith<$Res> {
  _$CrudTodoConfigTodoListCopyWithImpl(this._self, this._then);

  final CrudTodoConfigTodoList _self;
  final $Res Function(CrudTodoConfigTodoList) _then;

/// Create a copy of CrudTodoConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,}) {
  return _then(CrudTodoConfigTodoList(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CrudTodoConfigAddTodo implements CrudTodoConfig {
  const CrudTodoConfigAddTodo({required this.categoryId});
  

 final  String categoryId;

/// Create a copy of CrudTodoConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CrudTodoConfigAddTodoCopyWith<CrudTodoConfigAddTodo> get copyWith => _$CrudTodoConfigAddTodoCopyWithImpl<CrudTodoConfigAddTodo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CrudTodoConfigAddTodo&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'CrudTodoConfig.addTodo(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $CrudTodoConfigAddTodoCopyWith<$Res> implements $CrudTodoConfigCopyWith<$Res> {
  factory $CrudTodoConfigAddTodoCopyWith(CrudTodoConfigAddTodo value, $Res Function(CrudTodoConfigAddTodo) _then) = _$CrudTodoConfigAddTodoCopyWithImpl;
@useResult
$Res call({
 String categoryId
});




}
/// @nodoc
class _$CrudTodoConfigAddTodoCopyWithImpl<$Res>
    implements $CrudTodoConfigAddTodoCopyWith<$Res> {
  _$CrudTodoConfigAddTodoCopyWithImpl(this._self, this._then);

  final CrudTodoConfigAddTodo _self;
  final $Res Function(CrudTodoConfigAddTodo) _then;

/// Create a copy of CrudTodoConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,}) {
  return _then(CrudTodoConfigAddTodo(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CrudTodoConfigUpdateTodo implements CrudTodoConfig {
  const CrudTodoConfigUpdateTodo({required this.categoryId, required this.todoId});
  

 final  String categoryId;
 final  String todoId;

/// Create a copy of CrudTodoConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CrudTodoConfigUpdateTodoCopyWith<CrudTodoConfigUpdateTodo> get copyWith => _$CrudTodoConfigUpdateTodoCopyWithImpl<CrudTodoConfigUpdateTodo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CrudTodoConfigUpdateTodo&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.todoId, todoId) || other.todoId == todoId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,todoId);

@override
String toString() {
  return 'CrudTodoConfig.updateTodo(categoryId: $categoryId, todoId: $todoId)';
}


}

/// @nodoc
abstract mixin class $CrudTodoConfigUpdateTodoCopyWith<$Res> implements $CrudTodoConfigCopyWith<$Res> {
  factory $CrudTodoConfigUpdateTodoCopyWith(CrudTodoConfigUpdateTodo value, $Res Function(CrudTodoConfigUpdateTodo) _then) = _$CrudTodoConfigUpdateTodoCopyWithImpl;
@useResult
$Res call({
 String categoryId, String todoId
});




}
/// @nodoc
class _$CrudTodoConfigUpdateTodoCopyWithImpl<$Res>
    implements $CrudTodoConfigUpdateTodoCopyWith<$Res> {
  _$CrudTodoConfigUpdateTodoCopyWithImpl(this._self, this._then);

  final CrudTodoConfigUpdateTodo _self;
  final $Res Function(CrudTodoConfigUpdateTodo) _then;

/// Create a copy of CrudTodoConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? todoId = null,}) {
  return _then(CrudTodoConfigUpdateTodo(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,todoId: null == todoId ? _self.todoId : todoId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CrudTodoConfigUnknown implements CrudTodoConfig {
  const CrudTodoConfigUnknown();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CrudTodoConfigUnknown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CrudTodoConfig.unknown()';
}


}




// dart format on
