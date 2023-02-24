import 'package:nexema_generator/generator.dart';
import 'package:nexema_generator/mapper.dart';
import 'package:nexema_generator/models.dart';
import 'package:test/scaffolding.dart';

import 'test_utils.dart';

void main() {
  final enumDef = NexemaTypeDefinition(
    id: 1, 
    defaults: {},
    annotations: {},
    baseType: null,
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

  final accountTypeEnumDef = NexemaTypeDefinition(
    defaults: {},
    annotations: {},
    baseType: null,
    id: 2, 
    name: "AccountType", 
    modifier: "enum", 
    documentation: [], 
    fields: [
      getEnumField(0, "unknown"),
      getEnumField(1, "customer"),
      getEnumField(2, "admin"),
    ]
  );

  final structDef = NexemaTypeDefinition(
    defaults: {},
    annotations: {},
    baseType: null,
    id: 3, 
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
      getField(17, "account_type", getTypeValueType(accountTypeEnumDef.id, true))
    ]
  );

  final unionDef = NexemaTypeDefinition(
    defaults: {},
    annotations: {},
    baseType: null,
    id: 5, 
    name: "UnionB", 
    modifier: "union", 
    documentation: [], 
    fields: [
      getField(1, "string_field", getPrimitiveValueType("string")),
      getField(2, "bool_field", getPrimitiveValueType("bool")),
      getField(3, "account_type", getTypeValueType(accountTypeEnumDef.id))
    ]
  );

  Generator(
    definition: NexemaSnapshot(
      hashcode: 0,
      version: 0,
      files: [
        NexemaFile(fileName: "file.nex", packageName: "common", path: "common/file.nex", types: [enumDef, structDef, unionDef]),
        NexemaFile(fileName: "identity.nex", packageName: "common", path: "common/file.nex", types: [accountTypeEnumDef])
      ]
    ),
    settings: GeneratorSettings(
      outputPath: "./example/lib/generated",
    )
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