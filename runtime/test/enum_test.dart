import 'package:messagepack_schema/messagepack_schema.dart';
import 'package:test/test.dart';

import 'types/example_enum_type.dart';

void main() {
  test("Test enum equality", () {
    var enum1 = ExampleEnumType.another;
    var enum2 = ExampleEnumType.second;
    
    expect(enum1, isNot(equals(enum2)));
    expect(enum1.hashCode, isNot(equals(enum2.hashCode)));
  });

  test("Test enum lookup by index", () {
    var enum1 = ExampleEnumType.valueOf(1);
    expect(enum1, equals(ExampleEnumType.second));

    expect(() => ExampleEnumType.valueOf(5), throwsA(isA<EnumNotFound>()));
  });

  test("Test enum lookup by name", () {
    var enum1 = ExampleEnumType.fromName("third");
    expect(enum1, equals(ExampleEnumType.third));

    expect(() => ExampleEnumType.fromName("random_String"), throwsA(isA<EnumNotFound>()));
  });
}