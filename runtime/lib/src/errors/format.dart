// coverage:ignore-file
class FormatError extends Error {
  final String message;

  FormatError(this.message);

  @override
  String toString() => message;

  @override
  int get hashCode => message.hashCode;
  
  @override
  bool operator ==(Object other) => other is FormatError ? other.message == message : false;
}