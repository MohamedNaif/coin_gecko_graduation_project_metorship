import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';

sealed class Result<T> {
  const Result();

  R fold<R>(
    R Function(Failures failure) onFailure,
    R Function(T data) onSuccess,
  ) {
    final self = this;
    if (self is Success<T>) {
      return onSuccess(self.data);
    } else if (self is FailureResult<T>) {
      return onFailure(self.failure);
    }
    throw StateError('Unhandled Result state');
  }

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is FailureResult<T>;

  T? get dataOrNull => this is Success<T> ? (this as Success<T>).data : null;
  Failures? get failureOrNull =>
      this is FailureResult<T> ? (this as FailureResult<T>).failure : null;
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class FailureResult<T> extends Result<T> {
  final Failures failure;
  const FailureResult(this.failure);
}
