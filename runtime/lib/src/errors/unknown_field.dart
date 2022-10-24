class UnknownFieldError extends Error {
  final int fieldIndex;

  UnknownFieldError(this.fieldIndex);

  @override
  String toString() => "Unknown field with index $fieldIndex";
}