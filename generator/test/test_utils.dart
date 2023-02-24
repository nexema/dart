import 'dart:io';
import 'dart:math';

import 'package:dart_style/dart_style.dart';
import 'package:nexema_generator/models.dart';
import 'package:test/test.dart';

final _random = Random.secure();
NexemaTypeDefinition getEnumType(String name, List<NexemaTypeFieldDefinition> fields, {int? id, List<String>? documentation, Map<String, dynamic>? annotations}) {
  return NexemaTypeDefinition(
    id: id ?? _random.nextInt(100),
    name: name,
    annotations: annotations ?? {},
    baseType: null,
    defaults: {},
    documentation: documentation ?? [],
    fields: fields,
    modifier: "enum"
  );
}

NexemaTypeFieldDefinition getField(int index, String name, NexemaValueType valueType, {Map<String, dynamic>? metadata, Object? defaultValue}) 
  => NexemaTypeFieldDefinition(
    index: index, 
    name: name, 
    defaults: {},
    annotations: {},
    type: valueType
  );

NexemaTypeFieldDefinition getEnumField(int index, String name) 
  => NexemaTypeFieldDefinition(
    index: index, 
    name: name, 
    defaults: {},
    annotations: {},
    type: null
  );

NexemaValueType getPrimitiveValueType(String primitive, [bool nullable = false])
  => NexemaPrimitiveValueType(
    nullable: nullable, 
    primitive: primitive, 
    arguments: []
  );

NexemaValueType getListValueType(NexemaValueType typeArgument, [bool nullable = false])
  => NexemaPrimitiveValueType(
    nullable: nullable, 
    primitive: "list", 
    arguments: [typeArgument]
  );

NexemaValueType getMapValueType(NexemaValueType keyType, NexemaValueType valueType, [bool nullable = false])
  => NexemaPrimitiveValueType(
    nullable: nullable, 
    primitive: "map", 
    arguments: [keyType, valueType]
  );

NexemaValueType getTypeValueType(int typeId, [bool nullable = false])
  => NexemaTypeValueType(
    nullable: nullable, 
    objectId: typeId,
  );

final _formatter = DartFormatter();
String formatDartCode(String input) {
  try {
    return _formatter.format(input);
  } catch(err) {
    fail("could not format dart code. Error: $err.\nInput: $input");
  }
}