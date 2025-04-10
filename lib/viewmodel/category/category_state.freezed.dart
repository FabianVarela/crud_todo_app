// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState()';
}


}

/// @nodoc
class $CategoryStateCopyWith<$Res>  {
$CategoryStateCopyWith(CategoryState _, $Res Function(CategoryState) __);
}


/// @nodoc


class CategoryStateInitial implements CategoryState {
  const CategoryStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.initial()';
}


}




/// @nodoc


class CategoryStateLoading implements CategoryState {
  const CategoryStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.loading()';
}


}




/// @nodoc


class CategoryStateSuccess implements CategoryState {
  const CategoryStateSuccess(this.action);
  

 final  CategoryAction action;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryStateSuccessCopyWith<CategoryStateSuccess> get copyWith => _$CategoryStateSuccessCopyWithImpl<CategoryStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryStateSuccess&&(identical(other.action, action) || other.action == action));
}


@override
int get hashCode => Object.hash(runtimeType,action);

@override
String toString() {
  return 'CategoryState.success(action: $action)';
}


}

/// @nodoc
abstract mixin class $CategoryStateSuccessCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $CategoryStateSuccessCopyWith(CategoryStateSuccess value, $Res Function(CategoryStateSuccess) _then) = _$CategoryStateSuccessCopyWithImpl;
@useResult
$Res call({
 CategoryAction action
});




}
/// @nodoc
class _$CategoryStateSuccessCopyWithImpl<$Res>
    implements $CategoryStateSuccessCopyWith<$Res> {
  _$CategoryStateSuccessCopyWithImpl(this._self, this._then);

  final CategoryStateSuccess _self;
  final $Res Function(CategoryStateSuccess) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? action = null,}) {
  return _then(CategoryStateSuccess(
null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as CategoryAction,
  ));
}


}

/// @nodoc


class CategoryStateError implements CategoryState {
  const CategoryStateError([this.message]);
  

 final  String? message;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryStateErrorCopyWith<CategoryStateError> get copyWith => _$CategoryStateErrorCopyWithImpl<CategoryStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CategoryState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CategoryStateErrorCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $CategoryStateErrorCopyWith(CategoryStateError value, $Res Function(CategoryStateError) _then) = _$CategoryStateErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$CategoryStateErrorCopyWithImpl<$Res>
    implements $CategoryStateErrorCopyWith<$Res> {
  _$CategoryStateErrorCopyWithImpl(this._self, this._then);

  final CategoryStateError _self;
  final $Res Function(CategoryStateError) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(CategoryStateError(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
