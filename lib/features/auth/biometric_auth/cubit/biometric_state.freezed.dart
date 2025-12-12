// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometric_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BiometricState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BiometricState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BiometricState()';
  }
}

/// @nodoc
class $BiometricStateCopyWith<$Res> {
  $BiometricStateCopyWith(BiometricState _, $Res Function(BiometricState) __);
}

/// Adds pattern-matching-related methods to [BiometricState].
extension BiometricStatePatterns on BiometricState {
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
    TResult Function(_BiometricInitial value)? initial,
    TResult Function(_BiometricLoading value)? loading,
    TResult Function(_BiometricUnsupported value)? unsupported,
    TResult Function(_BiometricSuccess value)? success,
    TResult Function(_BiometricCancelled value)? cancelled,
    TResult Function(_BiometricFailure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BiometricInitial() when initial != null:
        return initial(_that);
      case _BiometricLoading() when loading != null:
        return loading(_that);
      case _BiometricUnsupported() when unsupported != null:
        return unsupported(_that);
      case _BiometricSuccess() when success != null:
        return success(_that);
      case _BiometricCancelled() when cancelled != null:
        return cancelled(_that);
      case _BiometricFailure() when failure != null:
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
    required TResult Function(_BiometricInitial value) initial,
    required TResult Function(_BiometricLoading value) loading,
    required TResult Function(_BiometricUnsupported value) unsupported,
    required TResult Function(_BiometricSuccess value) success,
    required TResult Function(_BiometricCancelled value) cancelled,
    required TResult Function(_BiometricFailure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _BiometricInitial():
        return initial(_that);
      case _BiometricLoading():
        return loading(_that);
      case _BiometricUnsupported():
        return unsupported(_that);
      case _BiometricSuccess():
        return success(_that);
      case _BiometricCancelled():
        return cancelled(_that);
      case _BiometricFailure():
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
    TResult? Function(_BiometricInitial value)? initial,
    TResult? Function(_BiometricLoading value)? loading,
    TResult? Function(_BiometricUnsupported value)? unsupported,
    TResult? Function(_BiometricSuccess value)? success,
    TResult? Function(_BiometricCancelled value)? cancelled,
    TResult? Function(_BiometricFailure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _BiometricInitial() when initial != null:
        return initial(_that);
      case _BiometricLoading() when loading != null:
        return loading(_that);
      case _BiometricUnsupported() when unsupported != null:
        return unsupported(_that);
      case _BiometricSuccess() when success != null:
        return success(_that);
      case _BiometricCancelled() when cancelled != null:
        return cancelled(_that);
      case _BiometricFailure() when failure != null:
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
    TResult Function()? unsupported,
    TResult Function(List<BiometricType> availableBiometrics, bool isEnabled,
            bool? authenticated, String? message)?
        success,
    TResult Function()? cancelled,
    TResult Function(String errorMessage, bool isCancellation)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BiometricInitial() when initial != null:
        return initial();
      case _BiometricLoading() when loading != null:
        return loading();
      case _BiometricUnsupported() when unsupported != null:
        return unsupported();
      case _BiometricSuccess() when success != null:
        return success(_that.availableBiometrics, _that.isEnabled,
            _that.authenticated, _that.message);
      case _BiometricCancelled() when cancelled != null:
        return cancelled();
      case _BiometricFailure() when failure != null:
        return failure(_that.errorMessage, _that.isCancellation);
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
    required TResult Function() unsupported,
    required TResult Function(List<BiometricType> availableBiometrics,
            bool isEnabled, bool? authenticated, String? message)
        success,
    required TResult Function() cancelled,
    required TResult Function(String errorMessage, bool isCancellation) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _BiometricInitial():
        return initial();
      case _BiometricLoading():
        return loading();
      case _BiometricUnsupported():
        return unsupported();
      case _BiometricSuccess():
        return success(_that.availableBiometrics, _that.isEnabled,
            _that.authenticated, _that.message);
      case _BiometricCancelled():
        return cancelled();
      case _BiometricFailure():
        return failure(_that.errorMessage, _that.isCancellation);
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
    TResult? Function()? unsupported,
    TResult? Function(List<BiometricType> availableBiometrics, bool isEnabled,
            bool? authenticated, String? message)?
        success,
    TResult? Function()? cancelled,
    TResult? Function(String errorMessage, bool isCancellation)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _BiometricInitial() when initial != null:
        return initial();
      case _BiometricLoading() when loading != null:
        return loading();
      case _BiometricUnsupported() when unsupported != null:
        return unsupported();
      case _BiometricSuccess() when success != null:
        return success(_that.availableBiometrics, _that.isEnabled,
            _that.authenticated, _that.message);
      case _BiometricCancelled() when cancelled != null:
        return cancelled();
      case _BiometricFailure() when failure != null:
        return failure(_that.errorMessage, _that.isCancellation);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BiometricInitial implements BiometricState {
  const _BiometricInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BiometricInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BiometricState.initial()';
  }
}

/// @nodoc

class _BiometricLoading implements BiometricState {
  const _BiometricLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BiometricLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BiometricState.loading()';
  }
}

/// @nodoc

class _BiometricUnsupported implements BiometricState {
  const _BiometricUnsupported();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BiometricUnsupported);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BiometricState.unsupported()';
  }
}

