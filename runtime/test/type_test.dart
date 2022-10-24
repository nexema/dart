import 'package:test/test.dart';

import 'types/example_enum_type.dart';
import 'types/example_struct.dart';
import 'types/example_union.dart';

void main() {
  group("Test operations over types", () {
    test("Test create a new type", () {
      var instance = ExampleStruct(
        name: "hello world",
        names: ["a", "b", "goodbye world"],
        config: {
          "another": 12245615348513841,
          "min": -215154153153,
          "max": 1
        },
        anotherStruct: AnotherStruct(
          name: "another struct name",
          myEnum: ExampleEnumType.third
        )
      );

      expect(instance.name, equals("hello world"));
      expect(instance.names, orderedEquals(["a", "b", "goodbye world"]));
      expect(instance.config, equals({
        "another": 12245615348513841,
        "min": -215154153153,
        "max": 1
      }));

      instance.names = ["a"];
      expect(instance.names, equals(["a"]));
    });

    test("Test equality test", () {
      var a = ExampleStruct(
        name: "hello world",
        names: ["a", "b", "goodbye world"],
        config: {
          "another": 12245615348513841,
          "min": -215154153153,
          "max": 1
        },
        anotherStruct: AnotherStruct(
          name: "another struct name",
          myEnum: ExampleEnumType.third
        )
      );

      var b = ExampleStruct(
        name: "hello world",
        names: ["a", "b", "goodbye world"],
        config: {
          "another": 12245615348513841,
          "min": -215154153153,
          "max": 1
        },
        anotherStruct: AnotherStruct(
          name: "another struct name",
          myEnum: ExampleEnumType.third
        )
      );

      var c = ExampleStruct(
        name: "hello world",
        names: ["a", "goodbye world","b"],
        config: {
          "min": -215154153153,
          "another": 12245615348513841,
          "max": 1
        },
        anotherStruct: AnotherStruct(
          name: "another struct name",
          myEnum: ExampleEnumType.third
        )
      );

      var d = ExampleStruct(
        name: "hello world",
        names: ["a", "b", "goodbye world"],
        config: {
          "another": 12245615348513841,
          "min": -215154153153,
          "max": 1
        },
        anotherStruct: AnotherStruct(
          name: "another struct names",
          myEnum: ExampleEnumType.third
        )
      );

      expect(a, equals(b));
      expect(a, isNot(equals(c)));
      expect(b, isNot(equals(c)));
      expect(a, isNot(equals(d)));
    });

    test("Persistent hash without changes", () {
      var a = ExampleStruct(
        name: "hello world",
        names: ["a", "b", "goodbye world"],
        config: {
          "another": 12245615348513841,
          "min": -215154153153,
          "max": 1
        },
        anotherStruct: AnotherStruct(
          name: "another struct name",
          myEnum: ExampleEnumType.third
        )
      );

      int hash1 = a.hashCode;
      int hash2 = a.hashCode;

      a.name = "hello worlds";
      int hash3 = a.hashCode;

      expect(hash1, equals(hash2));
      expect(hash1, isNot(equals(hash3)));
    });

    test("Test serialize/deserialize a struct", () {
      var a = ExampleStruct(
        name: "hello world",
        names: ["a", "b", "goodbye world"],
        config: {
          "another": 12245615348513841,
          "min": -215154153153,
          "max": 1
        },
        anotherStruct: AnotherStruct(
          name: "another struct name",
          myEnum: ExampleEnumType.third
        ),
        myUnion: ExampleUnion.age(55)
      );

      expect(ExampleStruct.fromBuffer(a.serialize()), equals(a));

      a.name = null;
      expect(ExampleStruct.fromBuffer(a.serialize()), equals(a));

      a.myUnion.clear();
      expect(ExampleStruct.fromBuffer(a.serialize()), equals(a));

      a.config.clear();
      expect(ExampleStruct.fromBuffer(a.serialize()), equals(a));
    });

    test("Test merge using other instance", () {
      var a = ExampleStruct(
        name: "hello world",
        names: ["a", "b", "goodbye world"],
        anotherStruct: AnotherStruct(
          name: "another struct name",
          myEnum: ExampleEnumType.third
        ),
        myUnion: ExampleUnion.age(55)
      );

      var b = ExampleStruct(
        name: "hello world",
        names: ["a", "b", "goodbye world"],
        config: {
          "another": 12245615348513841,
          "min": -215154153153,
          "max": 1
        },
        anotherStruct: AnotherStruct(
          name: "another struct name",
          myEnum: ExampleEnumType.third
        ),
      );

      a.mergeUsing(b);
      expect(a, equals(b));
    });

    test("Test clone", () {
      var a = ExampleStruct(
        name: "hello world",
        names: ["a", "b", "goodbye world"],
        anotherStruct: AnotherStruct(
          name: "another struct name",
          myEnum: ExampleEnumType.third
        ),
        myUnion: ExampleUnion.age(55)
      );

      var b = a;
      
      expect(b, equals(a));
      
      b.names.clear();
      expect(b, equals(a));

      var c = a.clone();
      c.names.add("another");
      expect(c, isNot(equals(a)));
    });
  });
}