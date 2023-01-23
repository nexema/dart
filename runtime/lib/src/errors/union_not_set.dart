// ignore_for_file: prefer_initializing_formals
// coverage:ignore-file

class UnionNotSetError extends Error {
  final String? fieldName;
  
  UnionNotSetError(String fieldName) : fieldName = fieldName;
  UnionNotSetError.notSet() : fieldName = null;

  @override
  String toString() => fieldName == null ? "Union does not have any value." : "Union is not $fieldName at this time.";
}