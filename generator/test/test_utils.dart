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

NexemaTypeDefinition getStructType(String name, List<NexemaTypeFieldDefinition> fields, {int? baseTypeId, Map<String, dynamic>? defaults, int? id, List<String>? documentation, Map<String, dynamic>? annotations}) {
  return NexemaTypeDefinition(
    id: id ?? _random.nextInt(100),
    name: name,
    annotations: annotations ?? {},
    baseType: baseTypeId,
    defaults: defaults ?? {},
    documentation: documentation ?? [],
    fields: fields,
    modifier: "struct"
  );
}

NexemaTypeDefinition getBaseType(String name, List<NexemaTypeFieldDefinition> fields, {Map<String, dynamic>? defaults, int? id, List<String>? documentation, Map<String, dynamic>? annotations}) {
  return NexemaTypeDefinition(
    id: id ?? _random.nextInt(100),
    name: name,
    annotations: annotations ?? {},
    baseType: null,
    defaults: defaults ?? {},
    documentation: documentation ?? [],
    fields: fields,
    modifier: "base"
  );
}


NexemaTypeDefinition getUnionType(String name, List<NexemaTypeFieldDefinition> fields, {Map<String, dynamic>? defaults, int? id, List<String>? documentation, Map<String, dynamic>? annotations}) {
  return NexemaTypeDefinition(
    id: id ?? _random.nextInt(100),
    name: name,
    annotations: annotations ?? {},
    baseType: null,
    defaults: defaults ?? {},
    documentation: documentation ?? [],
    fields: fields,
    modifier: "union"
  );
}

NexemaTypeFieldDefinition getField(int index, String name, NexemaValueType valueType, {Map<String, dynamic>? annotation, List<String>? documentation}) 
  => NexemaTypeFieldDefinition(
    index: index, 
    name: name, 
    annotations: annotation ?? {},
    type: valueType,
    documentation: documentation ?? []
  );

NexemaTypeFieldDefinition getEnumField(int index, String name, {List<String>? documentation, Map<String, dynamic>? annotations}) 
  => NexemaTypeFieldDefinition(
    index: index, 
    name: name,
    annotations: annotations ?? {},
    type: null,
    documentation: documentation ?? []
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

void diff(String want, String got) {
  List<String> expectedLines = want.split('\n');
  List<String> gotLines = got.split('\n');

  for(int i = 0; i < expectedLines.length; i++) {
    try {
      final gotLine = gotLines[i];
      expect(expectedLines[i], equals(gotLine), reason: "failure at line: ${expectedLines[i]} (index: $i)");
    } catch(_) {
      print("-------- GOT ----------");
      print(got);
      fail("got does not contain line ${expectedLines[i]} (index: $i)");
    }
  }

  if(gotLines.length > expectedLines.length) {
    fail("got contains more lines than want. Lines got:\n${gotLines.sublist(gotLines.length - expectedLines.length).join("\n")}");
  }

}