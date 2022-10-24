class FormatError extends Error {
  final String message;

  FormatError(this.message);

  @override
  String toString() => message;
}