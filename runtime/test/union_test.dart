import 'package:messagepack_schema/messagepack_schema.dart';
import 'package:test/test.dart';

import 'types/example_union.dart';

void main() {
  test("Test union creation", () {
    var union1 = ExampleUnion.name("my name");
    expect(union1.isSet, isTrue);
    expect(union1.whichField, equals(ExampleUnionFields.name));

    var union2 = ExampleUnion.enabled(false);
    expect(union2.isSet, isTrue);
    expect(union2.whichField, equals(ExampleUnionFields.enabled));

    var union3 = ExampleUnion.age(21);
    expect(union3.isSet, isTrue);
    expect(union3.whichField, equals(ExampleUnionFields.age));
  });

  test("Test union modification", () {
    var union1 = ExampleUnion.name("my name");
    expect(union1.isSet, isTrue);
    expect(union1.whichField, equals(ExampleUnionFields.name));

    union1.clear();
    expect(union1.isSet, isFalse);
    expect(union1.whichField, ExampleUnionFields.none);

    union1.enabled = true;
    expect(union1.whichField, ExampleUnionFields.enabled);

    union1.name = "hello";
    union1.age = 5;
    expect(union1.isSet, isTrue);
    expect(union1.whichField, ExampleUnionFields.age);
    expect(() => union1.name, throwsA(isA<UnionNotSetError>()));

    union1.clear();
    expect(() => union1.age, throwsA(isA<UnionNotSetError>()));
  });

  test("Test union equality", () {
    var union1 = ExampleUnion.name("my name");
    var union2 = ExampleUnion.name("my name");
    var union3 = ExampleUnion.age(5552);

    expect(union1, equals(union2));
    expect(union1, isNot(equals(union3)));
    expect(union2, isNot(equals(union3)));

    union3.name = "my name";
    expect(union3, equals(union1));
    expect(union3, equals(union2));

    union1.clear();
    expect(() => union1.hashCode, throwsA(isA<UnionNotSetError>()));
  });
}