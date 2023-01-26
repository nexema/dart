import 'package:dart_style/dart_style.dart';
import 'package:nexema_generator/generator.dart';
import 'package:nexema_generator/mapper.dart';
import 'package:nexema_generator/models.dart';
import 'package:nexema_generator/struct_generator.dart';
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

  Generator(NexemaDefinition(
    hashcode: 0,
    version: 0,
    files: [
      NexemaFile(name: "file.nex", types: [enumDef, structDef]),
    ]
  ));

  group("StructGenerator", () {
    test("Test generate struct", () {
      String sourceCode = Generator.defaultGenerator.generateDefinition(structDef);
      try {
        sourceCode = DartFormatter(fixes: StyleFix.all).format(sourceCode);
        print(sourceCode);
      } catch(err) {
        print(sourceCode);
        rethrow;
      }
    });
  });
}