/// @nodoc

class _BiometricSuccess implements BiometricState {
  const _BiometricSuccess(
      {final List<BiometricType> availableBiometrics = const [],
      this.isEnabled = false,
      this.authenticated,
      this.message})
      : _availableBiometrics = availableBiometrics;

  final List<BiometricType> _availableBiometrics;
  @JsonKey()
  List<BiometricType> get availableBiometrics {
    if (_availableBiometrics is EqualUnmodifiableListView)
      return _availableBiometrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableBiometrics);
  }

  @JsonKey()
  final bool isEnabled;
  final bool? authenticated;
  final String? message;

  /// Create a copy of BiometricState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BiometricSuccessCopyWith<_BiometricSuccess> get copyWith =>
      __$BiometricSuccessCopyWithImpl<_BiometricSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BiometricSuccess &&
            const DeepCollectionEquality()
                .equals(other._availableBiometrics, _availableBiometrics) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.authenticated, authenticated) ||
                other.authenticated == authenticated) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_availableBiometrics),
      isEnabled,
      authenticated,
      message);

  @override
  String toString() {
    return 'BiometricState.success(availableBiometrics: $availableBiometrics, isEnabled: $isEnabled, authenticated: $authenticated, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$BiometricSuccessCopyWith<$Res>
    implements $BiometricStateCopyWith<$Res> {
  factory _$BiometricSuccessCopyWith(
          _BiometricSuccess value, $Res Function(_BiometricSuccess) _then) =
      __$BiometricSuccessCopyWithImpl;
  @useResult
  $Res call(
      {List<BiometricType> availableBiometrics,
      bool isEnabled,
      bool? authenticated,
      String? message});
}

/// @nodoc
class __$BiometricSuccessCopyWithImpl<$Res>
    implements _$BiometricSuccessCopyWith<$Res> {
  __$BiometricSuccessCopyWithImpl(this._self, this._then);

  final _BiometricSuccess _self;
  final $Res Function(_BiometricSuccess) _then;

  /// Create a copy of BiometricState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? availableBiometrics = null,
    Object? isEnabled = null,
    Object? authenticated = freezed,
    Object? message = freezed,
  }) {
    return _then(_BiometricSuccess(
      availableBiometrics: null == availableBiometrics
          ? _self._availableBiometrics
          : availableBiometrics // ignore: cast_nullable_to_non_nullable
              as List<BiometricType>,
      isEnabled: null == isEnabled
          ? _self.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      authenticated: freezed == authenticated
          ? _self.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _BiometricCancelled implements BiometricState {
  const _BiometricCancelled();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BiometricCancelled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BiometricState.cancelled()';
  }
}

/// @nodoc

class _BiometricFailure implements BiometricState {
  const _BiometricFailure(this.errorMessage, {this.isCancellation = false});

  final String errorMessage;
  @JsonKey()
  final bool isCancellation;

  /// Create a copy of BiometricState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BiometricFailureCopyWith<_BiometricFailure> get copyWith =>
      __$BiometricFailureCopyWithImpl<_BiometricFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BiometricFailure &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isCancellation, isCancellation) ||
                other.isCancellation == isCancellation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, isCancellation);

  @override
  String toString() {
    return 'BiometricState.failure(errorMessage: $errorMessage, isCancellation: $isCancellation)';
  }
}

/// @nodoc
abstract mixin class _$BiometricFailureCopyWith<$Res>
    implements $BiometricStateCopyWith<$Res> {
  factory _$BiometricFailureCopyWith(
          _BiometricFailure value, $Res Function(_BiometricFailure) _then) =
      __$BiometricFailureCopyWithImpl;
  @useResult
  $Res call({String errorMessage, bool isCancellation});
}

/// @nodoc
class __$BiometricFailureCopyWithImpl<$Res>
    implements _$BiometricFailureCopyWith<$Res> {
  __$BiometricFailureCopyWithImpl(this._self, this._then);

  final _BiometricFailure _self;
  final $Res Function(_BiometricFailure) _then;

  /// Create a copy of BiometricState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
    Object? isCancellation = null,
  }) {
    return _then(_BiometricFailure(
      null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isCancellation: null == isCancellation
          ? _self.isCancellation
          : isCancellation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
