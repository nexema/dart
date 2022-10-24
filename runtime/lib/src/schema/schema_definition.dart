import 'package:messagepack_schema/messagepack_schema.dart';

typedef DefaultValueGetter = Object Function(List? arguments);

abstract class SchemaDefinition<T extends SchemaType<T>> {
  final List<FieldInfo> _fields;
  
  ///The list of fields in the schema type.
  List<FieldInfo> get fields => _fields;

  SchemaDefinition(List<FieldInfo> fields) : _fields = List.unmodifiable(fields);
}