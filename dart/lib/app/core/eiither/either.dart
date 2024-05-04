sealed class Either<E extends Exception, S> {}

final class Success<E extends Exception, S> extends Either<E, S> {
  final S value;

  Success(this.value);
}

final class Failure<E extends Exception, S> extends Either<E, S> {
  final E error;

  Failure(this.error);
}
