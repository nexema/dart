// coverage:ignore-file
class ValueNullError extends Error {
  final String message;

  ValueNullError(this.message);

  @override
  String toString() => message;
}