import 'package:messagepack_schema/messagepack_schema.dart';

/// Represents an union type
abstract class SchemaUnion<T extends SchemaUnion<T, TField>, TField extends Enum> extends SchemaType<T> {

  const SchemaUnion();

  /// A flag that indicates if the union has a value or not.
  bool get isSet;

  /// Contains the current field that is set
  TField get whichField;

  /// Clears the union
  void clear();

  @override
  T clone();
}