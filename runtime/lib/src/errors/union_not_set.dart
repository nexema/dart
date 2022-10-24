// ignore_for_file: prefer_initializing_formals

class UnionNotSetError extends Error {
  final int? fieldIndex;
  
  UnionNotSetError(int fieldIndex) : fieldIndex = fieldIndex;
  UnionNotSetError.notSet() : fieldIndex = null;

  @override
  String toString() => fieldIndex == null ? "Union does not have any value." : "Union is not $fieldIndex at this time.";
}