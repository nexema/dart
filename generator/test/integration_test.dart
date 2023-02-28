import 'dart:io';

import 'package:nexema_generator/generator/generator.dart';
import 'package:nexema_generator/models.dart';
import 'package:path/path.dart' as path;
import 'package:test/test.dart';

import 'test_utils.dart';

void main() {
  test("integration test", () {
    /*
    The snapshot test will represent the following tree structure:
    nexema.yaml
    common/
      foo.nex -> FooStruct(1), FooUnion(2)
      bar.nex -> BarEnum(3), BarBase(7)
    another/
      baz.nex -> BazEnum(4)
      nested/
        ted.nex -> TedUnion(5), TedStruct(6)


    foo.nex will import another/baz.nex and another/nested/ted.nex
    ted.nex will import bar.nex
    */
    
    final snapshot = NexemaSnapshot(
      version: 1, 
      hashcode: 1, 
      files: [
        NexemaFile(
          id: 1,
          fileName: "foo.nex",
          packageName: "common",
          path: "common",
          types: [
            getStructType("FooStruct", [
              getField(1, "string_field", getPrimitiveValueType("string")),
              getField(2, "baz_enum_field", getTypeValueType(4)),
              getField(3, "ted_union_field", getTypeValueType(6)),
              getField(4, "datetime_field", getPrimitiveValueType("timestamp")),
              getField(5, "duration_field", getPrimitiveValueType("duration")),
            ], id: 1),
            getUnionType("FooUnion", [
              getField(1, "bool_field", getPrimitiveValueType("bool")),
              getField(2, "baz_enum_list_field", getListValueType(getTypeValueType(6, true))),
            ], id: 2)
          ]
        ),
        NexemaFile(
          id: 2,
          fileName: "bar.nex",
          packageName: "common",
          path: "common",
          types: [
            getEnumType("BarEnum", [
              getEnumField(0, "unknown"),
              getEnumField(1, "first"),
              getEnumField(2, "second"),
            ], id: 3),
            getBaseType("BarBase", [
              getField(1, "binary_field", getPrimitiveValueType("binary")),
              getField(2, "uint32_field", getPrimitiveValueType("uint32")),
            ], id: 7)
          ]
        ),
        NexemaFile(
          id: 3,
          fileName: "baz.nex",
          packageName: "another",
          path: "another",
          types: [
            getEnumType("BazEnum", [
              getEnumField(0, "unknown"),
              getEnumField(1, "red"),
              getEnumField(2, "another_color"),
            ], id: 4)
          ]
        ),
        NexemaFile(
          id: 4,
          fileName: "ted.nex",
          packageName: "nested",
          path: "another/nested",
          types: [
            getUnionType("TedUnion", [
              getField(1, "list_field", getListValueType(getPrimitiveValueType("string"))),
              getField(2, "map_field", getMapValueType(getPrimitiveValueType("int32"), getPrimitiveValueType("int")))
            ], id: 5),
            getStructType("TedStruct", [
              getField(1, "int64_field", getPrimitiveValueType("int64")),
              getField(2, "list_bool_field", getListValueType(getPrimitiveValueType("bool")))
            ], id: 6, baseTypeId: 7)
          ]
        )
      ]
    );

    final generator = Generator(
      snapshot: snapshot, 
      settings: GeneratorSettings(outputPath: "example/lib/generated")
    );

    final result = generator.run();
    expect(result.exitCode, equals(0));
    expect(result.files, hasLength(4));
    for(var file in result.files) {
      final p = path.join("example/lib/generated", snapshot.files.firstWhere((element) => element.id == file.id).path, file.name);
      File(p)
        ..createSync(recursive: true)
        ..writeAsStringSync(file.contents);
    }
  });
}