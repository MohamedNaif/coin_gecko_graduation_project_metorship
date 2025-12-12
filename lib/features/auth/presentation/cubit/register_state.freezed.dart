// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegisterState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterState()';
  }
}

/// @nodoc
class $RegisterStateCopyWith<$Res> {
  $RegisterStateCopyWith(RegisterState _, $Res Function(RegisterState) __);
}

/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegisterInitial value)? initial,
    TResult Function(_RegisterLoading value)? loading,
    TResult Function(_RegisterSuccess value)? success,
    TResult Function(_RegisterFailure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RegisterInitial() when initial != null:
        return initial(_that);
      case _RegisterLoading() when loading != null:
        return loading(_that);
      case _RegisterSuccess() when success != null:
        return success(_that);
      case _RegisterFailure() when failure != null:
        return failure(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegisterInitial value) initial,
    required TResult Function(_RegisterLoading value) loading,
    required TResult Function(_RegisterSuccess value) success,
    required TResult Function(_RegisterFailure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _RegisterInitial():
        return initial(_that);
      case _RegisterLoading():
        return loading(_that);
      case _RegisterSuccess():
        return success(_that);
      case _RegisterFailure():
        return failure(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegisterInitial value)? initial,
    TResult? Function(_RegisterLoading value)? loading,
    TResult? Function(_RegisterSuccess value)? success,
    TResult? Function(_RegisterFailure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _RegisterInitial() when initial != null:
        return initial(_that);
      case _RegisterLoading() when loading != null:
        return loading(_that);
      case _RegisterSuccess() when success != null:
        return success(_that);
      case _RegisterFailure() when failure != null:
        return failure(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RegisterInitial() when initial != null:
        return initial();
      case _RegisterLoading() when loading != null:
        return loading();
      case _RegisterSuccess() when success != null:
        return success();
      case _RegisterFailure() when failure != null:
        return failure(_that.errorMessage);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _RegisterInitial():
        return initial();
      case _RegisterLoading():
        return loading();
      case _RegisterSuccess():
        return success();
      case _RegisterFailure():
        return failure(_that.errorMessage);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _RegisterInitial() when initial != null:
        return initial();
      case _RegisterLoading() when loading != null:
        return loading();
      case _RegisterSuccess() when success != null:
        return success();
      case _RegisterFailure() when failure != null:
        return failure(_that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RegisterInitial implements RegisterState {
  const _RegisterInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RegisterInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterState.initial()';
  }
}

/// @nodoc

class _RegisterLoading implements RegisterState {
  const _RegisterLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RegisterLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterState.loading()';
  }
}

/// @nodoc

class _RegisterSuccess implements RegisterState {
  const _RegisterSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RegisterSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterState.success()';
  }
}

/// @nodoc

class _RegisterFailure implements RegisterState {
  const _RegisterFailure(this.errorMessage);

  final String errorMessage;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterFailureCopyWith<_RegisterFailure> get copyWith =>
      __$RegisterFailureCopyWithImpl<_RegisterFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterFailure &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'RegisterState.failure(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$RegisterFailureCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterFailureCopyWith(
          _RegisterFailure value, $Res Function(_RegisterFailure) _then) =
      __$RegisterFailureCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$RegisterFailureCopyWithImpl<$Res>
    implements _$RegisterFailureCopyWith<$Res> {
  __$RegisterFailureCopyWithImpl(this._self, this._then);

  final _RegisterFailure _self;
  final $Res Function(_RegisterFailure) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_RegisterFailure(
      null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
