import 'dart:io';

import 'package:nexema_generator/generator.dart';
import 'package:nexema_generator/mapper.dart';
import 'package:nexema_generator/models.dart';
import 'package:test/scaffolding.dart';

import 'test_utils.dart';

void main() {
  final enumDef = NexemaTypeDefinition(
    id: "enum1", 
    name: "EnumA", 
    modifier: "enum", 
    documentation: [], 
    fields: [
      getEnumField(0, "unknown"),
      getEnumField(1, "red"),
      getEnumField(2, "green"),
      getEnumField(3, "blue"),
    ]
  );

  final structDef = NexemaTypeDefinition(
    id: "struct1", 
    name: "StructA", 
    modifier: "struct", 
    documentation: ["Documentation for StructA"], 
    fields: [
      ...List.generate(kPrimitiveMapper.keys.length, (index) {
        var primitive = kPrimitiveMapper.keys.elementAt(index);
        return getField(index, "${primitive}_field", getPrimitiveValueType(primitive));
      }),
      getField(15, "enum_field", getTypeValueType(enumDef.id)),
      getField(16, "nullable_enum", getTypeValueType(enumDef.id, true)),
    ]
  );

  final unionDef = NexemaTypeDefinition(
    id: "union1", 
    name: "UnionB", 
    modifier: "union", 
    documentation: [], 
    fields: [
      getField(1, "string_field", getPrimitiveValueType("string")),
      getField(2, "bool_field", getPrimitiveValueType("bool")),
    ]
  );

  Generator(
    definition: NexemaDefinition(
      hashcode: 0,
      version: 0,
      files: [
        NexemaFile(name: "file.nex", types: [enumDef, structDef, unionDef]),
      ]
    ),
    outputPath: "./example/lib/generated"
  );

  group("StructGenerator", () {
    test("Test generate struct", () {
      Generator.defaultGenerator.generate();
      for(var entry in Generator.defaultGenerator.generatedSourceCode.entries) {
        entry.key.createSync(recursive: true);
        entry.key.writeAsStringSync(entry.value);
      }
    });
  });
}