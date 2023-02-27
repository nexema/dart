import 'package:nexema_generator/generator/base/base_generator.dart';
import 'package:nexema_generator/models.dart';
import 'package:test/test.dart';

import 'test_utils.dart';

void main() {
  group("Test BaseTypeGenerator", () {
    test("Base with primitives", () {
      final file = NexemaFile(
        fileName: "my_file.nex",
        packageName: "root",
        path: "root/my_file.nex",
        types: []
      );

      final input = getStructType("BaseA", [
        getField(0, "string_field", getPrimitiveValueType("string")),
        getField(1, "bool_field", getPrimitiveValueType("bool")),
        getField(2, "int_field", getPrimitiveValueType("int")),
        getField(3, "uint_field", getPrimitiveValueType("uint")),
        getField(4, "int8_field", getPrimitiveValueType("int8")),
        getField(5, "int16_field", getPrimitiveValueType("int16")),
        getField(6, "int32_field", getPrimitiveValueType("int32")),
        getField(7, "int64_field", getPrimitiveValueType("int64")),
        getField(8, "uint8_field", getPrimitiveValueType("uint8")),
      ]);

      String got = BaseGenerator.generateFor(file, input);
      String want = r"""
abstract class BaseA extends $nex.NexemaType {
  BaseA(super.reflection$);

  $core.String get stringField;
  set stringField($core.String value);

  $core.bool get boolField;
  set boolField($core.bool value);

  $core.int get intField;
  set intField($core.int value);

  $core.BigInt get uintField;
  set uintField($core.BigInt value);

  $core.int get int8Field;
  set int8Field($core.int value);

  $core.int get int16Field;
  set int16Field($core.int value);

  $core.int get int32Field;
  set int32Field($core.int value);

  $core.int get int64Field;
  set int64Field($core.int value);

  $core.int get uint8Field;
  set uint8Field($core.int value);
}
""";

        expect(formatDartCode(got), equals(formatDartCode(want)));
    });
  });
}