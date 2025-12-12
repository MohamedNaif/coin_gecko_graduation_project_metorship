// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingState()';
  }
}

/// @nodoc
class $SettingStateCopyWith<$Res> {
  $SettingStateCopyWith(SettingState _, $Res Function(SettingState) __);
}

/// Adds pattern-matching-related methods to [SettingState].
extension SettingStatePatterns on SettingState {
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
    TResult Function(_Initial value)? initial,
    TResult Function(ToggleTheme value)? toggleTheme,
    TResult Function(Loading value)? loading,
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case ToggleTheme() when toggleTheme != null:
        return toggleTheme(_that);
      case Loading() when loading != null:
        return loading(_that);
      case Failure() when failure != null:
        return failure(_that);
      case Success() when success != null:
        return success(_that);
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
    required TResult Function(_Initial value) initial,
    required TResult Function(ToggleTheme value) toggleTheme,
    required TResult Function(Loading value) loading,
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case ToggleTheme():
        return toggleTheme(_that);
      case Loading():
        return loading(_that);
      case Failure():
        return failure(_that);
      case Success():
        return success(_that);
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(ToggleTheme value)? toggleTheme,
    TResult? Function(Loading value)? loading,
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case ToggleTheme() when toggleTheme != null:
        return toggleTheme(_that);
      case Loading() when loading != null:
        return loading(_that);
      case Failure() when failure != null:
        return failure(_that);
      case Success() when success != null:
        return success(_that);
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
    TResult Function(bool isDarkMode)? toggleTheme,
    TResult Function()? loading,
    TResult Function(String errorMessage)? failure,
    TResult Function(UserModel user)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case ToggleTheme() when toggleTheme != null:
        return toggleTheme(_that.isDarkMode);
      case Loading() when loading != null:
        return loading();
      case Failure() when failure != null:
        return failure(_that.errorMessage);
      case Success() when success != null:
        return success(_that.user);
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
    required TResult Function(bool isDarkMode) toggleTheme,
    required TResult Function() loading,
    required TResult Function(String errorMessage) failure,
    required TResult Function(UserModel user) success,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case ToggleTheme():
        return toggleTheme(_that.isDarkMode);
      case Loading():
        return loading();
      case Failure():
        return failure(_that.errorMessage);
      case Success():
        return success(_that.user);
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
    TResult? Function(bool isDarkMode)? toggleTheme,
    TResult? Function()? loading,
    TResult? Function(String errorMessage)? failure,
    TResult? Function(UserModel user)? success,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case ToggleTheme() when toggleTheme != null:
        return toggleTheme(_that.isDarkMode);
      case Loading() when loading != null:
        return loading();
      case Failure() when failure != null:
        return failure(_that.errorMessage);
      case Success() when success != null:
        return success(_that.user);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements SettingState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingState.initial()';
  }
}

/// @nodoc

class ToggleTheme implements SettingState {
  const ToggleTheme({required this.isDarkMode});

  final bool isDarkMode;

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleThemeCopyWith<ToggleTheme> get copyWith =>
      _$ToggleThemeCopyWithImpl<ToggleTheme>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleTheme &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode);

  @override
  String toString() {
    return 'SettingState.toggleTheme(isDarkMode: $isDarkMode)';
  }
}

/// @nodoc
abstract mixin class $ToggleThemeCopyWith<$Res>
    implements $SettingStateCopyWith<$Res> {
  factory $ToggleThemeCopyWith(
          ToggleTheme value, $Res Function(ToggleTheme) _then) =
      _$ToggleThemeCopyWithImpl;
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class _$ToggleThemeCopyWithImpl<$Res> implements $ToggleThemeCopyWith<$Res> {
  _$ToggleThemeCopyWithImpl(this._self, this._then);

  final ToggleTheme _self;
  final $Res Function(ToggleTheme) _then;

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isDarkMode = null,
  }) {
    return _then(ToggleTheme(
      isDarkMode: null == isDarkMode
          ? _self.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class Loading implements SettingState {
  const Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingState.loading()';
  }
}

/// @nodoc

class Failure implements SettingState {
  const Failure({required this.errorMessage});

  final String errorMessage;

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailureCopyWith<Failure> get copyWith =>
      _$FailureCopyWithImpl<Failure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Failure &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'SettingState.failure(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res>
    implements $SettingStateCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) =
      _$FailureCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(Failure(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class Success implements SettingState {
  const Success({required this.user});

  final UserModel user;

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Success &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'SettingState.success(user: $user)';
  }
}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res>
    implements $SettingStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) =
      _$SuccessCopyWithImpl;
  @useResult
  $Res call({UserModel user});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(Success(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

// dart format on
