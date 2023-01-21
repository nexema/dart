// coverage:ignore-file

class FieldNotNullableError extends Error {
  final int fieldIndex;

  FieldNotNullableError(this.fieldIndex);

  @override
  String toString() => "Trying to assign a null value to a field ($fieldIndex) which is not nullable.";
}