import 'package:messagepack_schema/messagepack_schema.dart';
import 'package:messagepack_schema/src/constants/numbers.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group("MessagePackWriter tests", () {
   test("Test serialize uint", () {
      expect(_write(FieldValueType.uint8, Numbers.uint8MaxValue).read(FieldValueType.uint8), equals(Numbers.uint8MaxValue));  
      expect(_write(FieldValueType.uint16, Numbers.uint16MaxValue).read(FieldValueType.uint16), equals(Numbers.uint16MaxValue));  
      expect(_write(FieldValueType.uint32, Numbers.uint32MaxValue).read(FieldValueType.uint32), equals(Numbers.uint32MaxValue));  
      expect(_write(FieldValueType.uint64, BigInt.parse("322")).read(FieldValueType.uint64), equals(BigInt.parse("322")));  
      expect(_write(FieldValueType.uint64, BigInt.parse("1")).read(FieldValueType.uint64), equals(BigInt.parse("1")));  
      expect(_write(FieldValueType.uint64, BigInt.parse("3226526265")).read(FieldValueType.uint64), equals(BigInt.parse("3226526265")));  
      expect(_write(FieldValueType.uint64, Numbers.uint64MaxValue).read(FieldValueType.uint64), equals(Numbers.uint64MaxValue));  
    });

    test("Test serialize int", () {
      expect(_write(FieldValueType.int8, Numbers.int8MaxValue).read(FieldValueType.int8), equals(Numbers.int8MaxValue));  
      expect(_write(FieldValueType.int16, Numbers.int16MaxValue).read(FieldValueType.int16), equals(Numbers.int16MaxValue));  
      expect(_write(FieldValueType.int32, Numbers.int32MaxValue).read(FieldValueType.int32), equals(Numbers.int32MaxValue));  
      expect(_write(FieldValueType.int64, Numbers.int64MaxValue).read(FieldValueType.int64), equals(Numbers.int64MaxValue));  
    });

    test("Test serialize int out of bounds", () {
      expect(() => _write(FieldValueType.int8, Numbers.int16MaxValue), throwsA(isA<FormatError>()));  
      expect(() => _write(FieldValueType.int16, Numbers.int32MaxValue), throwsA(isA<FormatError>()));  
      expect(() => _write(FieldValueType.int32, Numbers.int64MaxValue), throwsA(isA<FormatError>()));  
    });

    test("Test serialize uint out of bounds", () {
      expect(() => _write(FieldValueType.uint8, Numbers.uint16MaxValue), throwsA(isA<FormatError>()));  
      expect(() => _write(FieldValueType.uint16, Numbers.uint32MaxValue), throwsA(isA<FormatError>()));  
    });
  
    test("Test serialize string", () {
      expect(_write(FieldValueType.string, "this is my random string").read(FieldValueType.string), "this is my random string");
    });

    test("Test serialize array", () {
      expect(_write(FieldValueType.list, List.filled(2, true), [FieldValueType.boolean]).read(FieldValueType.list, [FieldValueType.boolean]), List.filled(2, true));
      expect(_write(FieldValueType.list, List.filled(5, Numbers.uint8MaxValue), [FieldValueType.uint8]).read(FieldValueType.list, [FieldValueType.uint8]), List.filled(5, Numbers.uint8MaxValue));
      expect(_write(FieldValueType.list, List.filled(5, Numbers.uint16MaxValue), [FieldValueType.uint16]).read(FieldValueType.list, [FieldValueType.uint16]), List.filled(5, Numbers.uint16MaxValue));
      expect(_write(FieldValueType.list, List.filled(5, Numbers.uint32MaxValue), [FieldValueType.uint32]).read(FieldValueType.list, [FieldValueType.uint32]), List.filled(5, Numbers.uint32MaxValue));
      expect(_write(FieldValueType.list, List.filled(5, Numbers.uint64MaxValue), [FieldValueType.uint64]).read(FieldValueType.list, [FieldValueType.uint64]), List.filled(5, Numbers.uint64MaxValue));
    });

    test("Test serialize map", () {
      expect(_write(FieldValueType.map, <BigInt, String>{
        Numbers.uint64MaxValue: "a random string on a uint64 key",
        BigInt.parse("3226526265"): "awmgklawjklgjawklgjkl",
        BigInt.from(23): "a random 23 bigint bigboy",
      }, [FieldValueType.uint64, FieldValueType.string]).read(FieldValueType.map, [FieldValueType.uint64, FieldValueType.string]), {
        Numbers.uint64MaxValue: "a random string on a uint64 key",
        BigInt.parse("3226526265"): "awmgklawjklgjawklgjkl",
        BigInt.from(23): "a random 23 bigint bigboy",
      });

      expect(_write(FieldValueType.map, <String, bool>{
        "hello world": true,
        "hello guys": false,
        "goodbye": true
      }, [FieldValueType.string, FieldValueType.boolean]).read(FieldValueType.map, [FieldValueType.string, FieldValueType.boolean]), {
        "hello world": true,
        "hello guys": false,
        "goodbye": true
      });

      expect(_write(FieldValueType.map, <double, bool>{
        3253.32561: true,
        351.3333: false,
        2.1: true
      }, [FieldValueType.float64, FieldValueType.boolean]).read(FieldValueType.map, [FieldValueType.float64, FieldValueType.boolean]), {
        3253.32561: true,
        351.3333: false,
        2.1: true
      });
    });
  });
}

MessagePackWriter _write(FieldValueType valueType, dynamic value, [List<FieldValueType>? typeArguments]) {
  return MessagePackWriter()..write(valueType, value, typeArguments);
}

extension _Reader on MessagePackWriter {
  dynamic read(FieldValueType valueType, [List<FieldValueType>? typeArguments]) {
    var buf = takeBytes();
    return MessagePackReader(buf).read(valueType, typeArguments: typeArguments);
  }
}