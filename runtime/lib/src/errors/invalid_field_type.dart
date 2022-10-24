import 'package:messagepack_schema/messagepack_schema.dart';

class InvalidFieldTypeError extends Error {
  final int fieldIndex;
  final FieldValueType realValueType;
  final Object? rawValue;
  final Object? toType;

  InvalidFieldTypeError(this.fieldIndex, this.rawValue, this.realValueType, this.toType);

  @override
  String toString() => "Field $fieldIndex of type $realValueType is not a $toType. Raw: $rawValue.";
}