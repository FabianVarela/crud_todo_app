// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoState()';
}


}

/// @nodoc
class $TodoStateCopyWith<$Res>  {
$TodoStateCopyWith(TodoState _, $Res Function(TodoState) __);
}


/// @nodoc


class TodoStateInitial implements TodoState {
  const TodoStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoState.initial()';
}


}




/// @nodoc


class TodoStateLoading implements TodoState {
  const TodoStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoState.loading()';
}


}




/// @nodoc


class TodoStateSuccess implements TodoState {
  const TodoStateSuccess(this.action);
  

 final  TodoAction action;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoStateSuccessCopyWith<TodoStateSuccess> get copyWith => _$TodoStateSuccessCopyWithImpl<TodoStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoStateSuccess&&(identical(other.action, action) || other.action == action));
}


@override
int get hashCode => Object.hash(runtimeType,action);

@override
String toString() {
  return 'TodoState.success(action: $action)';
}


}

/// @nodoc
abstract mixin class $TodoStateSuccessCopyWith<$Res> implements $TodoStateCopyWith<$Res> {
  factory $TodoStateSuccessCopyWith(TodoStateSuccess value, $Res Function(TodoStateSuccess) _then) = _$TodoStateSuccessCopyWithImpl;
@useResult
$Res call({
 TodoAction action
});




}
/// @nodoc
class _$TodoStateSuccessCopyWithImpl<$Res>
    implements $TodoStateSuccessCopyWith<$Res> {
  _$TodoStateSuccessCopyWithImpl(this._self, this._then);

  final TodoStateSuccess _self;
  final $Res Function(TodoStateSuccess) _then;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? action = null,}) {
  return _then(TodoStateSuccess(
null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as TodoAction,
  ));
}


}

/// @nodoc


class TodoStateError implements TodoState {
  const TodoStateError([this.message]);
  

 final  String? message;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoStateErrorCopyWith<TodoStateError> get copyWith => _$TodoStateErrorCopyWithImpl<TodoStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TodoState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TodoStateErrorCopyWith<$Res> implements $TodoStateCopyWith<$Res> {
  factory $TodoStateErrorCopyWith(TodoStateError value, $Res Function(TodoStateError) _then) = _$TodoStateErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$TodoStateErrorCopyWithImpl<$Res>
    implements $TodoStateErrorCopyWith<$Res> {
  _$TodoStateErrorCopyWithImpl(this._self, this._then);

  final TodoStateError _self;
  final $Res Function(TodoStateError) _then;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(TodoStateError(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
